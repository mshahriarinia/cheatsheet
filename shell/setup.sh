#!/bin/bash


mkdir ~/cheatsheetBackup

echo "Backing up current settings to directory ~/cheatsheetBackup.."
mv ~/.vimrc ~/cheatsheetBackup/.vimrc.bak
mv ~/.vim ~/cheatsheetBackup/.vim.bak
mv ~/.bashrc ~/cheatsheetBackup/.bashrc
mv ~/.tmux ~/cheatsheetBackup/.tmux
mv ~/.tmux.conf ~/cheatsheetBackup/.tmux.conf

mv * ~/
