This project is dedicated to daily tools that can make a difference in software engineer's life!

Stuff like vim, tmux, eclipse mastering configs, and etc that come in handy when you are developing a top notch project but don't have much fancy tools at hand.

Eclipse formatting: 
```
Eclipse>Window>Preferences>Java>Code Style>Formatter
```

================

# Machine Setup
## SSH
```
ssh-keygen -t rsa -b 4096 -C "info@mshahriarinia.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
```

## Git
```
git config --global user.name "mshahriarinia" 
git config --global user.email "info@mshahriarinia.com" 
git config --global credential.helper cache 
git config --global credential.helper 'cache --timeout=3600'             # Set the cache to timeout after 1 hour (setting is in seconds)
git config --global color.ui true                                                          # for git diff to be colorfull
git config --global push.default simple  
git config --global core.editor /usr/bin/vim
```

## Vim
```
wget https://raw.githubusercontent.com/mshahriarinia/cheatsheet/master/shell/.vimrc
```

## tmux
```
wget https://raw.githubusercontent.com/mshahriarinia/cheatsheet/master/shell/.tmux.conf

sudo gem install tmuxinator
mkdir ~/.tmuxinator
wget https://raw.githubusercontent.com/mshahriarinia/cheatsheet/master/shell/.tmuxinator/server-editor-tmux-session.yml > ~/.tmuxinator/server-editor-tmux-session.yml
mux start -p ~/.tmuxinator/server-editor-tmux-session.yml

tmux attach -t server-editor-tmux-session
```

## bashrc
```
wget https://raw.githubusercontent.com/mshahriarinia/cheatsheet/master/shell/.bashrc_aliases
echo "source ~/.bashrc_aliases" >> ~/.bashrc
source .bashrc
```

setup gsutil https://cloud.google.com/storage/docs/gsutil_install#linux



