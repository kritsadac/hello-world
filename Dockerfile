FROM debian:8

MAINTAINER kritsadadocker <reonaiduzz@gmail.com>
RUN apt-get update
RUN apt-get install nginx -y
ADD index.html /var/www/html/index.html
ADD app_version /
RUN echo 'ok' > /var/www/html/healthcheck.html
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
EXPOSE  80
CMD ["/entrypoint.sh"]

