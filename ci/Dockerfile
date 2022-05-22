FROM nginx:alpine
WORKDIR /ci
COPY index.html /usr/share/nginx/html
COPY /entrypoint.sh /ci/
RUN chmod 777 /ci/entrypoint.sh
#RUN /ci/entrypoint.sh