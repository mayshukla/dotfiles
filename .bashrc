#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi/vim mode
set -o vi

alias ls='ls --color=auto'

# color the username and path
#PS1='\033[00;33m\][\u@\h \W]\[\033[0m\] \$ '
#NOTE: you need to escape all non-printing chars with '\[' and '\]' or urxvt won't wrap lines properly
#see https://www.linuxquestions.org/questions/slackware-14/cli-lines-wrapping-overwrites-in-rxvt-4175467924/
PS1='\[\e[0;34m\]\u@\h\[\e[0;32m\]\W\[\e[0;33m\]\$\[\e[m\]'
# uncolor the username and path
#PS1='[\u@\h \W] \$ '

# PATH variable
export PATH=$PATH:~/scripts:~/arduino-ua/bin:~/.local/bin

# scale spotify for HiDPI when launched from terminal
# courtesy of:
# https://community.spotify.com/t5/Desktop-Linux/Linux-client-barely-usable-on-HiDPI-displays/td-p/1067272
alias spotify="/usr/bin/spotify --force-device-scale-factor=3"

# scale rawtherapee
#alias rawtherapee="export GDK_SCALE=3 && /usr/bin/rawtherapee"

# scale GTK/GDK apps for HiDPI
export GDK_SCALE=3

# open atom in the current directory when "atom" is called
alias atom="/usr/bin/atom ./"

# when you close ranger, your terminal will be at the directory you navigated to in ranger
alias ranger="source ranger"

# use the alias 'dotfiles' instead of git to manage dotfiles git repository
# courtesy of https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# enable powerline
# https://wiki.archlinux.org/index.php/Powerline
# - first add directory to PATH
#PATH=$PATH:/home/ryan/.local/bin/
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /home/ryan/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

# Arduino path variables
export ARDUINO_PLATFORM_LIB_PATH=/usr/share/arduino/hardware/archlinux-arduino/avr/libraries
export ARDUINO_VAR_PATH=/usr/share/arduino/hardware/archlinux-arduino/avr/variants
export BOARDS_TXT=/usr/share/arduino/hardware/archlinux-arduino/avr/boards.txt
export ARDUINO_CORE_PATH=/usr/share/arduino/hardware/archlinux-arduino/avr/cores/arduino
export BOOTLOADER_PARENT=/usr/share/arduino/hardware/archlinux-arduino/avr/bootloaders
