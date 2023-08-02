FROM alpine:3.16

ARG FTP_USR \
    FTP_PWD

RUN apk update && apk upgrade && \
    apk add --no-cache vsftpd

COPY ./requirements/bonus/ftp/config/ /etc/vsftpd/

WORKDIR /var/www

COPY ./requirements/bonus/ftp/tools/user.sh .

RUN sh user.sh

EXPOSE 21

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]