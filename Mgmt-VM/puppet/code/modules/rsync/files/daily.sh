#!/bin/bash

#Hosts
db=db-b.foo.org.nz
mgmt=mgmt-b.foo.org.nz
backup=backup-b.foo.org.nz
app=app-b.foo.org.nz
host=$(hostname)
backupdir=/etc/backup/daily
if [ $host == $mgmt ]
then
BDIR="
/etc/node-exporter
/etc/nagios
/etc/nagios3
/etc/nagios-plugins
/etc/puppet/code
/etc/puppet/puppet.conf
"

sudo zip -r $backupdir/backup-$(date +%Y%m%d).zip $BDIR 
sudo find $backupdir/* -mtime +7 -delete
# the name of the backup machine
BSERVER=groupb
USERX=restore-b.foo.org.nz
OPTS="-haAXuv -v --progress --delete --log-file=/home/bitstudent/daily.log --backup-dir=~/backup/mgmt/backup/daily" 

rsync $OPTS $backupdir/backup-$(date +%Y%m%d).zip $BSERVER@$USERX:~/backup/mgmt/daily

#=====================================================================================================
elif [ $host == $db ]
then
echo "db vm"
BUDIR="
/etc/node-exporter
/etc/nagios
/etc/nagios-plugins
/etc/mysql
/etc/puppet
/home/bitstudent/mysql-backup
"

sudo chmod o+rx /etc/mysql/debian.cnf
# MYSQL BACKUP
MYSQLDATE=`date +%d%m%Y%H%M%S`
cd $backupdir
sudo mysqldump --skip-extended-insert --all-databases --add-drop-table > sqlbackup.sql
sudo zip -r $backupdir/backup-$(date +%Y%m%d).zip $BUDIR 
sudo find $backupdir/* -mtime +7 -delete
# the name of the backup machine
BSERVER=groupb
USERX=restore-b.foo.org.nz
OPTS="-haAXuv -v --progress --delete --log-file=/home/bitstudent/daily.log --backup-dir=~/backup/db/backup/daily" 

rsync $OPTS $backupdir/backup-$(date +%Y%m%d).zip $BSERVER@$USERX:~/backup/db/daily
sudo chmod o-rx /etc/mysql/debian.cnf
#==========================================================================
elif [ $host == $app ]
then
echo "app vm"

BDIR="
/etc/apache2
/var/www/owncloud/data
"
sudo chmod o+rx /var/www/owncloud/data -R
sudo zip -r $backupdir/backup-$(date +%Y%m%d).zip $BDIR 
sudo find $backupdir/* -mtime +7 -delete
BSERVER=groupb
USERX=restore-b.foo.org.nz
OPTS="-haAXuv -v --progress --delete --log-file=/home/bitstudent/daily.log --backup-dir=~/backup/app/daily"
rsync $OPTS $backupdir/backup-$(date +%Y%m%d).zip $BSERVER@$USERX:~/backup/app/daily
sudo chmod o-rx /var/www/owncloud/data -R

#====================================================
else [ $host == $backup ]
echo "db vm"

BDIR="
/etc/node-exporter
/etc/nagios
/etc/nagios-plugins
/etc/puppet
/etc/prometheus-plugins
/etc/prometheus/prometheus
/etc/prometheus/prometheus.yml
/etc/prometheus/rules.yml
/etc/prometheus/tsdb
/etc/prometheus/promtool
/etc/prometheus/consoles
/etc/prometheus/console_libraries
/etc/prometheus/NOTICE
/etc/prometheus/queries.active
"
# the name of the backup machine
sudo zip -r $backupdir/backup-$(date +%Y%m%d).zip $BDIR
sudo find $backupdir/* -mtime +7 -delete
BSERVER=groupb
USERX=restore-b.foo.org.nz
OPTS="-haAXuv -v --progress --delete --log-file=/home/bitstudent/daily.log --backup-dir=~/backup/backup/daily"
rsync $OPTS $backupdir/backup-$(date +%Y%m%d).zip $BSERVER@$USERX:~/backup/backup/daily
fi
