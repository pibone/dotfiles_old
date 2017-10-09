# Ensure the installation is correctly placed
if [ ! -d $XDG_DATA_HOME/prezto ]; then
  echo "Prezto is not installed, installing."
  mkdir -p $XDG_DATA_HOME
  git clone --recursive https://github.com/sorin-ionescu/prezto.git $XDG_DATA_HOME/prezto
  echo "Finished wait or push a key to continue..."
  read -t5 key
fi

[ -d $XDG_CACHE_HOME/zsh ] || mkdir -p $XDG_CACHE_HOME/zsh

# Configuration for prezto
source $XDG_DATA_HOME/prezto/init.zsh

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# Set KEYTIMEOUT to the least possible value
export KEYTIMEOUT=1

# Set DEFAULT_USER if not assigned, the home folder's name will be used
export DEFAULT_USER=${DEFAULT_USER:=`basename $HOME`}

# History conf
export HISTSIZE=${HISTSIZE:=10000}
export SAVEHIST=${SAVEHIST:=10000}
export HISTFILE=$XDG_CACHE_HOME/zsh/history

# FZF
if [ -d /usr/share/fzf ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

