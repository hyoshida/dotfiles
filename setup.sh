#!/bin/sh
cd `dirname $0`
now=`date '+%Y%m%d%H%M%S'`
mkdir "$PWD/backups/$now"
for dotfile in .?*; do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ] ; then
        if [ -e "$HOME/$dotfile" ]; then
            mv "$HOME/$dotfile" "$PWD/backups/$now"
        fi
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
git submodule update --init
if [ -e .rbenv/plugins ]; then
    rm .rbenv/plugins
fi
ln -s "$PWD/.rbenv_plugins" .rbenv/plugins
