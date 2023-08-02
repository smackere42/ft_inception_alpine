#!/bin/sh

	adduser -h /var/www -s /bin/false -D ${FTP_USR}
    echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd
    adduser ${FTP_USR} root