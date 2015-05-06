#!/bin/bash


rm -rf  ~/cheatsheetBackup

mkdir ~/cheatsheetBackup

echo "Backing up current settings to directory ~/cheatsheetBackup.."

mv ~/.bashrc ~/cheatsheetBackup/.bashrc ;
mv ~/.vimrc ~/cheatsheetBackup/.vimrc.bak
mv ~/.vim ~/cheatsheetBackup/.vim.bak
mv ~/.tmux ~/cheatsheetBackup/.tmux
mv ~/.tmux.conf ~/cheatsheetBackup/.tmux.conf

cp .bashrc ~/ ;
cp .bashrc_custom ~/
source ~/.bashrc ;


echo "Moving new settings in place.."
cp .vimrc ~/
#cp -R .vim/ ~/
 cp -R .vim ~/


cp .tmux.conf ~/
cp -R .tmux ~

echo "Downloading plugins for vim..."

    # autocomplpop
    # will keep on creating autocomplete boxes for you based on other words in the file (or dictionary of keywords 
    # this I haven't tried yet])
    curl https://bitbucket.org/ns9tks/vim-autocomplpop/get/tip.zip -o tip.zip
    unzip tip.zip
    rm tip.zip
    cd n*
    cp -R * ~/.vim/
    cd ..
    rm -rf n*

        # A helper for autocomplete
        curl   https://bitbucket.org/ns9tks/vim-l9/get/tip.zip -o tip.zip
        unzip tip.zip
        rm tip.zip
        cd n*
        cp -R * ~/.vim/
        cd ..
        rm -rf n*

    # easymotion: 
    # Say you are working on a code or text but you have to go to the end of the screen in the middle of a 
    # line to change something. press \\w and the initials of the word representing there, and there you go! no more 
    # arrow keys or searches, etc! Sweet!
    git clone https://github.com/Lokaltog/vim-easymotion.git
    cd vim-easymotion
    cp -R * ~/.vim/
    cd ..
    rm -rf vim-easymotion
    
    # NERDTree
    # press :NERDTree and browse files. Then press ? to view short-cut keys, I for showing hidden files and s to open 
    # a file in a vertical split of the pane. To create a bookmark :Bookmark myBookmark. then anywhere you press B will
    # show you bookmarks. CD and also C limit directories. q will quit. press T to open a file in tab. Ctrl ww will
    # toggle between. They're called windows in vim parlance: Ctrl wh or Ctrl wl also switch to left and right
    git clone https://github.com/scrooloose/nerdtree.git
    cd nerdtree 
    cp -R * ~/.vim/
    cd ..
    rm -rf nerdtree
   
    # SnipMate
    # Just type in the first few words of a common term in any language that it suports and it is going to create 
    # the rest of the content for you! Like in a java file you type in for and press tab, it's gonna print out 
    # for(int i =0; i &lt; ; i++) {}  What else would you want for a text editor?
    git clone https://github.com/msanders/snipmate.vim.git
    cd snipmate.vim
    cp -R * ~/.vim/
    cd ..
    rm -rf snipmate.vim    # later on look into getting more efficient code snippets for different languages
   
    # tcomment
    # press Ctrl_ _ to toggle comment. to block comment: Ctrl_b the text you have selected in visual mode
    git clone https://github.com/tomtom/tcomment_vim.git 
    cd tcomment_vim
    cp -R * ~/.vim/
    cd ..
    rm -rf tcomment_vim    # later on look into getting more efficient code snippets for different languages

    # MRU: SWITCHED TO CTRLP.VIM FOR MRU SEARCH
    # press :MRU Most Recently Opened files in vim: to close it q 
    # curl http://www.vim.org/scripts/download_script.php?src_id=20075 -o ~/.vim/plugin/mru.vim

    # git clone https://github.com/scrooloose/syntastic.git 
    # cd syntastic
    # cp -R * ~/.vim/
    # cd ..
    # rm -rf syntastic    # later on look into getting more efficient code snippets for different languages

    # pathogen 
    # is a vim plugin instuller to avoid dealing with copying latest stuff. It will take care of it.
    mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    curl -so ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

    # syntastic
    # syntax error alerts right in vim! 
    cd ~/.vim/bundle
    git clone https://github.com/scrooloose/syntastic.git
    cd -
  
    # CtrlP 
    # Fuzzy search for a file.       :CtrlPMixed searche_term 
    # It will go up on the directory to find a .git or the parent and searches down there
    git clone git://github.com/kien/ctrlp.vim.git 
    cd ctrlp.vim
    cp -R * ~/.vim/
    cd ..
    rm -rf ctrlp.vim    

    # ack.vim
    # grepping within vim and navigating back and forth         :Ack [options] {pattern} [{directory}] 
    #mkdir ~/bin 
    #curl http://beyondgrep.com/ack-2.10-single-file > ~/bin/ack && chmod 0755 !#:3 
    #PATH=$PATH:~/bin; export $PATH
    #git clone https://github.com/mileszs/ack.vim.git
    #cd ack.vim
    #cp -R * ~/.vim/
    #cd ..
    #rm -rf ack.vim    

    # lusty for highlighted ack.vim  
    #  :LustyFilesystemExplorer
    #  :LustyFilesystemExplorerFromHere
    #  :LustyBufferExplorer
    #  :LustyBufferGrep (for searching through all open buffers)

    #  <Leader>lf  - Opens filesystem explorer.
    #  <Leader>lr  - Opens filesystem explorer at the directory of the current file.
    #  <Leader>lb  - Opens buffer explorer.
    #  <Leader>lg  - Opens buffer grep.   <--- use this 
    # curl https://raw.github.com/sjbach/lusty/master/plugin/lusty-explorer.vim -o ~/.vim/plugin/lusty-explorer.vim 


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





