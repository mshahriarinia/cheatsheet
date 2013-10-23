#!/bin/bash


rm -rf  ~/cheatsheetBackup

mkdir ~/cheatsheetBackup

echo "Backing up current settings to directory ~/cheatsheetBackup.."
mv ~/.vimrc ~/cheatsheetBackup/.vimrc.bak
mv ~/.vim ~/cheatsheetBackup/.vim.bak
mv ~/.bashrc ~/cheatsheetBackup/.bashrc
mv ~/.tmux ~/cheatsheetBackup/.tmux
mv ~/.tmux.conf ~/cheatsheetBackup/.tmux.conf

echo "Moving new settings in place.."
cp .vimrc ~/
cp -R .vim/ ~/
cp .bashrc ~/
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





