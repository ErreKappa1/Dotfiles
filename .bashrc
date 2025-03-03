# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)################
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ "$force_color_prompt" = yes ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

function cdd {

	if [[ -z $1 ]]
	then
		cd ~
	else
		cd "$1"
	fi

	path=$(echo "${PWD/${HOME}/}")
	if [ $(echo "${path}" | tr -cd '/' | wc -c) -ge 4 ]
	then
		path=$(echo "${path}" | sed -E 's/^.*((\/[[:alnum:]\_]+){3})$/\/\.\.\.\1/')
	fi
	if [[ $(echo `pwd` | cut -d '/' -f 3) == $(echo `whoami`) ]]
	then
		path=~$path
	fi

}

if [ "$color_prompt" = yes ]; then
	#vanilla PS1
	#PS1='${arch_chroot:+($arch_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\] \w\[\033[00m\] \$ '
	#limited PS1
	PS1='${arch_chroot:+($arch_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\] ${path}\[\033[00m\] \$ '
else
	#black/white PS1
	PS1="\[\e]0;${arch_chroot:+($arch_chroot)}\u@\h: \w\a\]$PS1"
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${arch_chroot:+($arch_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac
#LS_COLORS='di=34:ln=35:ex=31'
#export LS_COLORS

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Add an "alert" alias for long running commands.  Use like so:
#comment
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cd='cdd'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'
alias ll='ls -l --color'
alias la='ls -A --color'
alias ls='ls --color'
alias l='ls -la --color'
alias ip='ip -p -c'

cd .
