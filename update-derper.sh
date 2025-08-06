#!/bin/bash

# 获取当天日期，例如：20250807
DATE=$(date +%Y%m%d)

# 设置工作目录（包含 docker-compose.yml 的目录）
WORKDIR="/opt/tailscale-derper"

# 替换 docker-compose.yml 中的镜像标签
sed -i "s|\(ghcr.io/sunnoy/tailscale-derper:\)[0-9]\+|\1${DATE}|g" "$WORKDIR/docker-compose.yml"

# 拉取新镜像（如果存在）
docker-compose -f "$WORKDIR/docker-compose.yaml" pull

docker-compose -f "$WORKDIR/docker-compose.yaml" down
# 重新启动容器
docker-compose -f "$WORKDIR/docker-compose.yaml" up -d
