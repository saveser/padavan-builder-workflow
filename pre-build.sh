# Настройка версии прошивки
sed -i 's/^FIRMWARE_ROOTFS_VER.*/FIRMWARE_ROOTFS_VER=3.9L/' padavan-ng/trunk/versions.inc
sed -i 's/^FIRMWARE_BUILDS_VER.*/FIRMWARE_BUILDS_VER=102/' padavan-ng/trunk/versions.inc

# Настройка версии Zapret
ZAPRET_REPO="https://github.com/bol-van/zapret.git"
ZAPRET_TAGS=$(git ls-remote --tags "$ZAPRET_REPO" | awk '{print $2}' | sed 's/refs\/tags\///g')
ZAPRET_LATEST_TAG=$(echo "$ZAPRET_TAGS" | sort -V | tail -n 1)
if [ -z "$ZAPRET_LATEST_TAG" ]; then
  echo "Ошибка: Не удалось определить последний тег."
  exit 1
fi
ZAPRET_VER=$(git ls-remote --tags "$ZAPRET_REPO" "refs/tags/$ZAPRET_LATEST_TAG^{}" | awk '{print $1}')
sed -i "s/^SRC_VER.*/SRC_VER = $ZAPRET_VER/g/" padavan-ng/trunk/user/nfqws/Makefile
cd padavan-ng/trunk/user/nfqws
find . -maxdepth 1 -not -name Makefile -not -name patches -print0 | xargs -0 rm -rf --
