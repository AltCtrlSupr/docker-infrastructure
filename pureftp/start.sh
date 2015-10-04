#!/bin/bash


sed -i "s/PUREFTPD_USER/$PUREFTPD_USER/g" /etc/pure-ftpd/db/mysql.conf
sed -i "s/PUREFTPD_PASSWORD/$PUREFTPD_PASSWORD/g" /etc/pure-ftpd/db/mysql.conf
sed -i "s/PUREFTPD_DB_HOST/$PUREFTPD_DB_HOST/g" /etc/pure-ftpd/db/mysql.conf
sed -i "s/PUREFTPD_DB_NAME/$PUREFTPD_DB_NAME/g" /etc/pure-ftpd/db/mysql.conf
sed -i "s/PUREFTPD_ENC/$PUREFTPD_ENC/g" /etc/pure-ftpd/db/mysql.conf

test -n "$AllowDotFiles" && echo $AllowDotFiles > /etc/pure-ftpd/conf/AllowDotFiles
test -n "$ChrootEveryone" && echo $ChrootEveryone > /etc/pure-ftpd/conf/ChrootEveryone
test -n "$CreateHomeDir" && echo $CreateHomeDir > /etc/pure-ftpd/conf/CreateHomeDir
test -n "$MinUID" && echo $MinUID > /etc/pure-ftpd/conf/MinUID
test -n "$NoAnonymous" && echo $NoAnonymous > /etc/pure-ftpd/conf/NoAnonymous
test -n "$NoTruncate" && echo $NoTruncate > /etc/pure-ftpd/conf/NoTruncate
test -n "$PassivePortRange" && echo $PassivePortRange > /etc/pure-ftpd/conf/PassivePortRange


/usr/sbin/pure-ftpd-wrapper mysql
