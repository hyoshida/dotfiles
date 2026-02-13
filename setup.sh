#!/bin/sh

cd `dirname $0`
CURRENT_DIR=$PWD
WORKING_DIR=$CURRENT_DIR/tmp

mkdir -p $WORKING_DIR

print() {
    printf "\033[1;32m$*\033[0;39m\n"
}

now=`date '+%Y%m%d%H%M%S'`
mkdir $CURRENT_DIR/backups/$now
for dotfile in .?*; do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]; then
        if [ -e $HOME/$dotfile ]; then
            mv $HOME/$dotfile $CURRENT_DIR/backups/$now
        fi
        ln -s $CURRENT_DIR/$dotfile $HOME
    fi
done

# lessの設定ファイルを作成
print 'Setting for less...'
lesskey

# サブモジュールをインストール
print 'Install git submodules...'
git submodule update --init

# rbenvでruby-buildが動作するよう細工
print 'Setting for rbenv...'
if [ -e $CURRENT_DIR/.rbenv/plugins ]; then
    rm $CURRENT_DIR/.rbenv/plugins
fi
ln -s $CURRENT_DIR/.rbenv_plugins $CURRENT_DIR/.rbenv/plugins

# vimプラグインをインストール
print 'Install NeoBundle for vim...'
vim :NeoBundleInstall +q

# diff-highlightをインストール
print 'Install diff-highlight...'
cd $CURRENT_DIR/.bin > /dev/null
rm -f diff-highlight
curl -s -O https://gist.githubusercontent.com/hyoshida/d79849b0316f1ea1540083b0d89c6a45/raw/9a5315bdc5af90daee4ee07d629e848e7f5efc57/diff-highlight
chmod +x diff-highlight
cd - > /dev/null

# powerline用のフォントをインストール
sh $CURRENT_DIR/setup_fonts.sh

# 設定ファイルを.configディレクトリにリンク
print 'Install configs for XDG...'
mkdir $CURRENT_DIR/backups/$now/xdg_config
cd $CURRENT_DIR/xdg_config > /dev/null
for config_file in *; do
    if [ -e $HOME/.config/$config_file ]; then
        mv $HOME/.config/$config_file $CURRENT_DIR/backups/$now/xdg_config
    fi
    ln -s $CURRENT_DIR/xdg_config/$config_file $HOME/.config
done
cd - > /dev/null

# Install fzf
print 'Install fzf...'
$CURRENT_DIR/.fzf/install --all

print 'Successed!'
