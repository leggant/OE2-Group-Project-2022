#!/bin/bash

sudo apt update
sudo apt install mysql-client
sudo mysql --user=root --password=P@ssw0rd -e "create database if not exists testcloud;" 
sudo mysql -e "grant all on testcloud.* to 'testcloud'@'app-b.foo.org.nz' identified by 'P@ssw0rd';" 
sudo mysql -e "flush privileges;" 

