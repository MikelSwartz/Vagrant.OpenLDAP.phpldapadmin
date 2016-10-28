#!/bin/bash

yum update -y
yum upgrade -y
yum install -y openldap openldap-clients openldap-servers *openldap* vim
yum --enablerepo=epel -y install phpldapadmin
#yum install -y httpd
# Do it automatically or you fail. :) 
# un-comment line 397, comment line 398 /etc/phpldapadmin/config.php
#// $servers->setValue('login','attr','dn');
sed -i '/^\/\/ $servers->setValue(\x27login\x27,\x27attr\x27,\x27dn\x27)/s/\/\///' /etc/phpldapadmin/config.php
#$servers->setValue('login','attr','uid');
sed -i '/^$servers->setValue(\x27login\x27,\x27attr\x27,\x27uid\x27)/s/^/\/\//'  /etc/phpldapadmin/config.php

# Add local subnet to the Allow list on /etc/httpd/conf.d/phpldapadmin.conf
sed -i '/Allow from 127.0.0.1/s/$/ 10.0.2.0\/24/' /etc/httpd/conf.d/phpldapadmin.conf

chkconfig httpd on
service httpd restart
