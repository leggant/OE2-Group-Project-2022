#!/bin/bash

# pull down changes from the remote repo

cd ~/OE2-Group-Project
sudo chmod 774 ./.git
sudo chmod 774 .gitignore
cd .git/
sudo chown bitstudent FETCH_HEAD
sudo chgrp bitstudent FETCH_HEAD
sudo chown bitstudent ORIG_HEAD
sudo chgrp bitstudent ORIG_HEAD
sudo chmod 774 ./**
cd objects
sudo chgrp bitstudent ./**
sudo chown bitstudent ./**
sudo chmod 774 ./**
cd ~/OE2-Group-Project
git pull
cd ~/

# Db and set permissions on files

sudo cp /etc/puppet ~/OE2-Group-Project/Db-VM -r 
sudo cp /etc/hosts ~/OE2-Group-Project/Db-VM/hosts
sudo chmod go+r ~/OE2-Group-Project/Db-VM/hosts
sudo cp /etc/puppet ~/OE2-Group-Project/Db-VM -r
sudo cp /etc/apache2 ~/OE2-Group-Project/Db-VM -r
sudo cp /etc/mysql ~/OE2-Group-Project/Db-VM -r
sudo cp ~/.bash_history ~/OE2-Group-Project/Db-VM/bash_history.txt
sudo chmod go+r ~/OE2-Group-Project/Db-VM/bash_history.txt
sudo cp ~/.bashrc ~/OE2-Group-Project/Db-VM/bashrc
sudo chmod go+r ~/OE2-Group-Project/Db-VM/bashrc
sudo cp /etc/mysql ~/OE2-Group-Project/Db-VM -r
sudo cp /etc/nagios ~/OE2-Group-Project/Db-VM -r
sudo cp /etc/nagios-plugins ~/OE2-Group-Project/Db-VM -r
sudo cp /etc/node-exporter ~/OE2-Group-Project/Db-VM/node-exporter -r
sudo cp /etc/systemd/system/node-exporter.service ~/OE2-Group-Project/Db-VM/node-exporter/node-exporter.service
sudo cp /etc/rsyslog.d/50-default.conf ~/OE2-Group-Project/Db-VM/Logs
sudo cp /var/log/cron.log ~/OE2-Group-Project/Db-VM/Logs
sudo cp /var/log/user.log ~/OE2-Group-Project/Db-VM/Logs
sudo cp /var/log/daemon.log ~/OE2-Group-Project/Db-VM/Logs
sudo cp /etc/logrotate.d/rsyslog ~/OE2-Group-Project/Db-VM/Logs
sudo chown -R bitstudent ~/OE2-Group-Project/Db-VM
sudo chgrp -R bitstudent ~/OE2-Group-Project/Db-VM
cd ~/OE2-Group-Project

# check for file changes

if [ -z "$(git status --porcelain)" ]; then 
	# no changes to add to a commit
  cd ~/
else 
  COMMIT_TIMESTAMP=`date +'%d-%m-%Y %H:%M:%S %Z'`
  history -w
  git add .
  git commit -m "db: automated system backup" -m "completed: $COMMIT_TIMESTAMP" -m "db-b"
  git push
  cd ~/
fi
