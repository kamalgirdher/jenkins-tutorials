FROM nginx:alpine
WORKDIR /ci
COPY index.html /usr/share/nginx/html
COPY /entrypoint.sh /ci/
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]