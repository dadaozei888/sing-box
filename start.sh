#!/bin/sh
# 启动 chisel server (隧道, 允许反向转发) 和 nginx (入口分流)
/usr/local/bin/chisel server --port 8081 --reverse &
exec nginx -g 'daemon off;'
