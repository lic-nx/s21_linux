#!/bin/bash                                                                                     
gcc -o run_server server.c -lfcgi
spawn-fcgi -p 8080 -p ./run_server
