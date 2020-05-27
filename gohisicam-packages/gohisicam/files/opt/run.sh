#!/bin/sh 

APP=/opt/gohisicam

#LDC="-vi-ldc=false -vi-ldc-offset-x=0 -vi-ldc-offset-y=0 -vi-ldc-k=0"
#VI="-vi-flip-x=false -vi-flip-y=false -vi-x0=0 -vi-y0=0 -vi-width=1280 -vi-height=720 -vi-fps=30"

HTTP8080="-openapi-port 8080"

$APP -logger-level=-1 \
    -mem-total=64M \
    -mem-linux= \
    -mem-mpp= \
    $HTTP8080 \
    $VI \
    $LDC \
    -chip=hi3516ev200 -cmos=f22 &

