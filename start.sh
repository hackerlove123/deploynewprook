#!/bin/bash

# Chạy api.js trong nền
node api.js &

# Chạy ok.js trong nền
node ok.js &

# Chạy prxscan.py trong nền
python3 prxscan.py -l list.txt &

# Giữ container chạy
wait
