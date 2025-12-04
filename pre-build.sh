# Настройка версии Zapret
sed -i 's/^SRC_VER.*/SRC_VER = 72.3/' padavan-ng/trunk/user/nfqws/Makefile
cd padavan-ng/trunk/user/nfqws
find . -maxdepth 1 -not -name Makefile -not -name patches -print0 | xargs -0 rm -rf --

# Настройка версии прошивки
sed -i 's/^FIRMWARE_ROOTFS_VER.*/FIRMWARE_ROOTFS_VER=3.9L/' padavan-ng/trunk/versions.inc
sed -i 's/^FIRMWARE_BUILDS_VER.*/FIRMWARE_BUILDS_VER=102-by-Save55/' padavan-ng/trunk/versions.inc
