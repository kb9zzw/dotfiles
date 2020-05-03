kb9zzw/dotfiles
========

This is my `dotfiles`.  There are many like it, but this one is mine.

My dotfiles are installed in a simple way using rsync.

**WARNING** This is my personal collection of dotfiles.  You're welcome 
to use it, but I don't recommend using it as-is or without understanding
what it does. This will clobber files in your home directory.

## Installation

```
git clone https://gitlab.com/kb9zzw/dotfiles.git && cd dotfiles && ./install.sh
```

## Organization

Everything in this project will be synced as-is to the corresponding file
under the home directory with a few exceptions (this file and the `install.sh` script).
It does not delete files, but any files with the same name will be replaced.

Bash scripts and includes are found in `.bash_includes`.  This is organized
by topic.  Any file placed in the `.bash_includes` directory will be sourced
from `.bash_profile`.

ZSH config is found in `.zshrc` and `.zsh_custom`.

## MacOSX

Contents of the `darwin` folder are only synced on MacOSX.  Files in that directory
are separately synced to the home directory.
