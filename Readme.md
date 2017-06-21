# Install
Firstly, install all the used applications. Listed the names for Archlinux-based system
playerctl
ponymix
neovim
chromium
pepper-flash
rofi
zathura
i3blocks
gedit
thunar
dex
virtualbox
xsel
ranger
morc\_menu
moc
nitrogen
spotify
viewnior
zsh
i3
blurlock
enchant
dunst
compton
mousepad
hexchat
volumeicon
arandr
bmenu
htop
clipit
pulseaudio
git
yaourt
xfce4-power-manager

## SpaceVim
```sh
git submodule update --init --recursive -- nvim
ln -s $XDG_CONFIG_HOME/SpaceVim $HOME/.SpaceVim.d
```

## PAM
```sh
ln -s $XDG_CONFIG_HOME/pam_environment $HOME/.pam_environment
```

## SHENV
```sh
ln -s $XDG_CONFIG_HOME/shenv $HOME/.zshenv
ln -s $XDG_CONFIG_HOME/shenv $HOME/.bash_profile
```

## moc
```sh
ln -s $XDG_CONFIG_HOME/moc $HOME/.moc
```

## dmrc
```sh
ln -s $XDG_CONFIG_HOME/dmrc $HOME/.dmrc
```

