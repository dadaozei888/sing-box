#!/bin/sh
# 启动 chisel server (隧道) 和 nginx (入口分流)
/usr/local/bin/chisel server --port 8081 &
exec nginx -g 'daemon off;'
