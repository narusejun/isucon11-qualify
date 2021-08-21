#!/bin/bash -eux

sudo cp -f etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
sudo cp -rf etc/nginx /etc/
#cp -f env /home/isucon/env

cd /home/isucon/webapp/go
go build -o isucondition

sudo systemctl restart mariadb
sudo systemctl reload nginx
sudo systemctl restart isucondition.go


# slow query logを有効化する
QUERY="
 set global slow_query_log_file = '/var/log/mysql/mysql-slow.log';
 set global long_query_time = 0;
 set global slow_query_log = ON;
"

echo $QUERY | sudo mysql -uroot

# log permission
sudo chmod 777 /var/log/nginx /var/log/nginx/*
sudo chmod 777 /var/log/mysql /var/log/mysql/*
