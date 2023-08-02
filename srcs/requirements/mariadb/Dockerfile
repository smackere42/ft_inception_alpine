FROM alpine:3.16

ARG DB_NAME \
    DB_USER \
    DB_PASS \
    DB_ROOT

RUN apk update && apk add --no-cache mysql mariadb-client ; \
    mkdir /var/run/mysqld; \
    chmod -R 777 /var/run/mysqld; \
    mkdir /var/log/mysql ; \
    chmod -R 777 /var/log/mysql

COPY ./requirements/mariadb/config/* /etc/my.cnf.d/

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql;

EXPOSE 3306

COPY ./requirements/mariadb/tools/create_db.sh .
RUN sh create_db.sh && rm create_db.sh

USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]