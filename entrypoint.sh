#!/usr/bin/env bash

# rm /home/bless/.bashrc

# git clone https://github.com/blesswinsamuel/dotfiles.git

export ASK_BECOME_PASS='false'
export ANSIBLE_SUDO_PASS=''

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/blesswinsamuel/dotfiles/master/install.sh)"

exec fish
