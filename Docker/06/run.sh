#!/bin/bash
docker-compose build
docker-compose up -d
curl localhost:80