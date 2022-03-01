#!/bin/bash
#maximum 244 instances
session="teleport"

window=0
pane=0

tmux new-session -d -s $session
tmux rename-window -t $session:$window 'tsh'

while read -r line; 
do 
    tmux send-keys -t $session:$window.$pane 'tmux splitw -h' C-m
    tmux send-keys -t $session:$window.$pane 'tsh ssh root@'$line C-m 
    sleep .2
    pane=$[$pane+1]
    tmux send-keys -t $session:$window.$pane 'tmux selectl tiled' C-m 
done < host.txt

tmux send-keys -t $session:$window.$pane 'tmux bind-key C-x set-window-option synchronize-panes' C-m
tmux send-keys -t $session:$window.$pane 'exit' C-m
#tmux send-keys -t $session:$window C-b C-x

tmux attach-session -t $session