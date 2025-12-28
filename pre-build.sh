# Настройка версии прошивки
sed -i 's/^FIRMWARE_ROOTFS_VER.*/FIRMWARE_ROOTFS_VER=3.9L/' padavan-ng/trunk/versions.inc
sed -i 's/^FIRMWARE_BUILDS_VER.*/FIRMWARE_BUILDS_VER=102/' padavan-ng/trunk/versions.inc

# Настройка версии Zapret
COMMIT_HASH=$(git ls-remote https://github.com/bol-van/zapret> HEAD | awk '{print $1}')
ZAPRET_VER=$(git ls-remote --refs --tags https://github.com/bol-van/zapret | grep "$COMMIT_HASH" | awk '{print $2}' | sed 's/refs\/tags\///')
sed -i 's/^SRC_VER.*/SRC_VER = '$ZAPRET_VER'/' padavan-ng/trunk/user/nfqws/Makefile
cd padavan-ng/trunk/user/nfqws
find . -maxdepth 1 -not -name Makefile -not -name patches -print0 | xargs -0 rm -rf --
