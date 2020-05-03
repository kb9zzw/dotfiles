export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=~/.zsh_custom

# Theme
ZSH_THEME="kb9zzw"

# Workspaces
export WORKSPACE=$HOME/workspace

# Autoload compinit
autoload -U compinit
compinit

fpath=($ZSH_CUSTOM/functions $fpath)
autoload -U $ZSH_CUSTOM/functions/*(:t)

# Disable Anaconda init
INIT_CONDA=false


# Plugins
plugins=(
  git
  virtualenv
  conda
  fzf
  pyenv
  rbenv
  nvm
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ZSH includes
ZSH_INCLUDES=$HOME/.zsh_custom/includes

while read -r file; do
  source "$file"
done < <(find ${ZSH_INCLUDES} -type f)

# Include local config, if available
[ -f "$HOME/.zsh_local" ] && source $HOME/.zsh_local
true
