# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
if [ -n "$PS1" ] ; then

export HISTCONTROL=ignoreboth # ignoredups and ignorespace
shopt -s histappend

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

function set_prompt {
	# fancy colors
	local blk="\342\226\210"
	local c_1="\[\033[1;34m\]"
	local c_2="\[\033[0;36m\]"
	local c_0="\[\033[0;39m\]"

	#function set_screen_title {
		#THE_PATH=`pwd | sed "s/^\(.\+\)\///"`
		## set tab title
		#echo -ne \\033k${THE_PATH}\\033\\
		## set hardstatus
		##echo -ne \\033]0\;${THE_PATH}\\a
	#}
	#if [ "$TERM" == "screen-bce" ]; then
		#PROMPT_COMMAND='set_screen_title'
	#fi

	GIT_PS1_SHOWDIRTYSTATE=1
	#REV_PROMPT=\
	#'$(if [ -e .svn ]; then echo " r$(svn info | grep Revision | cut -d\  -f2)"
	   #elif [ $(expr match `pwd` "/home") -gt 0 ]; then
		 #__git_ps1;
	   #fi
	#)'
	REV_PROMPT='$(__git_ps1)'

	PS1="
$c_1\u@\h:\w $REV_PROMPT
$c_2`date +%D` \t \$$c_0 "
}

set_prompt

# Alias definitions.

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias lal='ls -Al'
alias lla='ls -Al'

alias vi='vim'
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias rm='rm -i'
alias tmux='tmux -2'
alias ack='ack-grep'

export EDITOR=vim

export PATH=/usr/local/bin:~/bin:~/opt/bin:$PATH

if [[ -e ~/.bashrc.local ]]; then
	source ~/.bashrc.local
fi

source $HOME/.bash/completion.bash

[[ -s "/home/brandonkliu/.rvm/scripts/rvm" ]] && source "/home/brandonkliu/.rvm/scripts/rvm" 

#PS1='\[\033k\033\\\]' # this little bit of insanity lets screen read the title of the running program
#export PS1=$PS1"$MG\u@\h$MB$REV_PROMPT $MW\w$R> $N"

function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

function gsl() {
  git log --oneline --color $* | head
}

fi
