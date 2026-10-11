# meta-alientek

## 简介

meta-alientek 是一个基于 Yocto/OpenEmbedded 的 BSP（Board Support Package）层，专门为 AlienTek 开发板提供软件支持。该项目主要针对 i.MX6ULL 处理器架构，由 kunlun_lz 维护。

## 项目结构

```
meta-alientek/
├── conf/
│   └── layer.conf                    # Yocto 层配置文件
├── recipes-bsp/
│   └── u-boot/
│       ├── files/
│       │   ├── 0001-board-imx6ull_alientek-add-initial-board-support.patch
│       │   ├── 0001-board-imx6ull_alientek-add-ATK7016-LCD-support.patch
│       │   ├── 0001-Modify-the-default-startup-address-and-board-name-at.patch
│       │   ├── 0001-mx6ull_atom-Disable-network-support-to-reduce-U-Boot.patch
│       │   ├── 0001-imx6ull-alientek-add-A-B-slot-update-support.patch
│       │   └── fw_env.config
│       ├── u-boot-fslc_%.bbappend
│       └── libubootenv_%.bbappend
├── recipes-core/
│   └── images/
│       └── alientek-image.bb
├── recipes-kernel/
│   └── linux/
│       ├── files/
│       │   ├── imx6ull-alientek.dtsi
│       │   ├── imx6ull-alientek.dts
│       │   └── defconfig
│       └── linux-fslc_%.bbappend
└── recipes-support/
    └── flash/
        ├── atk-flash.bb
        └── files/
            └── atk-flash-update
```

## 主要组件

### 1. conf/layer.conf

定义 Yocto 层的元数据，配置层的依赖关系和优先级，指定支持的机器类型。

### 2. recipes-bsp/u-boot/

包含 U-Boot 引导程序的定制配置：
- `u-boot-fslc_%.bbappend` - 扩展 U-Boot 配方的配置文件
- `libubootenv_%.bbappend` - U-Boot 环境变量库配置
- 补丁文件实现以下功能：
  - i.MX6ULL AlienTek 开发板的初始支持
  - ATK7016 LCD 屏幕支持
  - 默认启动地址和开发板名称修改
  - 禁用网络支持以减小 U-Boot 体积
  - A/B 槽更新支持

### 3. recipes-core/images/alientek-image.bb

定义 AlienTek 开发板的根文件系统镜像配方。

### 4. recipes-kernel/linux/

包含 Linux 内核相关配置：
- `imx6ull-alientek.dtsi` - AlienTek 开发板设备树头文件
- `imx6ull-alientek.dts` - AlienTek 开发板设备树配置
- `defconfig` - Linux 内核默认配置
- `linux-fslc_%.bbappend` - Linux 内核配方扩展文件

### 5. recipes-support/flash/

包含 flash 烧写工具：
- `atk-flash.bb` - 烧写工具配方
- `atk-flash-update` - 烧写更新脚本

## 支持的硬件

- **处理器**: NXP i.MX6ULL
- **开发板**: AlienTek i.MX6ULL 开发板
- **显示屏**: ATK7016 LCD 屏幕

## 依赖关系

本层依赖以下基础层：
- `meta-fslc` - 提供 Freescale/Community U-Boot 和 Linux 内核支持
- `meta-oe` - OpenEmbedded 基元层
- 其他标准的 Yocto 层

## 使用方法

### 1. 获取代码

```bash
git clone https://gitee.com/kunlun_lz/meta-alientek.git
```

### 2. 配置 Yocto 构建环境

```bash
source poky/oe-init-build-env build
```

### 3. 添加层到构建系统

```bash
bitbake-layers add-layer /path/to/meta-alientek
```

### 4. 配置机器

在 `local.conf` 中设置：

```
MACHINE = "imx6ull_alientek"
```

### 5. 构建

```bash
bitbake core-image-minimal
```

或者构建 AlienTek 定制镜像：

```bash
bitbake alientek-image
```

## 主要功能

- **U-Boot 定制**: 针对 AlienTek 开发板的 U-Boot 配置和优化
- **LCD 支持**: 提供 ATK7016 LCD 屏幕驱动支持
- **设备树支持**: 完整的 i.MX6ULL AlienTek 设备树配置
- **A/B 槽更新**: 支持 A/B 分区更新机制
- **板级支持**: 完整的 i.MX6ULL 开发板初始化代码
- **系统集成**: 与 Freescale Community BSP 的无缝集成
- **定制镜像**: 提供开箱即用的 AlienTek 根文件系统镜像
- **烧写工具**: 提供便捷的 flash 烧写工具

## 维护者

- **主要维护者**: kunlun_lz
- **项目地址**: https://gitee.com/kunlun_lz/meta-alientek

## 许可证

本项目遵循 Yocto 项目许可协议，具体许可证信息请参考各组件的 LICENSE 文件。

## 贡献

欢迎提交问题报告、代码补丁和功能请求。请通过 Gitee 的 Issue 和 Pull Request 功能进行贡献。

## 联系方式

- **项目主页**: https://gitee.com/kunlun_lz/meta-alientek
- **问题反馈**: https://gitee.com/kunlun_lz/meta-alientek/issues

## 注意事项

1. 确保您的构建环境已正确设置 Yocto/OpenEmbedded 工具链
2. 本层需要与其他基础层配合使用
3. 建议使用与您的硬件匹配的 Freescale Community BSP 版本