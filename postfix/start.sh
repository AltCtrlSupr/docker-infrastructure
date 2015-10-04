#!/bin/bash

sed -i "s/postfix_user/$POSTFIX_USER/g" /etc/postfix/mysql_*
sed -i "s/postfix_password/$POSTFIX_PASSWORD/g" /etc/postfix/mysql_*
sed -i "s/postfix_db_host/$POSTFIX_DB_HOST/g" /etc/postfix/mysql_*
sed -i "s/postfix_db_name/$POSTFIX_DB_NAME/g" /etc/postfix/mysql_*

service syslog-ng start
service postfix start
umask 0 && truncate -s0 /var/log/mail.log
tail -n0 -F /var/log/mail.log
