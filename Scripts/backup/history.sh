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

history -w

# check for file changes

if [ -z "$(git status --porcelain)" ]; then 
        # no changes to add to a commit
  cd ~/
else 
  COMMIT_TIMESTAMP=`date +'%d-%m-%Y %H:%M:%S %Z'`
  git add .
  git commit -m "backup: automated history backup" -m "completed: $COMMIT_TIMESTAMP" -m "backup-b"
  git push
  cd ~/
fi

