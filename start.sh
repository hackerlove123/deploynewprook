#!/bin/bash

# Chạy api.js trong nền
node api.js &

# Đợi 3 giây
sleep 3

# Chạy ok.js trong nền
node ok.js &

# Đợi 3 giây
sleep 3

# Chạy prxscan.py trong nền
python3 prxscan.py -l list.txt &

# Đợi 3 giây
sleep 3

# Giữ container chạy
while true; do
    sleep 1
done
