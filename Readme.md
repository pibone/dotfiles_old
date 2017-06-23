# Install
Clone this repo as your `$XDG_CONFIG_HOME` if not configured the env path,
clone it to ~/.config (replacing your current folder) and continue reading.
Firstly, install all the used applications. Listed the names for Archlinux-based system
```sh
pacman -Syyu
pacman -S playerctl ponymix chromium rofi zathura i3blocks gedit thunar \
           dex xcape virtualbox xsel ranger morc_menu nitrogen viewnior \
           zsh i3 i3exit enchant dunst compton mousepad hexchat volumeicon \
           arandr bmenu htop clipit pulseaudio git yaourt xfce4-power-manager
yaourt -S pepper-flash spotify
yaourt -Syyu

```
The rest of this intall requires you to have XDG spec properly configured
or use the PAM Environment Install first and exit the session and login again.

## PAM Environment _Deprecated use DOTENV|DOTPROFILE_
If already configured XDG spec:
```sh
ln -s $XDG_CONFIG_HOME/pam_environment $HOME/.pam_environment
```
If not:
    .config will be the location of your config, change if you want and configure in pam
```sh
ln -s .config/pam_environment $HOME/.pam_environment
```

## DOTENV | DOTPROFILE
Default DOTENV is `$HOME/.env`, place a file and configure the environment using `[z|ba|c]sh`

Default DOTPROFILE is `$HOME/.profile`, place a file and configure the profile using `[z|ba|c]sh`
symlink DOTPROFILE to `$XDG_CONFIG_HOME/shell/profile` or source it in your own

Can be changed then place before than `shell/env` config is sourced. DOTENV is loaded first and the DOTPROFILE.

## SpaceVim[NeoVim]
```sh
pacman -S python-pip neovim
pip install neovim
git submodule update --init --recursive -- nvim
ln -s $XDG_CONFIG_HOME/SpaceVim $HOME/.SpaceVim.d
```

## SHENV
```sh
ln -s $XDG_CONFIG_HOME/shell/env $HOME/.zshenv
ln -s $XDG_CONFIG_HOME/shell/env $HOME/.bash_profile
```

## moc
```sh
pacman -S moc
ln -s $XDG_CONFIG_HOME/moc $HOME/.moc
```

## dmrc
```sh
ln -s $XDG_CONFIG_HOME/dmrc $HOME/.dmrc
```

## dmrc
```sh
ln -s $XDG_CONFIG_HOME/dmrc $HOME/.dmrc
```

## Editorconfig
```sh
yaourt -S editorconfig-core-c
ln -s $XDG_CONFIG_HOME/editorconfig/config $HOME/.editorconfig
```
