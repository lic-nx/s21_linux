FROM nginx

WORKDIR /home/

COPY server.c /home/
COPY nginx.conf /etc/nginx/nginx.conf

RUN apt update; apt upgrade; apt install -y gcc spawn-fcgi libfcgi-dev; \
    gcc server.c -lfcgi -o hello_server; \
    rm -rf /var/lib/apt/lists
    # service nginx start; \
    # spawn-fcgi -p 8080 ./hello_server
USER dockle

ENTRYPOINT service nginx start && spawn-fcgi -p 8080 -n hello_server
# ENTRYPOINT [ "run -d -p 81:80 server bash" ]