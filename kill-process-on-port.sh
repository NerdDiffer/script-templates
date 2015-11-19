#!/bin/bash

# Figure out which process is listening on a port, then kill that process.
# This is useful for times when you need to kill a server, but closed the
# terminal window you used to start the server.
# To see processes on all ports, type in `netstat -tulpn`

read -p "Which port is the server on? " PORT_NUM

PID=$(sudo fuser $PORT_NUM/tcp)

echo "The process id is: $PID"

kill $PID

echo "Killed server on port $PORT_NUM"
