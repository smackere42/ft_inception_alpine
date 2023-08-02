FROM alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache nginx

COPY ./config/ /etc/nginx/http.d/
COPY ./tools/smackere.42.crt /etc/ssl/certs/smackere.42.crt
COPY ./tools/smackere.42.key /etc/ssl/private/smackere.42.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]