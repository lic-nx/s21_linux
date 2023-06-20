#!/bin/bash                       
apt update
apt upgrade
apt install -y gcc spawn-fcgi libfcgi-dev                                                            
gcc -o run_server server.c -lfcgi
spawn-fcgi -p 8080 -p ./run_server
