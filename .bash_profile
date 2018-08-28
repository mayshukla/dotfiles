#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# load Xresources
#exec xrdb ~/.Xresources
# if you put this before 'exec startx' you can't login

# automatically startx on login
# from https://wiki.archlinux.org/index.php/Xinit#Autostart_X_at_login
if [[ ! $WAYLAND_DISPLAY && ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  access-granted
  exec startx
fi

