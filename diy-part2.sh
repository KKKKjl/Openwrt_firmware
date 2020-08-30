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
# 更改默认主题为Argon
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> .config
sed -i '/^CONFIG_PACKAGE_luci-theme-bootstrap=y$/d' .config

# openclash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash package/lean/OpenClash
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
