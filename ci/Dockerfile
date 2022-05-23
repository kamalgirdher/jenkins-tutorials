FROM nginx:alpine
WORKDIR /ci
COPY index.html /usr/share/nginx/html
COPY /run.sh /ci/
RUN chmod 777 /ci/run.sh
RUN /ci/run.sh