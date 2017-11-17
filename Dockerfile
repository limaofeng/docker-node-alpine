FROM node:6.11.1-alpine

# 添加 bash
RUN apk update && apk add bash libstdc++ && \
    # 设置时区
    apk add ca-certificates && \
    apk add tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    rm -rf /var/cache/apk/*

# 设置 npm 镜像    
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

# 安装 yarn
RUN cnpm install -g yarn

ENV LANG="zh_CN.UTF-8"
