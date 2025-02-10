# Sử dụng official Node.js 22
FROM node:22

# Tạo thư mục làm việc
WORKDIR /api

# Cập nhật hệ thống và cài đặt các package cần thiết
RUN apt update -y && apt install -y --no-install-recommends \
    bash curl git htop speedtest-cli python3-pip supervisor \
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
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Cấp quyền thực thi cho các script
RUN chmod +x /api/api.js /api/prxscan.py

# Chạy supervisord khi container khởi động
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
