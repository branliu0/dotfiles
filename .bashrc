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
  echo $(which ruby >/dev/null && ruby -v | cut -d' ' -f 2)
}

function __hg_branch {
  hg branch 2> /dev/null | awk '{print " (" $1 ")"}'
}

set_prompt () {
  if [ $? -ne 0 ]; then
    ERR='($?) '
  else
    ERR=""
  fi

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

	PS1="
$EMB\u@\h:\w ${R}$ERR$R[\$(__ruby_version)]$M\$(__git_ps1)\$(__hg_branch)
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
alias ll='ls -l'
alias la='ls -A'
alias lal='ls -Al'
alias lla='ls -Al'

alias ..='cd ..'
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bir='bundle exec rake'
alias cp='cp -i'
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gcam='git commit -am'
alias gcm='git commit -m'
alias gd='git_diff'
alias gfo='git fetch origin'
alias gh='git hist'
alias gph='git push heroku master'
alias gpo='git push origin master'
alias gr='git rebase'
alias grm='git rebase master'
alias grom='git rebase origin/master'
alias gs='git status'
alias mvimcp='open -a Macvim .'
alias ppjson='python -mjson.tool'
alias reload='source "$HOME/.bashrc"'
alias rm='rm -i'
alias rs='rake spec'
alias rspec='rspec --color --backtrace --format=documentation'
alias tmux='tmux -2'
alias vi='vim'

alias tunnel='ssh -C2qTnN -D 8080 brandonkliu@brandonkliu.com'

export EDITOR=vim

export PATH=/usr/local/sbin:/usr/local/bin:~/bin:~/opt/bin:$PATH:~/dotfiles/bin
export PYTHONSTARTUP=~/.pystartup

# Turn on colors for grep
export GREP_COLORS=auto

if [[ -e ~/.bashrc.local ]]; then
	source ~/.bashrc.local
fi

source $HOME/.bash/completion.bash

if [[ -e /usr/local/etc/bash_completion ]]; then
  source /usr/local/etc/bash_completion
fi

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

fi
