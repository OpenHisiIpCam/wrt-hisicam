#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/un.h>

void return500() {
    printf("Status: 500 Internal Server Error\r\n");
    printf("Content-Type: text/html\r\n\r\n");
    printf("<h1>Internal Server Error!</h1>");
}


int main(void) {

    char *REQUEST_METHOD = getenv("REQUEST_METHOD");
    //char *PATH_INFO = getenv("PATH_INFO");
    //char *PATH_TRANSLATED = getenv("PATH_TRANSLATED");
    //char *SCRIPT_NAME = getenv("SCRIPT_NAME");
    char *QUERY_STRING = getenv("QUERY_STRING");
    //char *REMOTE_HOST = getenv("REMOTE_HOST");
    char *CONTENT_TYPE = getenv("CONTENT_TYPE");
    char *CONTENT_LENGTH = getenv("CONTENT_LENGTH");
    //char *HTTP_USER_AGENT = getenv("HTTP_USER_AGENT");
    //char *HTTP_ACCEPT = getenv("HTTP_ACCEPT");
    /*
        - REQUEST_METHOD The specific request that the client used to fetch the page (that is, to invoke the CGI program): usually GET or POST.
        - PATH_INFO Any extra path information that appeared after the program name in the URL that invoked this CGI program.
        - PATH_TRANSLATED The path information from PATH_INFO, with any ``virtual-to-physical mapping'' performed on it.
        - SCRIPT_NAME The actual name of the CGI program that is running, as a URL, in case the generated page needs to reference itself.
        - QUERY_STRING The query being performed by the user. In the case of form processing, the QUERY_STRING variable contains encoded information about each field filled in by the user. (We'll have much more to say about QUERY_STRING in a bit.)
        - REMOTE_HOST The hostname of the client (if known).
        - CONTENT_TYPE The HTTP/MIME content type of the attached information, for queries (such as POST) with attached information.
        - CONTENT_LENGTH The size of the attached information, if any.
        - HTTP_USER_AGENT An indication of the name and version of the client browser in use.
        - HTTP_ACCEPT The specification by the client browser of which document types it will accept.
    */

    if (*QUERY_STRING == '\0') {
        QUERY_STRING = "/";
    }

    #define MAXINPUT 1024
    char input[MAXINPUT];
    long input_len; 

    if (CONTENT_LENGTH != NULL && sscanf(CONTENT_LENGTH, "%ld", &input_len) == 1 && input_len < MAXINPUT ) {
        fgets(input, input_len+1, stdin);
    } else {
        input_len = 0;
    }

    int fd;
	struct sockaddr_un addr;

	if ((fd = socket(AF_LOCAL, SOCK_STREAM, 0)) < 0) {
        return500(); //printf("status: 500\r\n");
        return -1;
	}

    #define SERVER_SOCK_FILE "/tmp/application.sock"

	memset(&addr, 0, sizeof(addr));
	addr.sun_family = AF_LOCAL;
	strcpy(addr.sun_path, SERVER_SOCK_FILE);

    if (connect(fd, (struct sockaddr *)&addr, sizeof(addr)) == -1) {
        return500();//printf("status: 500\r\n");
		close(fd);
        return -1;
	}
    
    #define MAXREQUEST  1024
    char request[MAXREQUEST];
    int request_len;

    //TODO check REQUEST_METHOD and QUERY_STRING

    request_len = sprintf(request, "%s %s HTTP/1.0\r\n", REQUEST_METHOD, QUERY_STRING);

    if (send(fd, request, request_len, 0) == -1) {
        return500(); //printf("status: 500\r\n");
        return -1;
    }

    if (input_len > 0) {
        request_len = sprintf(request, "Content-Type: %s\r\nContent-Length: %d\r\n", CONTENT_TYPE, input_len);

        if (send(fd, request, request_len, 0) == -1) {
            return500();//printf("status: 500\r\n");
            return -1;
        }

        if (send(fd, input, input_len, 0) == -1) {
            return500(); //printf("status: 500\r\n");
            return -1;
        }
    }

    if (send(fd, "\r\n", 4, 0) == -1) {
        return500(); //printf("status: 500\r\n");
        return -1;
    }    

    #define MAXRECVBUF 1024*64
    char *recvbuf = (char *) malloc(MAXRECVBUF);
    int recvbuf_len;

    int first_answer = 0;
    int offset = 0;

    do {
        recvbuf_len = recv(fd, recvbuf, MAXRECVBUF, 0);
        if (recvbuf_len < 0) {
            if (first_answer == 0) return500(); //printf("status: 500\r\n");
            free(recvbuf);
            return 1;
        } else if (recvbuf_len > 0) {
            if (first_answer == 0) {
                offset = 17;
                first_answer = 1;
            } else {
                offset = 0;
            }
            fwrite(recvbuf+offset, 1, recvbuf_len-offset, stdout);

        }
    } while (recvbuf_len > 0);

    free(recvbuf);
	close(fd);

    return 0;
}
