#!/bin/bash

sudo find ~/backup/**/weekly -depth -name "backup-*.zip" -mtime +14 -execdir rm -rf {} +
