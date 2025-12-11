#!/bin/bash

# Caddy 一键安装脚本 for Debian
# One-click Caddy installation script for Debian

set -e

echo "=========================================="
echo "  Caddy 一键安装脚本 for Debian"
echo "=========================================="
echo ""

# 检查是否为 root 用户或有 sudo 权限
if [ "$EUID" -ne 0 ]; then
    if ! command -v sudo &> /dev/null; then
        echo "错误: 请使用 root 用户运行此脚本，或确保已安装 sudo"
        exit 1
    fi
    SUDO="sudo"
else
    SUDO=""
fi

echo "[1/6] 安装必要的依赖包..."
$SUDO apt install -y debian-keyring debian-archive-keyring apt-transport-https curl

echo ""
echo "[2/6] 添加 Caddy GPG 密钥..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | $SUDO gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

echo ""
echo "[3/6] 添加 Caddy 软件源..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | $SUDO tee /etc/apt/sources.list.d/caddy-stable.list

echo ""
echo "[4/6] 设置密钥文件权限..."
chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg

echo ""
echo "[5/6] 设置软件源文件权限..."
chmod o+r /etc/apt/sources.list.d/caddy-stable.list

echo ""
echo "[6/6] 更新软件源并安装 Caddy..."
$SUDO apt update
$SUDO apt install -y caddy

echo ""
echo "=========================================="
echo "  Caddy 安装完成！"
echo "=========================================="
echo ""
echo "常用命令:"
echo "  启动 Caddy:   sudo systemctl start caddy"
echo "  停止 Caddy:   sudo systemctl stop caddy"
echo "  重启 Caddy:   sudo systemctl restart caddy"
echo "  查看状态:     sudo systemctl status caddy"
echo "  设置开机启动: sudo systemctl enable caddy"
echo ""

# 获取脚本自身路径并删除
SCRIPT_PATH="$(readlink -f "$0")"
echo "正在删除安装脚本..."
rm -f "$SCRIPT_PATH"
echo "安装脚本已删除。"
