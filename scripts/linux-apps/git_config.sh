#!/bin/bash

git config --global user.name "Rich Barlow"
git config --global --add --bool push.autoSetupRemote true

read -rp "Is this a work machine? [y/N] " work_machine
if [[ "$work_machine" =~ ^[Yy]$ ]]; then
    read -rp "Enter work email: " work_email
    git config --global user.email "$work_email"
else
    git config --global user.email "rsb177@hotmail.com"
fi
