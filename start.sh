#!/bin/bash

# Tạo một session tmux mới
tmux new-session -d -s mysession

# Chạy api.js trong cửa sổ đầu tiên
tmux send-keys -t mysession "node api.js" C-m

# Tạo một cửa sổ mới trong session
tmux new-window -t mysession

# Chạy prxscan.py trong cửa sổ thứ hai
tmux send-keys -t mysession:1 "python3 prxscan.py -l list.txt" C-m

# Attach vào session để giữ container chạy
tmux attach-session -t mysession
