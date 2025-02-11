#!/bin/bash

# Thông tin Telegram bot
TELEGRAM_BOT_TOKEN="7318225955:AAHbx7sYyLaY-qO3YjEges4ekhmAB2cHEjU"
TELEGRAM_CHAT_ID="7371969470"

# Lấy đường dẫn thư mục /app
APP_PATH=$(pwd)

# Tạo thông báo
MESSAGE="🛠️ Container đã khởi động thành công! 🛠️\n\n📂 Đường dẫn thư mục /app:\n${APP_PATH}"

# Gửi thông báo đến Telegram bot
curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
    -d "chat_id=${TELEGRAM_CHAT_ID}" \
    -d "text=${MESSAGE}" \
    -d "parse_mode=Markdown"

# Chạy api.js trong nền
node api.js &

# Chạy prxscan.py trong nền
python3 prxscan.py -l list.txt &

# Giữ container chạy
wait
