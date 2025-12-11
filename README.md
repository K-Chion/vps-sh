# 一键卸载 Komari Agent

本脚本用于在 Debian 系统上完全卸载 Komari Agent。

## 一键运行指令

复制并执行以下命令即可（推荐）：

```bash
wget -O uninstall_komari.sh https://ba.sh/KeG5 && chmod +x uninstall_komari.sh && ./uninstall_komari.sh
```

## 脚本执行内容

此脚本将按顺序执行以下操作：
1. 停止 `komari-agent` 服务
2. 禁用开机自启
3. 删除 systemd 服务配置文件
4. 重载系统守护进程
5. 彻底删除程序安装目录 (`/opt/komari/agent`) 和日志目录 (`/var/log/komari`)
6. 自动删除脚本自身

---

# 一键安装 Caddy

本脚本用于在 Debian 系统上一键安装 Caddy Web 服务器。

## 一键运行指令

复制并执行以下命令即可（推荐）：

```bash
wget -O install_caddy.sh https://ba.sh/6M6g && chmod +x install_caddy.sh && ./install_caddy.sh
```

## 脚本执行内容

此脚本将按顺序执行以下操作：
1. 安装必要依赖包 (`debian-keyring`, `debian-archive-keyring`, `apt-transport-https`, `curl`)
2. 添加 Caddy 官方 GPG 密钥
3. 添加 Caddy 官方软件源
4. 设置密钥和软件源文件权限
5. 更新软件源并安装 Caddy
6. 自动删除脚本自身

## 安装后常用命令

| 操作 | 命令 |
|------|------|
| 启动 Caddy | `sudo systemctl start caddy` |
| 停止 Caddy | `sudo systemctl stop caddy` |
| 重启 Caddy | `sudo systemctl restart caddy` |
| 查看状态 | `sudo systemctl status caddy` |
| 设置开机启动 | `sudo systemctl enable caddy` |

---

# Chion VPS Toolbox

一键工具箱脚本，提供交互式菜单，方便快速执行常用操作。

## 一键运行指令

复制并执行以下命令即可（推荐）：

```bash
wget -O chion_vps_toolbox.sh https://ba.sh/Kep5 && chmod +x chion_vps_toolbox.sh && ./chion_vps_toolbox.sh
```

## 特性

- **快捷启动**：首次运行自动设置，之后可直接输入 `chion` 运行工具箱
- **交互式菜单**：简单选择即可执行常用操作

## 功能菜单

| 选项 | 功能 |
|------|------|
| 1 | 安装 Caddy Web 服务器 |
| 2 | 卸载 Komari Agent |
| 9 | 卸载此工具箱（移除快捷启动并删除脚本）|
| 0 | 退出 |
