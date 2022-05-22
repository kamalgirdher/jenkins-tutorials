FROM nginx:alpine
WORKDIR /ci
COPY index.html /usr/share/nginx/html
COPY /ci/entrypoint.sh /
ENTRYPOINT ["entrypoint.sh"]