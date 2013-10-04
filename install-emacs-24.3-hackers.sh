EMACS_VER=24.3
MACPORT_VER=4.1
#curl -O http://ftp.gnu.org/pub/gnu/emacs/emacs-${EMACS_VER}.tar.gz
#curl -O ftp://ftp.math.s.chiba-u.ac.jp/emacs/emacs-${EMACS_VER}-mac-${MACPORT_VER}.tar.gz
tar xvfz emacs-${EMACS_VER}.tar.gz
tar xvfz emacs-${EMACS_VER}-mac-${MACPORT_VER}.tar.gz
cd emacs-${EMACS_VER}
patch -p 0 < ../emacs-${EMACS_VER}-mac-${MACPORT_VER}/patch-mac
cp -r ../emacs-${EMACS_VER}-mac-${MACPORT_VER}/mac mac
cp ../emacs-${EMACS_VER}-mac-${MACPORT_VER}/src/* src
cp ../emacs-${EMACS_VER}-mac-${MACPORT_VER}/lisp/term/mac-win.el lisp/term
cp nextstep/Cocoa/Emacs.base/Contents/Resources/Emacs.icns mac/Emacs.app/Contents/Resources/Emacs.icns
./configure --with-mac --without-x
make
sudo make install
open mac/Emacs.app
