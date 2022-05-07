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

# backup and set permissions on files

sudo cp /etc/puppet/ ~/OE2-Group-Project/Backup-VM/ -r
sudo cp /etc/hosts ~/OE2-Group-Project/Backup-VM/hosts
sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/hosts
sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/hosts
sudo chmod go+r ~/OE2-Group-Project/Backup-VM/hosts
sudo cp /etc/puppet/ ~/OE2-Group-Project/Backup-VM/ -r
history -w
sudo cp ~/.bash_history ~/OE2-Group-Project/Backup-VM/bash_history.txt
sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/bash_history.txt
sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/bash_history.txt
sudo chmod go+r ~/OE2-Group-Project/Backup-VM/bash_history.txt
sudo cp ~/.bashrc ~/OE2-Group-Project/Backup-VM/bashrc
sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/bashrc
sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/bashrc
sudo chmod go+r ~/OE2-Group-Project/Backup-VM/bashrc
sudo cp /etc/nagios ~/OE2-Group-Project/Backup-VM -r
sudo cp /etc/nagios-plugins ~/OE2-Group-Project/Backup-VM -r
sudo cp /etc/prometheus/console_libraries/ ~/OE2-Group-Project/Backup-VM/prometheus/console_libraries/ -r
sudo cp /etc/prometheus/consoles/ ~/OE2-Group-Project/Backup-VM/prometheus/consoles/ -r
sudo cp /etc/prometheus/prometheus ~/OE2-Group-Project/Backup-VM/prometheus/prometheus
sudo cp /etc/prometheus/prometheus.yml ~/OE2-Group-Project/Backup-VM/prometheus/prometheus.yml
sudo cp /etc/prometheus/rules.yml ~/OE2-Group-Project/Backup-VM/prometheus/rules.yml
sudo cp /etc/prometheus/tsdb ~/OE2-Group-Project/Backup-VM/prometheus/tsdb
sudo cp /etc/prometheus/promtool ~/OE2-Group-Project/Backup-VM/prometheus/promtool
sudo cp /etc/prometheus/lock ~/OE2-Group-Project/Backup-VM/prometheus/lock
sudo cp /etc/prometheus/NOTICE ~/OE2-Group-Project/Backup-VM/prometheus/NOTICE
sudo cp /etc/prometheus-plugins ~/OE2-Group-Project/Backup-VM -r
sudo cp /etc/systemd/system/prometheus.service ~/OE2-Group-Project/Backup-VM/prometheus.service
sudo chown bitstudent ~/OE2-Group-Project/Backup-VM/prometheus.service
sudo chgrp bitstudent ~/OE2-Group-Project/Backup-VM/prometheus.service
cd ~/OE2-Group-Project

# check for file changes

if [ -z "$(git status --porcelain)" ]; then 
	# no changes to add to a commit
  cd ~/
else 
  COMMIT_TIMESTAMP=`date +'%d-%m-%Y %H:%M:%S %Z'`
  git status
  git add .
  git commit -m "backup: automated system backup" -m "completed: $COMMIT_TIMESTAMP" -m "backup-b"
  git push
  cd ~/
fi
