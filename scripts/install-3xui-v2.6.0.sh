#!/bin/bash
# 安装 3x-ui v2.6.0

set -e

echo "=========================================="
echo " 正在安装 3x-ui v2.6.0 ..."
echo "=========================================="

VERSION=v2.6.0
bash <(curl -Ls "https://raw.githubusercontent.com/mhsanaei/3x-ui/$VERSION/install.sh") $VERSION

echo ""
echo "安装完成。请记录面板地址、用户名和密码。"
echo "建议使用五位数端口。"
