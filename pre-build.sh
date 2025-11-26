sed -i 's/^SRC_VER.*/SRC_VER = 72.2/' padavan-ng/trunk/user/nfqws/Makefile
find padavan-ng/trunk/user/nfqws \( -not -name Makefile -or -not -name patches \) -print0 | xargs -0 rm -rf --
