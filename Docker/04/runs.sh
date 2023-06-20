#!/bin/bash
docker build -t server:server .
docker run -d -p 80:8 server:server