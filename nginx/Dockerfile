FROM nginx:1.25.2-alpine

RUN apk update \
    && apk add --no-cache curl g++ make autoconf bash bind-tools openssl supervisor certbot inotify-tools \
    && addgroup -g 1000 -S dockeruser \
    && adduser -u 1000 -S dockeruser -G dockeruser

RUN touch /var/log/supervisord.log \
    && chown -R dockeruser:dockeruser /var/log/supervisord.log

RUN chown -R dockeruser:dockeruser /var/log/supervisord.log

COPY ./shell/configurations/supervisord.nginx.conf /etc/supervisord.conf

COPY ./nginx/configurations/nginx.conf /etc/nginx/
COPY ./nginx/configurations/proxy.conf /etc/nginx/
COPY ./shell/watch_nginx_config.sh /etc/nginx/

WORKDIR /etc/nginx/

CMD ["/usr/bin/supervisord","--configuration=/etc/supervisord.conf"]