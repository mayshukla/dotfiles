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

# load Xresources
#exec xrdb ~/.Xresources
# doesn't seem to work

# scale gtk/gdk based applications for HiDPI
# doesn't seem to work. Put in ~/.bashrc instead
# export GDK_SCALE=3
