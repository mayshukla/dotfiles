#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi/vim mode
set -o vi

# implicit cd
#shopt -s autocd

alias ls='ls --color=auto'

# color the username and path
#PS1='\033[00;33m\][\u@\h \W]\[\033[0m\] \$ '
#NOTE: you need to escape all non-printing chars with '\[' and '\]' or urxvt won't wrap lines properly
#see https://www.linuxquestions.org/questions/slackware-14/cli-lines-wrapping-overwrites-in-rxvt-4175467924/
PS1='\[\e[0;35m\]\u\[\e[0;33m\]@\[\e[0;36m\]\h\[\e[1;33m\]\W\[\e[0;32m\]\$\[\e[m\] '
# uncolor the username and path
#PS1='[\u@\h \W] \$ '

# Allow termite to open a new terminal in current directory using ctrl-shift-t
# Note: you also need to call __vte_prompt_command from within your prompt command
if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
fi
# Use prompt command to display exit status if it is not zero
# Idea from: https://stackoverflow.com/questions/16715103/bash-prompt-with-last-exit-code
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?" # must be first

    # Allow termite to open a new terminal in current directory using ctrl-shift-t
    if [[ $TERM == xterm-termite ]]; then
        # Note: you need to run /etc/profile.d/vte.sh to get this function
        __vte_prompt_command
    fi

    PS1='\[\e[0;35m\]\u\[\e[0;33m\]@\[\e[0;36m\]\h\[\e[1;33m\]\W\[\e[0;32m\]\$\[\e[m\] '

    if [ $EXIT != 0 ]; then
        PS1+="\[\e[1;31m\][${EXIT}]\[\e[m\] "
    fi
}


# PATH variable
export PATH=$PATH:~/scripts:~/arduino-ua/bin:~/.local/bin

# Open emacs in terminal, in client mode
# (server must be running)
#
# TERM is set so that emacs outputs true color in the terminal
# Follow this example: https://www.gnu.org/software/emacs/manual/html_node/efaq/Colors-on-a-TTY.html#Colors-on-a-TTY
alias em="TERM=xterm-24bit emacsclient -t"

# Use "emo <filename>" to tell emacs server to visit a file
emo () {
  emacsclient -e "(find-file \"$1\")"
}
export -f emo

# scale spotify for HiDPI when launched from terminal
# courtesy of:
# https://community.spotify.com/t5/Desktop-Linux/Linux-client-barely-usable-on-HiDPI-displays/td-p/1067272
alias spotify="spotify --force-device-scale-factor=3 & disown"

# scale GTK/GDK apps for HiDPI
export GDK_SCALE=3

# alias to go to ~/Files partition
alias cdf="cd ~/Files"

alias cdd="cd ~/Downloads"
alias cds="cd ~/Files/school"
alias cdc="cd ~/Files/code"
alias cdr="cd ~/Files/resumes"

# alias to quickly attach to tmux session
alias tma="tmux attach -t"

# open atom in the current directory when "atom" is called
alias atom="/usr/bin/atom ./"

# when you close ranger, your terminal will be at the directory you navigated to in ranger
alias ranger="source ranger"

# use the alias 'dotfiles' instead of git to manage dotfiles git repository
# courtesy of https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# set i3lock background
alias i3lock='i3lock -c 000000'

# Arduino path variables
export ARDUINO_PLATFORM_LIB_PATH=/usr/share/arduino/hardware/archlinux-arduino/avr/libraries
export ARDUINO_VAR_PATH=/usr/share/arduino/hardware/archlinux-arduino/avr/variants
export BOARDS_TXT=/usr/share/arduino/hardware/archlinux-arduino/avr/boards.txt
export ARDUINO_CORE_PATH=/usr/share/arduino/hardware/archlinux-arduino/avr/cores/arduino
export BOOTLOADER_PARENT=/usr/share/arduino/hardware/archlinux-arduino/avr/bootloaders

# node js
source ~/aurdownloads/nvm/init-nvm.sh

# android
export ANDROID_SDK_ROOT=$HOME/Files/Android/Sdk
export ANDROID_HOME=$HOME/Files/Android/Sdk # YOU NEED THIS ONE FOR REACT-NATIVE RUN-ANDROID
export ANDROID_EMULATOR_HOME=$HOME/Files/Android/.android
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# RubyGems
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem

# boolang
source ~/Files/code/boolang/setup.bash
# napkin
export PATH=$PATH:~/Files/code/napkin/bin
alias napkin="rlwrap napkin"
# pitcher
export PATH=$PATH:~/Files/school/cmput275/pitcher

# open jdk for IBM conference
#export PATH=$PATH:~/jdk8u212-b03/bin
#export JAVA_HOME=~/jdk8u212-b03
export JAVA_HOME=/usr

# apache maven for IBM conference
#export PATH=$PATH:~/apache-maven-3.6.1/bin

# TypeChef
alias typechef="java -jar ~/Files/variability-research/typechef/TypeChef-0.3.7.jar"
# VarClang
alias varclang=~/Files/variability-research/build/bin/clang
alias varclang++=~/Files/variability-research/build/bin/clang++
# tool to automatically generate config file for VarClang
alias varclang-config="python ~/Files/variability-research/researchwiki-reckhard/ifdef_extracter.py"
