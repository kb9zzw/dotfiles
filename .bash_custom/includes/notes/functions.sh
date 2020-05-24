#!/bin/bash

# Initialize notes
function init_notes {
  if [-n "$1"]; then
    git clone $1 ~/notes
  else
    git clone -o bare https://gitlab.com/kb9zzw/notes-bare.git ~/notes
  fi
  git remote rm bare
}

# New note
function nn {
  if [ -n "$1" ]; then
    $EDITOR ~/notes/docs/topics/$1.md
  else
    $EDITOR ~/notes/docs/timestamp/$(date +%Y-%m-%d_%H%M).md
  fi
}

# Edit note
function en {
  if [ -n "$1" ]; then
    $EDITOR ~/notes/docs/topics/$1.md
  else
    $EDITOR ~/notes/docs/timestamp/$(ls -1t ~/notes/docs/timestamp | head -n1)
  fi
}

# Web note
function wn {
  if [ -n "$1" ]; then
    port=$1
  else
    port=8000
  fi
  $(cd ~/notes && mkdocs serve -a localhost:$port)
}

# Publish notes to git
function psn {
  pushd ~/notes
  git add -A .
  git commit -m "notes $(date)"
  if [ -n "$1" ]; then
    git push $1 master
  else
    git push origin master
  fi
  popd
}

# Pull notes from git
function pln {
  pushd ~/notes
  if [ -n "$1" ]; then
    git pull $1 master
  else
    git pull origin master
  fi
  popd
}
