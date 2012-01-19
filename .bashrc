# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load the engineering stuff
if [ -e /var/cfengine/classes/nextgen ]
then
   source /home/fonix/prd_progs/tools/engineering-login.sh
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PS1="\[\e[1;37m\]\w \$\[\e[m\] "

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias suf='sudo -u fin_mgr'
alias revb='perl /home/data/index/script/common/submit_review_board.pl'

set -o vi
export EDITOR=vim

# FDS
export P4PORT=scm.factset.com:1666
export P4CONFIG=.p4rc
export P4EDITOR='vim -S ~/myscripts/perf.vim'
export UNLOCK_DATABASE_UTILS=1
export UNLOCK_FDB_UTILS=1
export PATH="$HOME/.gem/ruby/1.8/bin:$PATH"

