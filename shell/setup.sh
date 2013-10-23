#!/bin/bash


rm -rf  ~/cheatsheetBackup

mkdir ~/cheatsheetBackup

echo "Backing up current settings to directory ~/cheatsheetBackup.."


if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
    mv ~/.bashrc ~/cheatsheetBackup/.bashrc
    cp .bashrc ~/
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
fi

mv ~/.vimrc ~/cheatsheetBackup/.vimrc.bak
mv ~/.vim ~/cheatsheetBackup/.vim.bak
mv ~/.tmux ~/cheatsheetBackup/.tmux
mv ~/.tmux.conf ~/cheatsheetBackup/.tmux.conf

echo "Moving new settings in place.."
cp .vimrc ~/
cp -R .vim/ ~/



cp .tmux.conf ~/
cp -R .tmux/ ~/

echo "Downloading plugins..."

wget https://bitbucket.org/ns9tks/vim-autocomplpop/get/tip.zip
unzip tip.zip
rm tip.zip
cd n*
cp -R * ~/.vim
cd ..
rm -rf n*

wget   https://bitbucket.org/ns9tks/vim-l9/get/tip.zip 
unzip tip.zip
rm tip.zip
cd n*
cp -R * ~/.vim
cd ..
rm -rf n*





