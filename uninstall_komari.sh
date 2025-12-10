#!/bin/bash

# 定义颜色用于输出
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== 开始卸载 Komari Agent ===${NC}"

# 1. 停止服务
# 使用 || true 确保即使服务未运行脚本也能继续
echo "1. 正在停止 komari-agent 服务..."
sudo systemctl stop komari-agent || echo "   警告: 无法停止服务或服务未运行。"

# 2. 禁用服务
echo "2. 正在禁用 komari-agent 服务..."
sudo systemctl disable komari-agent || echo "   警告: 无法禁用服务或服务未启用。"

# 3. 删除 systemd 服务文件
echo "3. 正在删除服务配置文件 (/etc/systemd/system/komari-agent.service)..."
sudo rm -f /etc/systemd/system/komari-agent.service

# 4. 重载 systemd 守护进程
echo "4. 正在重载 systemd..."
sudo systemctl daemon-reload

# 5. 删除程序文件和日志
echo "5. 正在删除安装目录和日志 (/opt/komari/agent, /var/log/komari)..."
sudo rm -rf /opt/komari/agent /var/log/komari

echo -e "${GREEN}=== Komari Agent 卸载流程结束 ===${NC}"

# 6. 删除脚本自身
echo "6. 正在删除脚本自身..."
rm -- "$0"

