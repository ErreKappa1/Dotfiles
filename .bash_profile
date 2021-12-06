if [ -f ~/.bashrc ]
then
	. ~/.bashrc
fi

echo \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Remember to pull
neofetch
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias backup='sudo ~/Coding/Bash/Random_Script/backUp/mountHDD.sh'
alias cd='cdd'
alias egrep='egrep --color=auto'
alias fetch='neofetch --ascii_colors 12 5'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias help='bash -c help'
alias l='ls -la --color=auto'
alias la='ls -A --color=auto'
alias lightdown='backlight_control -10.4'
alias lightup='backlight_control +10.4'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias megapull='~/Coding/Bash/Random_Script/gitPull.sh'
alias megapush='~/Coding/Bash/Random_Script/gitPush.sh'
alias mktemplate='/home/riky/Documents/Git/ErreKappa1/MakeTemplate/mkTemplate.sh'
alias please='sudo'
alias term='xfce4-terminal & > /dev/null'
alias vlc='cvlc'
alias volumedown='pamixer -i 2'
alias volumetoggle='pamixer -t'
alias volumeup='pamixer -d 2'
alias w3md='w3m www.duckduckgo.com'
