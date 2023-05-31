FROM nginx

RUN apt update; apt upgrade; apt install -y gcc spawn-fcgi libfcgi-dev

COPY ../03/server.c .
COPY ../03/nginx.conf /etc/nginx/nginx.conf

RUN gcc -o hello_server server.c -lfcgi

CMD ["nginx", "./server.c"]