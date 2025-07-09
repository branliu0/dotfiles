# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
if [ -n "$PS1" ] ; then

export HISTCONTROL=ignoreboth # ignoredups and ignorespace
shopt -s histappend

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

function __ruby_version {
  ver=$(ruby -v 2> /dev/null | cut -d' ' -f 2)
  if [[ -n $ver ]]; then
    echo "[$ver]"
  fi
}

function __python_version {
  ver=$(python -V 2>/dev/null | cut -d' ' -f2)
  if [[ -n $ver ]]; then
    echo "[🐍 $ver]"
  fi
}

function __hg_branch {
  hg branch 2> /dev/null | awk '{print " (" $1 ")"}'
}

function __virtualenv {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo " (venv)"
  fi
  if [[ -n "$CONDA_PROMPT_MODIFIER" ]]; then
    echo " $CONDA_PROMPT_MODIFIER"
  fi
}

function __k8s_context {
  if command -v kubectl &> /dev/null; then
    echo " (⎈ $(kubectl config current-context))"
  fi
}

set_prompt () {
  local errcode=$?
  # if [[ "$errcode" -ne 0 ]]; then
    # ERR="[$errcode] "
  # else
    # ERR=""
  # fi

  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  GIT_PS1_SHOWDIRTYSTATE=1

  # Set the tab title in iTerm2 to the PWD.
  echo -ne "\033]0;${PWD/#$HOME/~}\007"

  PS1="
$EMB\u@\h:\w ${R}[$errcode] $G$(__python_version)$M\$(__git_ps1)\$(__hg_branch)$EMY\$(__virtualenv)$C\$(__k8s_context)$NONE
$C`date +%D` \t \$$NONE "
}

PROMPT_COMMAND=set_prompt

# Alias definitions.

# enable color support of ls
if [ "$TERM" != "dumb" ]; then
  if [[ "$OSTYPE" =~ "darwin" ]]; then
    alias ls='ls -G'
    LSCOLORS='gxfxcxdxbxegedabagacad'
  else
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
  fi
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias lal='ls -Al'
alias lla='ls -Al'

alias ..='cd ..'
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bir='bundle exec rake'
alias cp='cp -i'
alias debugpy="uv run python -Xfrozen_modules=off -m debugpy --wait-for-client --listen localhost:5678"
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gcam='git commit -am'
alias gcm='git commit -m'
alias gd='git_diff'
alias gfo='git fetch origin'
alias gh='git hist'
alias gm='git merge --ff-only'
alias go='git checkout'
alias gp='git pull'
alias gph='git push heroku'
alias gpo='git push origin'
alias gpp='git pull --prune'
alias gr='git rebase'
alias grm='git rebase master'
alias grom='git rebase origin/master'
alias gs='git status'
alias hdj='heroku run python manage.py'
alias hr='heroku run'
type hub &> /dev/null && alias git='hub'
alias k='kubectl'
alias mvimcp='open -a Macvim .'
alias npm-exec='PATH=$(npm bin):$PATH'
alias ppjson='python -mjson.tool'
alias reload='source "$HOME/.bashrc"'
alias rm='rm -i'
alias rs='rake spec'
alias rspec='rspec --color --backtrace --format=documentation'
alias t='column -t'
alias tmux='tmux -2'
alias tunnel='ssh -C2qTnN -D 8080 brandonkliu@brandonkliu.com'
alias v='source .venv/bin/activate'
alias vi='vim'

# kubectl aliases
alias k="kubectl"
alias kd="kubectl describe"
alias kev="kubectl get event --sort-by='{.metadata.creationTimestamp}'"
alias kctx="kubectl config use-context"
kj() { kubectl "$@" -o json | jq; }
kjx() { kubectl "$@" -o json | fx; }
ky() { kubectl "$@" -o yaml | bat -l yaml --style plain; }


# get KFP arguments passed to a given pod
kfp-args() {
  k get pod "$@" -o jsonpath='{.metadata.annotations}' \
    | jq -r '."pipelines.kubeflow.org/arguments.parameters"' \
    | jq .
}




# Git completion and handle aliases
if [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]; then
  source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"

  # Add git completion to aliases
  __git_complete g __git_main
  __git_complete go _git_checkout
  __git_complete gm _git_merge
else
  echo "git bash completion not installed."
fi

export EDITOR=vim
export GREP_COLORS=auto # Turn on colors for grep
export PATH=/usr/local/sbin:~/bin:~/opt/bin:$PATH:~/dotfiles/bin
export PYTHONSTARTUP=~/.pystartup

if [[ -e ~/.bashrc.local ]]; then
  source ~/.bashrc.local
fi

source $HOME/.bash/completion.bash

function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

function gsl() {
  git log --oneline --color $* | head
}

function mkcd() {
  dir="$1"
  mkdir -p $dir && cd $dir
}

function dj() {
  python `find-up manage.py` "$@"
}

function gcs() {
  # Hacky URL encoding
  uri=$(echo "$@" | sed 's/^gs:\/\///' | sed 's/=/%3D/g' |  sed 's/ /%20/g')
  url="https://console.cloud.google.com/storage/browser/$uri;tab=objects?authuser=0&project=bluerose-300816&pageState=(%22StorageObjectListTable%22:(%22f%22:%22%255B%255D%22))&prefix=&forceOnObjectsSortingFiltering=false"
  open $url
}

fi
