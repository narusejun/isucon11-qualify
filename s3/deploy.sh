#!/bin/bash -eux

#sudo cp -f etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
#sudo cp -rf etc/nginx /etc/nginx
#cp -f env /home/isucon/env
#
#cd /home/isucon/webapp/golang
#make build
#
#sudo systemctl restart mysql
#sudo systemctl reload nginx
#sudo systemctl restart web-golang


# slow query logを有効化する
# QUERY="
# set global slow_query_log_file = '/var/log/mysql/mysql-slow.log';
# set global long_query_time = 0;
# set global slow_query_log = ON;
# "
#
# echo $QUERY | sudo mysql -uroot
# sudo chmod 777 /var/log/mysql/mysql-slow.log