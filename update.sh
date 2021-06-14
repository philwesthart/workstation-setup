#!/usr/bin/env bash

set -e

DIR="$(cd $( dirname ${BASH_SOURCE[0]}) && pwd)"
cd "$DIR"

# Move existing bashrc to local bashrc
LOCAL_BASHRC="$HOME/.localbashrc"
BASHRC="$HOME/.bashrc"
# only do this if localbashrc hasn't been made yet
if [ ! -f "$LOCAL_BASHRC" ] ; then
    # If there is an existing bashrc, move to local
    if test -f "$BASHRC"; then
        mv $BASHRC $LOCAL_BASHRC
    # otherwise, make a blank localbashrc
    else
        touch $LOCAL_BASHRC
    fi
fi

# link config files
ln -sfT "$DIR/bashrc" "$HOME/.bashrc"
ln -sfT "$DIR/vimrc" "$HOME/.vimrc"
ln -sfT "$DIR/inputrc" "$HOME/.inputrc"
ln -sfT "$DIR/gdbinit" "$HOME/.gdbinit"

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

echo "Installing Pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Plugins 
clone_or_pull https://github.com/ervandew/supertab
clone_or_pull https://github.com/kien/ctrlp.vim
clone_or_pull --depth=1 https://github.com/scrooloose/syntastic.git
clone_or_pull https://github.com/tpope/vim-sensible
clone_or_pull https://github.com/tpope/vim-fugitive
clone_or_pull https://github.com/scrooloose/nerdtree
clone_or_pull https://github.com/vim-airline/vim-airline
clone_or_pull https://github.com/airblade/vim-gitgutter
clone_or_pull https://github.com/yegappan/taglist.git
clone_or_pull https://github.com/xolox/vim-easytags.git
clone_or_pull https://github.com/xolox/vim-misc.git 

# Dev tools
sudo apt install meld htop byobu 

