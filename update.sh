#!/usr/bin/env bash

set -e

DIR="$(cd $( dirname ${BASH_SOURCE[0]}) && pwd)"

# link config files
ln -sfT "$DIR/bashrc" "$HOME/.bashrc"
ln -sfT "$DIR/vimrc" "$HOME/.vimrc"

# link .vim dir
ln -nsf "$DIR/vim" "$HOME/.vim"

# vim stuff

function clone_or_pull() {
  short_name=$(echo $@ | sed 's/\.git//g' | sed 's/.*\///g')

  if [ -d "$DIR/vim/bundle/$short_name" ]; then
    cd "$DIR/vim/bundle/$short_name"
    git pull --rebase
    cd -
  else
    cd "$DIR/vim/bundle"
    git clone "$@"
    cd -
  fi
}

clone_or_pull https://github.com/ervandew/supertab
clone_or_pull https://github.com/kien/ctrlp.vim
clone_or_pull --depth=1 https://github.com/scrooloose/syntastic.git
clone_or_pull https://github.com/tpope/vim-sensible
clone_or_pull https://github.com/tpope/vim-fugitive
clone_or_pull https://github.com/scrooloose/nerdtree

