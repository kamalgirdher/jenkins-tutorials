FROM nginx:alpine
COPY $PWD/ci/index.html /usr/share/nginx/html
ENTRYPOINT ["/bin/sh", "$PWD/ci/entrypoint.sh"]