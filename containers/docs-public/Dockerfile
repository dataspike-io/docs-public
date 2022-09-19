FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY tmp/build/ .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
