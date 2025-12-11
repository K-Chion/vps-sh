#!/bin/bash

# Chion VPS Toolbox for Debian
# One-click script menu for Debian

SCRIPT_PATH="$(readlink -f "$0")"

# 首次运行时自动设置快捷启动
setup_shortcut() {
    if [ ! -L /usr/local/bin/chion ]; then
        echo "正在设置快捷启动..."
        if [ "$EUID" -ne 0 ]; then
            sudo ln -sf "$SCRIPT_PATH" /usr/local/bin/chion
        else
            ln -sf "$SCRIPT_PATH" /usr/local/bin/chion
        fi
        
        if [ -L /usr/local/bin/chion ]; then
            echo ""
            echo "=========================================="
            echo "  ✓ 快捷启动已设置！"
            echo "  之后可直接输入 'chion' 运行此工具箱"
            echo "=========================================="
            echo ""
        fi
    fi
}

# 卸载工具箱
uninstall_toolbox() {
    echo ""
    echo "正在卸载 Chion VPS Toolbox..."
    
    # 移除快捷启动
    if [ -L /usr/local/bin/chion ]; then
        if [ "$EUID" -ne 0 ]; then
            sudo rm -f /usr/local/bin/chion
        else
            rm -f /usr/local/bin/chion
        fi
        echo "✓ 快捷启动已移除"
    fi
    
    # 删除脚本自身
    echo "✓ 正在删除脚本..."
    rm -f "$SCRIPT_PATH"
    echo ""
    echo "=========================================="
    echo "  Chion VPS Toolbox 已完全卸载"
    echo "=========================================="
    exit 0
}

show_menu() {
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
    echo "  9. 卸载此工具箱"
    echo "  0. 退出"
    echo ""
    echo "=========================================="
    echo ""
}

# 首次运行自动设置快捷启动
setup_shortcut

show_menu

read -p "请输入选项: " choice

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
    9)
        uninstall_toolbox
        ;;
    0)
        echo ""
        echo "已退出。"
        exit 0
        ;;
    *)
        echo ""
        echo "无效选项。"
        exit 1
        ;;
esac
