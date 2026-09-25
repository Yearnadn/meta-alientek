# meta-alientek

## Introduction

meta-alientek is a BSP (Board Support Package) layer based on Yocto/OpenEmbedded, specifically providing software support for AlienTek development boards. This project primarily targets the i.MX6ULL processor architecture and is maintained by kunlun_lz.

## Project Structure

```
meta-alientek/
├── conf/
│   └── layer.conf          # Yocto layer configuration file
└── recipes-bsp/
    └── u-boot/
        ├── files/
        │   └── 0001-board-imx6ull_alientek-add-initial-board-support.patch
        └── u-boot-fslc_%.bbappend
```

## Main Components

### 1. conf/layer.conf
- Defines Yocto layer metadata
- Configures layer dependencies and priority
- Specifies supported machine types

### 2. recipes-bsp/u-boot/
- Contains customized configurations for the U-Boot bootloader
- The `u-boot-fslc_%.bbappend` file is used to extend the U-Boot recipe
- `0001-board-imx6ull_alientek-add-initial-board-support.patch` provides initial support for the i.MX6ULL AlienTek development board

## Supported Hardware

- **Processor**: NXP i.MX6ULL
- **Development Board**: AlienTek i.MX6ULL Development Board

## Dependencies

This layer depends on the following base layers:
- meta-fslc (provides Freescale/Community U-Boot and Linux kernel support)
- meta-oe (OpenEmbedded meta layer)
- Other standard Yocto layers

## Usage Instructions

### 1. Get the Code
```bash
git clone https://gitee.com/kunlun_lz/meta-alientek.git
```

### 2. Configure Yocto Build Environment
```bash
source poky/oe-init-build-env build
```

### 3. Add Layer to Build System
```bash
bitbake-layers add-layer /path/to/meta-alientek
```

### 4. Configure Machine
Set the following in `local.conf`:
```
MACHINE = "imx6ull_alientek"
```

### 5. Build
```bash
bitbake core-image-minimal
```

## Key Features

- **U-Boot Customization**: U-Boot configuration and optimization tailored for AlienTek development boards
- **Board Support**: Complete initialization code for i.MX6ULL development boards
- **System Integration**: Seamless integration with Freescale Community BSP

## Maintainers

- **Primary Maintainer**: kunlun_lz
- **Project Address**: https://gitee.com/kunlun_lz/meta-alientek

## License

This project follows the Yocto Project license agreement. For specific license information, please refer to the LICENSE file of each component.

## Contributing

Bug reports, code patches, and feature requests are welcome. Please contribute via Gitee's Issue and Pull Request features.

## Contact Information

- **Project Homepage**: https://gitee.com/kunlun_lz/meta-alientek
- **Feedback**: https://gitee.com/kunlun_lz/meta-alientek/issues

## Notes

1. Ensure your build environment has the Yocto/OpenEmbedded toolchain correctly set up.
2. This layer needs to be used in conjunction with other base layers.
3. It is recommended to use the Freescale Community BSP version that matches your hardware.