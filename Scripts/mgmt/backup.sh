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
cd ~/OE2-Group-Project
git pull
cd ~/

# backup and set permissions on files

sudo cp /etc/puppet/ -r ~/OE2-Group-Project/Mgmt-VM/ -r
sudo rm -r ~/OE2-Group-Project/Mgmt-VM/puppet/ssl
sudo cp /etc/puppet/code/environments/production/manifests/site.pp ~/OE2-Group-Project/Mgmt-VM/puppet/
sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet/code
sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet
sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet/*
sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/puppet/*
sudo cp /etc/hosts ~/OE2-Group-Project/Mgmt-VM/hosts
sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/hosts
sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/hosts
sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/hosts
sudo cp /etc/nagios3 -r ~/OE2-Group-Project/Mgmt-VM/ -r
sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3
sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3
sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3/*
sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/nagios3/*
sudo cp /etc/php/7.2/cgi/php.ini ~/OE2-Group-Project/Mgmt-VM/php.ini
sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/php.ini
sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/php.ini 
sudo cp ~/.bash_history ~/OE2-Group-Project/Mgmt-VM/bash_history.txt
sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/bash_history.txt
sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/bash_history.txt
sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bash_history.txt
sudo cp ~/.bashrc ~/OE2-Group-Project/Mgmt-VM/bashrc
sudo chown bitstudent ~/OE2-Group-Project/Mgmt-VM/bashrc
sudo chgrp bitstudent ~/OE2-Group-Project/Mgmt-VM/bashrc
sudo chmod go+r ~/OE2-Group-Project/Mgmt-VM/bashrc
sudo cp /etc/nagios ~/OE2-Group-Project/Mgmt-VM -r
sudo cp /etc/nagios-plugins ~/OE2-Group-Project/Mgmt-VM -r
sudo cp /etc/node-exporter ~/OE2-Group-Project/Mgmt-VM/node-exporter -r
sudo cp /etc/systemd/system/node-exporter.service ~/OE2-Group-Project/Mgmt-VM/node-exporter/node-exporter.service
sudo chown -R bitstudent ~/OE2-Group-Project
sudo chgrp -R bitstudent ~/OE2-Group-Project
sudo chmod -R 775 ~/OE2-Group-Project 
cd ~/OE2-Group-Project

# check for file changes

if [ -z "$(git status --porcelain)" ]; then 
	# no changes to add to a commit
  cd ~/
else 
  COMMIT_TIMESTAMP=`date +'%d-%m-%Y %H:%M:%S %Z'`
  history -w
  git add .
  git commit -m "mgmt: automated system backup" -m "completed: $COMMIT_TIMESTAMP" -m "mgmt-b"
  git push
  cd ~/
fi
