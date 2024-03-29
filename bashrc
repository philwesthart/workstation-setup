# source local bashrc if present
LOCAL_BASHRC="$HOME/.localbashrc"
if test -f "$LOCAL_BASHRC"; then
   source "$LOCAL_BASHRC"
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias up='cd ..'
alias screen_help='cat ${SCRIPT_DIR}/screen_help'

# Git stuff
alias gs='git status -sb'
alias gd='git diff'
alias gds='git diff --staged'
alias glog='git log --max-count 10 --graph --date=relative --pretty=format:"%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset"'

# git prompt stuff

# Color variables
GREEN="\[\e[1;32m\]"
CYAN="\[\e[1;36m\]"
MAGENTA="\[\e[1;35m\]"
ENDCOLOR="\[\e[m\]"         # ends the last color

function __git_branch() {
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    echo " $branch"
  fi
}

export PS1="${GREEN}\u@\h ${CYAN}\w${MAGENTA}\$(__git_branch) ${CYAN}> ${ENDCOLOR}"

# Enable git completions
GITCOMP=/usr/share/bash-completion/completions/git
if test -f "$GITCOMP"; then
   source $GITCOMP
fi

# default programs
export VISUAL=vim
export EDITOR="$VISUAL"

# power to the people
export N_PREFIX="$HOME/workstation-setup/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"

# wow such new paths
PATHS_FILE="$HOME/workstation-setup/paths"
if [ ! -f "$PATHS_FILE" ] ; then
   touch $PATHS_FILE
fi

while read path; do
  [[ :$PATH: == *":$path:"* ]] || PATH="$path:$PATH"
done <$PATHS_FILE

export MAKEFLAGS=-j
