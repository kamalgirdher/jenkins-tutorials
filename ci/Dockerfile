FROM nginx:alpine
WORKDIR /ci
COPY index.html /usr/share/nginx/html
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]