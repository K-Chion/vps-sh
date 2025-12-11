#!/bin/bash

# 一键脚本菜单 for Debian
# One-click script menu for Debian

clear
echo "=========================================="
echo "        Chion VPS Toolbox"
echo "=========================================="
echo ""
echo "请选择要执行的操作："
echo ""
echo "  1. 安装 Caddy Web 服务器"
echo "  2. 卸载 Komari Agent"
echo ""
echo "  0. 退出"
echo ""
echo "=========================================="
echo ""

read -p "请输入选项 [0-2]: " choice

case $choice in
    1)
        echo ""
        echo "正在下载并执行 Caddy 安装脚本..."
        echo ""
        wget -O install_caddy.sh https://ba.sh/6M6g && chmod +x install_caddy.sh && ./install_caddy.sh
        ;;
    2)
        echo ""
        echo "正在下载并执行 Komari Agent 卸载脚本..."
        echo ""
        wget -O uninstall_komari.sh https://ba.sh/KeG5 && chmod +x uninstall_komari.sh && ./uninstall_komari.sh
        ;;
    0)
        echo ""
        echo "已退出。"
        exit 0
        ;;
    *)
        echo ""
        echo "无效选项，请输入 0、1 或 2。"
        exit 1
        ;;
esac
