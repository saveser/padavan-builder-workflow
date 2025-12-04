# Настройка версии прошивки
sed -i 's/^FIRMWARE_ROOTFS_VER.*/FIRMWARE_ROOTFS_VER=XXX/' padavan-ng/trunk/versions.inc
sed -i 's/^FIRMWARE_BUILDS_VER.*/FIRMWARE_BUILDS_VER=XXXXX/' padavan-ng/trunk/versions.inc

# Настройка версии Zapret
sed -i 's/^SRC_VER.*/SRC_VER = 72.3/' padavan-ng/trunk/user/nfqws/Makefile
cd padavan-ng/trunk/user/nfqws
find . -maxdepth 1 -not -name Makefile -not -name patches -print0 | xargs -0 rm -rf --

