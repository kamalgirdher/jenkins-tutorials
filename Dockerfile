FROM nginx:alpine
COPY index.html /usr/share/nginx/html
COPY /run.sh /
RUN chmod 777 /run.sh
RUN /run.sh