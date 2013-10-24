#!/bin/bash


rm -rf  ~/cheatsheetBackup

mkdir ~/cheatsheetBackup

echo "Backing up current settings to directory ~/cheatsheetBackup.."


if [ "$(uname)" == "Darwin" ]  
    then
   echo ""    ;    # Do something under Mac OS X platform        
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]  
then
    # Do something under Linux platform
    mv ~/.bashrc ~/cheatsheetBackup/.bashrc ;
    cp .bashrc ~/ ;
    source ~/.bashrc ;
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ] 
then
    echo "" # Do something under Windows NT platform
fi

mv ~/.vimrc ~/cheatsheetBackup/.vimrc.bak
mv ~/.vim ~/cheatsheetBackup/.vim.bak
mv ~/.tmux ~/cheatsheetBackup/.tmux
mv ~/.tmux.conf ~/cheatsheetBackup/.tmux.conf

echo "Moving new settings in place.."
cp .vimrc ~/
#cp -R .vim/ ~/
 cp -R .vim ~/


cp .tmux.conf ~/
cp -R .tmux/ ~/

echo "Downloading plugins for vim..."

    # autocomplpop
    curl https://bitbucket.org/ns9tks/vim-autocomplpop/get/tip.zip -o tip.zip
    unzip tip.zip
    rm tip.zip
    cd n*
    cp -R * ~/.vim/
    cd ..
    rm -rf n*

    curl   https://bitbucket.org/ns9tks/vim-l9/get/tip.zip -o tip.zip
    unzip tip.zip
    rm tip.zip
    cd n*
    cp -R * ~/.vim/
    cd ..
    rm -rf n*

    # easymotion
    git clone https://github.com/Lokaltog/vim-easymotion.git
    cd vim-easymotion
    cp -R * ~/.vim/
    cd ..
    rm -rf vim-easymotion
    
    # NERDTree
    git clone https://github.com/scrooloose/nerdtree.git
    cd nerdtree 
    cp -R * ~/.vim/
    cd ..
    rm -rf nerdtree
   
    # SnipMate
    git clone https://github.com/msanders/snipmate.vim.git
    cd snipmate.vim
    cp -R * ~/.vim/
    cd ..
    rm -rf snipmate.vim    # later on look into getting more efficient code snippets for different languages
   
    # tcomment
    git clone https://github.com/tomtom/tcomment_vim.git 
    cd tcomment_vim
    cp -R * ~/.vim/
    cd ..
    rm -rf tcomment_vim    # later on look into getting more efficient code snippets for different languages

    # taglist
    #curl http://hivelocity.dl.sourceforge.net/project/vim-taglist/vim-taglist/4.6/taglist_46.zip -o taglist_46.zip
    #unzip taglist_46.zip -d taglist_46
    #cd taglist_46
    #cp -R * ~/.vim/
    #cd ..
    #rm -rf taglist_46 
 
    # For HTML Also check out 
    # http://net.tutsplus.com/tutorials/other/vim-essential-plugin-surround/
    # http://net.tutsplus.com/tutorials/other/vim-essential-plugin-sparkup/
    # http://net.tutsplus.com/tutorials/other/vim-essential-plugin-markdown-to-html/





