#!/bin/bash

sudo find ~/backup/**/daily -depth -name "backup-*.zip" -mtime +7 -execdir rm -rf {} +
