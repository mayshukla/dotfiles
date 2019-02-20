#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# automatically startx on login
# from https://wiki.archlinux.org/index.php/Xinit#Autostart_X_at_login
if [[ ! $WAYLAND_DISPLAY && ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  access-granted
  exec startx
fi
