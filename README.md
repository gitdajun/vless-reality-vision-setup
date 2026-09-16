# VLESS + Reality + Vision 节点搭建指南

在 VPS 上使用 3x-ui 面板搭建 VLESS + Reality + Vision 节点，并提供安装与 BBR 脚本。

## 一、准备工作

1. 准备一台 VPS（建议优选线路）
2. 确保可以 SSH 登录（root 权限）

## 二、安装 3x-ui 面板

### 方式 1：指定稳定版本（推荐 v2.6.0）

```bash
bash <(curl -Ls https://raw.githubusercontent.com/gitdajun/vless-reality-vision-setup/main/scripts/install-3xui-v2.6.0.sh)
```

或：

```bash
VERSION=v2.6.0 && bash <(curl -Ls "https://raw.githubusercontent.com/mhsanaei/3x-ui/$VERSION/install.sh") $VERSION
```

### 方式 2：安装最新版

```bash
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
```

安装提示：
- 面板端口建议使用五位数（如 10096）
- 其他选项可保持默认

安装完成后记录终端输出的访问地址、用户名和密码，用浏览器登录。

## 三、创建 VLESS + Reality + Vision 入站

登录面板后：

1. 进入「入站列表」→「添加入站」
2. 按下列要点配置（其余保持默认）：

| 项目 | 设置 |
|------|------|
| 备注 | 自定义 |
| 协议 | `vless` |
| 安全 | `reality` |
| Dest (Target) | 默认或可用目标 |
| SNI | 关键项，可用常见网站域名，不通则更换 |
| Flow | `xtls-rprx-vision` |
| 公钥/私钥 | 点击生成 |

3. 保存。

## 四、导入客户端

在入站列表展开对应节点，扫描二维码即可导入小火箭、v2rayN、Shadowrocket 等客户端。

## 五、开启 BBR

```bash
bash <(curl -Ls https://raw.githubusercontent.com/gitdajun/vless-reality-vision-setup/main/scripts/enable-bbr.sh)
```

## 六、说明

- SNI 配置不当是节点不通的常见原因，优先排查
- 请遵守当地法律法规，仅用于合法用途
- 本仓库不提供付费节点或托管服务

## 仓库结构

```
├── README.md
├── scripts/
│   ├── install-3xui-v2.6.0.sh
│   └── enable-bbr.sh
└── LICENSE
```

## License

MIT License。使用风险自负。
