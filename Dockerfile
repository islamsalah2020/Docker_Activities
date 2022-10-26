FROM nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
WORKDIR /app
RUN chown -R nginx:nginx /app && chmod -R 755 /app && chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && chown -R nginx:nginx /etc/nginx/conf.d && chown nginx:nginx /etc/nginx/default.conf
RUN touch /var/run/nginx.pid && chown  nginx:nginx /var/run/nginx.pid
USER nginx
#COPY dist/smarthr /app
EXPOSE 9090:80
