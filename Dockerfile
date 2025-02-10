# Sử dụng official Node.js 22
FROM node:22

# Tạo thư mục làm việc
WORKDIR /api

# Cập nhật hệ thống và cài đặt các package cần thiết
RUN apt update -y && apt install -y --no-install-recommends \
    bash curl git htop speedtest-cli python3-pip \
    && pip3 install requests python-telegram-bot pytz --break-system-packages \
    && npm install -g npm@latest \
    && npm install hpack https commander colors socks axios express \
    && npm install -g cloudflared \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Copy các file cần thiết vào container
COPY api.js .
COPY prxscan.py .
COPY list.txt .

# Run tất cả các file cần thiết khi container khởi động
CMD bash -c "node api.js & python3 prxscan.py -l list.txt"
