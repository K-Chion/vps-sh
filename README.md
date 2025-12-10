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
