# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY # adds history
setopt SHARE_HISTORY # share history between sessions
setopt INC_APPEND_HISTORY SHARE_HISTORY # incrementally append history and share across sessions
setopt HIST_IGNORE_ALL_DUPS # don't record duplicates
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt EXTENDED_HISTORY # add timestamp to history
