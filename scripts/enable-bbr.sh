#!/bin/bash
# 开启 BBR 加速（适用于大多数 Linux 发行版）
# 仅做基础 BBR 开启，复杂 TCP 调优请自行参考其他脚本

set -e

echo "=========================================="
echo " 检查并开启 BBR ..."
echo "=========================================="

# 检查是否已开启
if lsmod | grep -q bbr; then
    echo "BBR 已加载。"
else
    echo "正在加载 BBR 模块..."
    modprobe tcp_bbr || true
fi

# 写入配置（永久生效）
cat > /etc/sysctl.d/99-bbr.conf <<EOF
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
EOF

sysctl --system

echo ""
echo "当前拥塞控制算法："
sysctl net.ipv4.tcp_congestion_control
echo ""
echo "BBR 已尝试开启。重启后仍会生效。"
