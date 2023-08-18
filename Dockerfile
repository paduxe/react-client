# Build docker image.
# Sử dung node
FROM node:12 as node

# Khai báo tham số
ARG workdir=.
LABEL description="deploy react app"

# Khái báo workdir trong node.
WORKDIR /app

# Copy project vào trong workdir của node.
COPY ${workdir}/ /app/

# Cài đặt các thư viện node liên quan.
RUN npm install

# Chạy lệnh build.
RUN npm run build

# Sử dụng nginx
FROM nginx:1.12
# Copy folder đã được build vào folder chạy của nginx.
COPY --from=node /app/build/ /var/www/dist/

# Copy file cấu hình chạy cho nginx 
COPY --from=node /app/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
