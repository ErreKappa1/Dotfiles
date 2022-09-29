#!/bin/sh
#
session="Gnu/Linux_"

# set up tmux
tmux start-server

# create a new tmux session
tmux new-session -d -s $session -n Home

# Select pane 1, set dir to api, run neofetch
tmux selectp -t 1 

# Split pane 1 horizontal by 65%, start w3m
tmux splitw -h -p 35
tmux send-keys "w3md" C-m 

# Select pane 2 
tmux selectp -t 2
# Split pane 2 vertically by 60%
tmux splitw -v -p 55

# select pane 3, set to api root
tmux selectp -t 3
tmux send-keys "htop" C-m 

#Split pane 4
#tmux splitw -v -p 85
#Use pane 4
#tmux selectp -t 4
#tmux send-keys "ranger" C-m

# Select pane 5
#tmux selectp -t 0
#tmux splitw -v -p 5
#tmux select p -t 5

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
