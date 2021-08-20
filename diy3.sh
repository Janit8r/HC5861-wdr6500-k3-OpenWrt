#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/KERNEL_PATCHVER=5.4/KERNEL_PATCHVER=5.10/g' target/linux/ath79/Makefile #修改内核版本
#固件架构
cat >> .config <<EOF
CONFIG_TARGET_ath79=y
CONFIG_TARGET_ath79_generic=y
CONFIG_TARGET_BOARD="ath79"
CONFIG_TARGET_SUBTARGET="generic"
CONFIG_TARGET_PROFILE="DEVICE_tplink_tl-wdr6500-v2"
CONFIG_DEFAULT_luci-app-ssr-plus=y
CONFIG_LUCI_LANG_zh-cn=y
CONFIG_PACKAGE_luci-app-easymesh=y

EOF

#取消默认启用的软件
cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
# CONFIG_PACKAGE_luci-app-argon-config is not set
# CONFIG_PACKAGE_luci-app-jd-dailybonus is not set

EOF
