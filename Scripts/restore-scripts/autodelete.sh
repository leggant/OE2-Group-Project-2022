#!/bin/bash

sudo find ~/backup/**/* -depth -name "backup-*" -mtime +14 -execdir rm -rf {} +
