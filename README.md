[git pull over all branches](https://stackoverflow.com/a/12495234)
```
find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
```


This project is dedicated to daily tools that can make a difference in software engineer's life! Stuff like vim, tmux, eclipse mastering configs, and etc that come in handy when you are developing a top notch project but don't have much fancy tools at hand.

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
`tmux kill-server`

## bashrc
```
wget https://raw.githubusercontent.com/mshahriarinia/cheatsheet/master/shell/.bashrc_aliases
echo "source ~/.bashrc_aliases" >> ~/.bashrc
source .bashrc
```

## Jupyter notebook
Reserve static ip for machine (not ephemeral)
```
sudo apt update
sudo apt install python3-pip python3-dev
echo "alias python=python3" >> ~/.bashrc_aliases
source ~/.bashrc_aliases
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
virtualenv env
source env/bin/activate
sudo pip install jupyter
pip install tensorflow
jupyter notebook --no-browser --port=8889

```

To ssh tunnel to it to be able to access ti localhost
```
gcloud compute ssh --zone "us-central1-a" "mortezas-instance-1" -- -NL 8889:localhost:8889
```

scp from google

```
gcloud beta compute ssh "mortypltx@instance-1" --zone "us-east1-c"

gcloud compute scp "mortypltx@instance-1:/home/mortypltx/pltx-brands-mongodb-dump-08-18-2019.gz" .
mux start -p  zProject/pltx.sandbox/mshahriarinia/.tmuxinator/pltx-tmuxinator-servers.yml
```


To be able to access the notebook from any ip:
  - allow http https on GCP
  - Allow all ports
  - On jupyter allow any origin any ip and remote access


setup gsutil https://cloud.google.com/storage/docs/gsutil_install#linux

# IDE Formatting 
## Eclipse formatting
```
Eclipse>Window>Preferences>Java>Code Style>Formatter
```
## IntelliJ Java/Scala formatting


