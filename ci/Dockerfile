FROM nginx:alpine
COPY ./ci/index.html /usr/share/nginx/html
ENTRYPOINT ["/bin/sh", "./ci/entrypoint.sh"]