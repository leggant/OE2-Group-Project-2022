#!/bin/bash

# pull down changes from the remote repo
history -w
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

sudo cp /etc/puppet/ ~/OE2-Group-Project/App-VM/ -r
sudo cp /etc/hosts ~/OE2-Group-Project/App-VM/hosts
sudo chmod go+r ~/OE2-Group-Project/App-VM/hosts
sudo cp /etc/puppet/ ~/OE2-Group-Project/App-VM/ -r
sudo cp /etc/apache2/ ~/OE2-Group-Project/App-VM/ -r
sudo cp /etc/mysql/ ~/OE2-Group-Project/App-VM/ -r
cat '' > ~/OE2-Group-Project/App-VM/bash_history.txt
sudo cp ~/.bash_history ~/OE2-Group-Project/App-VM/bash_history.txt
sudo chmod go+r ~/OE2-Group-Project/App-VM/bash_history.txt
sudo cp ~/.bashrc ~/OE2-Group-Project/App-VM/bashrc
sudo chmod go+r ~/OE2-Group-Project/App-VM/bashrc
sudo cp /etc/nagios ~/OE2-Group-Project/App-VM -r
sudo cp /etc/nagios-plugins ~/OE2-Group-Project/App-VM -r
sudo cp /etc/node-exporter ~/OE2-Group-Project/App-VM/node-exporter -r
sudo cp /etc/systemd/system/node-exporter.service ~/OE2-Group-Project/App-VM/node-exporter/node-exporter.service
sudo cp /etc/rsyslog.d/50-default.conf ~/OE2-Group-Project/App-VM/Logs
sudo cp /var/log/user.log ~/OE2-Group-Project/App-VM/Logs
sudo cp /var/log/cron.log ~/OE2-Group-Project/App-VM/Logs
sudo cp ~/rsync.log ~/OE2-Group-Project/App-VM/Logs
sudo cp ~/daily.log ~/OE2-Group-Project/App-VM/Logs
sudo cp ~/weekly.log ~/OE2-Group-Project/App-VM/Logs
sudo chown -R bitstudent ~/OE2-Group-Project/App-VM
sudo chgrp -R bitstudent ~/OE2-Group-Project/App-VM
sudo chmod -R 775 ~/OE2-Group-Project/Scripts
cd ~/OE2-Group-Project

# check for file changes

if [ -z "$(git status --porcelain)" ]; then 
	# no changes to add to a commit
  cd ~/
else 
  COMMIT_TIMESTAMP=`date +'%d-%m-%Y %H:%M:%S %Z'`
  git add .
  git commit -m "app: automated system backup" -m "completed: $COMMIT_TIMESTAMP" -m "app-b"
  git push
fi
