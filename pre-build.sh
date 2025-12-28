# Настройка версии прошивки
sed -i 's/^FIRMWARE_ROOTFS_VER.*/FIRMWARE_ROOTFS_VER=3.9L/' padavan-ng/trunk/versions.inc
sed -i 's/^FIRMWARE_BUILDS_VER.*/FIRMWARE_BUILDS_VER=102/' padavan-ng/trunk/versions.inc

# Настройка версии Zapret
ZAPRET_VER=$(curl -s "https://api.github.com/repos/bol-van/zapret/tags" | jq -r '.[0].name')
sed -i "s/^SRC_VER.*/SRC_VER = $ZAPRET_VER/g" padavan-ng/trunk/user/nfqws/Makefile
cd padavan-ng/trunk/user/nfqws
find . -maxdepth 1 -not -name Makefile -not -name patches -print0 | xargs -0 rm -rf --
