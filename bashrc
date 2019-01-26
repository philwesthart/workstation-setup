


alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias up='cd ..'



# Git stuff
alias gs='git status -sb'
alias gd='git diff'
alias gds='git diff --staged'
alias glog='git log --max-count 10 --graph --date=relative --pretty=format:"%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset"'

function :w() {
  git add -A
  git add -u

  if [ "$#" != "0" ] ; then
    # new commit with the given message
    git commit -m "$*"
  elif [ "$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD) | grep '\/')" == '' ]; then
    # no remote
    git commit --amend --no-edit
  elif [ "$(git cherry)" != '' ]; then
    # no pushed
    git commit --amend --no-edit
  else
    # has to be a new commit, prompt for message
    git commit
  fi
}

function pull() {
  # this function needs work
  if [ -z "$(git diff --name-only | head -1)" ]; then
    git pull $@
  else
    git stash >/dev/null 2>&1
    git pull $@
    git stash pop -q
  fi
  git status
}

function push() {
  git push $@
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

