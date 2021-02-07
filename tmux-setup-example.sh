#!/bin/bash

tmux new-session -A -d  -s p4
tmux select-window -t 0
tmux rename-window "Make"
tmux split-window -t 0 -h "vim Makefile"

tmux new-window -n Exe

tmux new-window -n Server "vim Server.java"

tmux new-window -n UserNode "vim UserNode.java"

tmux new-window -n CommitServer "vim CommitServer.java"
tmux split-window -h "vim CommitServerManager.java"

tmux new-window -n CommitUser "vim CommitUser.java"
tmux split-window -h "vim CommitUserManager.java"

tmux new-window  -n Messages "vim MessageToServer.java"
tmux split-window -h "vim MessageToUser.java"

tmux new-window -n Memory "vim MemoryManager.java"
tmux split-window -h

tmux new-window -n WAL "vim WriteAheadLogger.java"
tmux split-window -h "vim Intention.java"

tmux new-window -n FileManager "vim FileManager.java"

tmux select-window -t 0
tmux attach-session -d -t p4
