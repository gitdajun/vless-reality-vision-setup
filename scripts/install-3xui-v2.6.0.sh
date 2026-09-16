#!/bin/bash
# 一键安装 3x-ui 指定版本 v2.6.0
# 官方源：https://github.com/mhsanaei/3x-ui

set -e

echo "=========================================="
echo " 正在安装 3x-ui v2.6.0 ..."
echo "=========================================="

VERSION=v2.6.0
bash <(curl -Ls "https://raw.githubusercontent.com/mhsanaei/3x-ui/$VERSION/install.sh") $VERSION

echo ""
echo "安装完成！请按照终端提示记录面板地址、用户名和密码。"
echo "建议自定义一个五位数端口。"
