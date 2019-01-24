


alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias up='cd ..'



# Git stuff
alias gs='git status -sb'
alias gd='git diff'
alias gds='git diff --staged'
alias glog='git log --max-count 10'

function :w() {
  git add -A
  git add -u

  if [ $# -gt 0 ] ; then
    # new commit with the given message
    git commit -m "$*"
  fi
  
}

# git prompt stuff

# Include git-prompt.sh where the __git_ps1 function is defined
# It can be downloaded from http://git-prompt.sh/. or github.com/git/git/contrib/completion
source ~/.git-prompt.sh

# Displays a * and + next to the branch name if there are unstaged (*) and staged (+) changes
export GIT_PS1_SHOWDIRTYSTATE=true

# Displays a % if there are untracked files
export GIT_PS1_SHOWUNTRACKEDFILES=true

# Color variables
GREEN="\[\e[1;32m\]"
CYAN="\[\e[1;36m\]"
MAGENTA="\[\e[1;35m\]"
ENDCOLOR="\[\e[m\]"         # ends the last color

export PS1="${GREEN}\u@\h ${CYAN}\w${MAGENTA}\$(__git_ps1 ' |%s|') ${CYAN}$ ${ENDCOLOR}"




# default programs
export CC=$(which clang)
export CXX=$(which clang++)

export VISUAL=vim
export EDITOR="$VISUAL"

