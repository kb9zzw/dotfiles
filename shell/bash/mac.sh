# os x bash_completion
if which brew > /dev/null 2>&1
then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  fi
  export PATH="/usr/local/bin":$PATH
fi

