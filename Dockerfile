FROM nginx:1.23.2

ENV PORT=8080
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY ip-restrictions.conf /etc/nginx/ip-restrictions.conf
COPY html /usr/share/nginx/html

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
