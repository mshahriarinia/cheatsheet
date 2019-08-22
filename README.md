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
```

## bashrc
```
wget https://raw.githubusercontent.com/mshahriarinia/cheatsheet/master/shell/.bashrc_aliases
echo "source ~/.bashrc_aliases" >> ~/.bashrc
source .bashrc
```


```
   55  pip install tensorflow-gpu
   56  nvidia-smi
   57  tmux
   58  history
   $ python
   from tensorflow.python.client import device_lib
   print(device_lib.list_local_devices())  # shows gpu devices
```   

setup git params and id_rsa on machine

git clone cheetsheet 

copy .tmux.conf and .vimrc to ~/

setup gsutil https://cloud.google.com/storage/docs/gsutil_install#linux



