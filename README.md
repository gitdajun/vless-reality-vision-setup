# VLESS + Reality + Vision 节点搭建指南（基于 3x-ui）

本仓库整理了在 VPS 上使用 3x-ui 面板搭建 **VLESS + Reality + Vision** 节点的步骤，并提供一键安装脚本。

> 原始教程参考：[vpsoso.com](https://vpsoso.com/blog/kxsw/vless_create)

## 一、准备工作

1. 购买一台 VPS（推荐线路：CN2GIA / 9929 等）
2. 确保可以 SSH 登录（root 权限）

## 二、一键安装 3x-ui 面板

### 方式 1：指定稳定版本（推荐 v2.6.0）

```bash
bash <(curl -Ls https://raw.githubusercontent.com/gitdajun/vless-reality-vision-setup/main/scripts/install-3xui-v2.6.0.sh)
```

或直接使用官方命令：

```bash
VERSION=v2.6.0 && bash <(curl -Ls "https://raw.githubusercontent.com/mhsanaei/3x-ui/$VERSION/install.sh") $VERSION
```

### 方式 2：安装最新版

```bash
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
```

安装过程中：
- 自定义面板端口：建议输入一个五位数端口（如 10096）
- 其他选项保持默认即可

安装完成后，终端会输出：
- 面板访问 URL
- 用户名
- 密码

用浏览器打开 URL 并登录。

## 三、创建 VLESS + Reality + Vision 入站

登录 3x-ui 面板后：

1. 进入「入站列表」→「添加入站」
2. 按以下要点配置（其他保持默认）：

| 项目 | 设置 |
|------|------|
| 备注 | 自定义 |
| 协议 | `vless` |
| 安全 | `reality` |
| Dest (Target) | 保持默认或选择可用域名 |
| SNI | 核心配置，建议使用常见网站域名（如 `www.microsoft.com` 等，不通就换） |
| Flow | `xtls-rprx-vision` |
| 公钥/私钥 | 点击生成 |

3. 点击「添加」保存。

## 四、导入客户端

- 在入站列表找到刚创建的节点，点击左侧 `+` 展开
- 扫描二维码即可导入到小火箭、v2rayN、Shadowrocket 等客户端

## 五、开启 BBR（推荐）

安装完成后建议开启 BBR 以提升网络性能：

```bash
bash <(curl -Ls https://raw.githubusercontent.com/gitdajun/vless-reality-vision-setup/main/scripts/enable-bbr.sh)
```

或参考常见的 TCP 调优脚本。

## 六、注意事项

- SNI 是 Reality 的关键，如果节点不通，优先更换 SNI
- 请遵守当地法律法规，仅用于合法用途
- 本仓库仅整理公开教程步骤，不提供任何付费节点或服务

## 仓库结构

```
├── README.md
├── scripts/
│   ├── install-3xui-v2.6.0.sh   # 安装指定版本 3x-ui
│   └── enable-bbr.sh           # 开启 BBR 示例脚本
└── configs/                    # 可选配置示例（后续可扩展）
```

## License

本仓库内容仅供学习参考，使用风险自负。
