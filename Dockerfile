FROM nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
WORKDIR /app

RUN groupadd -r -g 1001 demo && useradd -u -m 1001 -r -g demo demo

RUN chown -R demo:demo /app && chmod -R 755 /app && chown -R demo:demo /var/cache/nginx && \
        chown -R demo:demo /var/log/nginx && chown -R demo:demo /etc/nginx/conf.d && chown demo:demo /etc/nginx/default.conf
RUN touch /var/run/nginx.pid && chown  demo:demo /var/run/nginx.pid
USER demo

#COPY dist/smarthr /app
EXPOSE 80
