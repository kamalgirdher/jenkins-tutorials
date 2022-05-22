FROM nginx:alpine
WORKDIR /ci
COPY index.html /usr/share/nginx/html
COPY /entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]