sed -i 's/^SRC_VER.*/SRC_VER = 72.2/' trunk/user/nfqws/Makefile
find . -maxdepth 1 -not -name Makefile -name patches -print0 | xargs -0 rm -rf --
