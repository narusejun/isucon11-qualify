#!/bin/bash -eux

sudo cp -f etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
sudo cp -f etc/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp -f etc/nginx/sites-available/isucondition.conf /etc/nginx/sites-available/isucondition.conf
sudo cp -f home/isucon/env.sh /home/isucon/env.sh

#cp -f env /home/isucon/env

cd /home/isucon/webapp/go
go build -o isucondition

sudo systemctl restart isucondition.go
sleep 1

sudo systemctl restart nginx
sudo systemctl restart mariadb


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
