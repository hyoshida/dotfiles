#!/bin/sh

cd `dirname $0`
CURRENT_DIR=$PWD

print() {
    printf "\033[1;32m$*\033[0;39m\n"
}

print 'Install a font for powerline...'
mkdir -p $CURRENT_DIR/.fonts
cp $CURRENT_DIR/powerline/font/PowerlineSymbols.otf $CURRENT_DIR/.fonts

print 'Install a font config for powerline...'
mkdir -p $CURRENT_DIR/.fonts.conf.d
cp $CURRENT_DIR/powerline/font/10-powerline-symbols.conf $CURRENT_DIR/.fonts.conf.d

print 'Install patched fonts...'
find $CURRENT_DIR/powerline-fonts -regex '.*\.[to]tf$' -exec cp {} $CURRENT_DIR/.fonts \;

print 'Cleaning font caches...'
fc-cache -vf $CURRENT_DIR/.fonts
