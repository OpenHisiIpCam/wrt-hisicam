module("luci.controller.gohisicam.main", package.seeall)  --notice that new_tab is the name of the file new_tab.lua


function index()
    entry({"admin", "gohisicam"}, firstchild(), "Camera", 60).dependent=false
    entry({"admin", "gohisicam", "settings"}, cbi("gohisicam/settings_tab"), "Settings", 20)
    entry({"admin", "gohisicam", "control"}, template("gohisicam/control_tab"), "Control", 10)
    entry({"admin", "gohisicam", "proxy"}, call("proxy"), nil, nil).dependent=false
end                                                                                      
    
 

function proxy()
    --luci.http.prepare_content("text/plain")
    --luci.http.write("test")

    local query = luci.http.getenv("QUERY_STRING")

    --TODO check if empty then return some error 

    local uds = nixio.socket("unix", "stream")
    local result = uds:connect("/tmp/gohisicam.sock", nil)
    --TODO if error return something
    --if result == true then
    --    luci.http.write("connected ok")
    --else
    --    luci.http.write("connected false")
    --end

    uds:setblocking(true)

    local request = "GET " .. query .. " HTTP/1.0\r\n\r\n"
    --print(string.len(request))
    local sent = uds:send(request, nil, string.len(request))

    --print(sent)
    --luci.http.write(sent)
    local size = 0
    local first_answer = false
    repeat
        --print("read")
        local answer = uds:recv(nixio.const.buffersize)
        if type(answer) == "string" then
          --print(string.len(answer))
          size = size + string.len(answer)
          if string.len(answer) > 0 and first_answer == false then
             --print(">0")
             first_answer = true
             --print(string.sub(answer, 18))
             io.write(string.sub(answer, 18))
          else
             --print("==0")
             --print(answer)
             io.write(answer)
          end
        else
          --print("break")
          break
        end
        --print(answer) 
    until(string.len(answer) == 0)
    --print("total " .. size)

end
