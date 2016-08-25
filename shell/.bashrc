

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
    alias docs='cd ~/Documents'

    alias dw='cd ~/Downloads/'
    #export CLICOLOR=1
    #export LSCOLORS=ExFxCxDxBxegedabagacad
    #alias ls='ls -GpF' # -p adds a slash after each directory. -F which in addition puts an * after executables, | after pipes, @ after symlinks, et cetera.
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
  then
    # Do something under Linux platform
    #echo "Welcome `whoami` to `hostname`.             `date +"%a, %d %b %Y - %H:%M %p %Z"`"
    #echo
    #echo -e "\e[00;31mOperating system:\e[00m `find /etc/ -type f -maxdepth 1  -name '*release*' 2> /dev/null | xargs cat | grep --color=never 'CentOS\|Ubuntu\|Red Hat'`"
    #echo 
    #echo -e "\e[00;31meth0 IP address\e[00m: ` /sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`         \e[00;31mFree memory:\e[00m   `free | grep Mem | awk '{ printf("%.4f%\n", $4/$2 * 100.0) }'`"
    #echo
    #echo -e "\e[00;31mDisk usage:\e[00m"
    # df -khP | grep "^/dev/" | tr -s ' ' | cut -d" " -f1,5

# Non-Mac aliases: Listing, directories, and motion
    alias ls='ls --color=auto -GpF'
    alias ll="ls -alrtFSh"
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
    alias du='du -ch --max-depth=1'
    alias treeacl='tree -A -C -L 2'
# elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
#    echo ""
fi
alias tmux="TERM=screen-256color-bce tmux"    # http://stackoverflow.com/questions/10158508/lose-vim-colorscheme-in-tmux-mode

#
# https://raw.github.com/startup-class/dotfiles/master/.bashrc
#
# Concepts:
#
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#        .bashrc imports .bashrc_custom, which can be used to override variables specified here.
#
#    2) .bash_profile is the *login* config for bash, launched upon first connection.
#       .bash_profile imports .bashrc, but not vice versa.
#       
#           
# When using GNU screen:
#
#    1) .bash_profile is loaded the first time you login, and should be used
#       only for paths and environmental settings
#
#    2) .bashrc is loaded in each subsequent screen, and should be used for
#       aliases and things like writing to .bash_eternal_history (see below)
#
#
# Note:
# When Bash starts, it executes the commands in a variety of different scripts.
#
#   1) When Bash is invoked as an interactive login shell, it first reads
#      and executes commands from the file /etc/profile, if that file
#      exists. After reading that file, it looks for ~/.bash_profile,
#      ~/.bash_login, and ~/.profile, in that order, and reads and executes
#      commands from the first one that exists and is readable.
#
#   2) When a login shell exits, Bash reads and executes commands from the
#      file ~/.bash_logout, if it exists.
#
#   3) When an interactive shell that is not a login shell is started
#      (e.g. a GNU screen session), Bash reads and executes commands from
#      ~/.bashrc, if that file exists. This may be inhibited by using the
#      --norc option. The --rcfile file option will force Bash to read and
#      execute commands from file instead of ~/.bashrc.


# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi



# -----------------------------------
# -- Set up umask permissions for easy collaborative file editing--
# -----------------------------------
#  The following incantation allows easy group modification of files.
#  See here: http://en.wikipedia.org/wiki/Umask
#
#     umask 002 allows only you to write (but the group to read) any new
#     files that you create.
#
#     umask 022 allows both you and the group to write to any new files
#     which you make.
#
#  In general we want umask 022 on the server and umask 002 on local
#  machines.
#
#  The command 'id' gives the info we need to distinguish these cases.
#
#     $ id -gn  #gives group name
#     $ id -un  #gives user name
#     $ id -u   #gives user ID
#
#  So: if the group name is the same as the username OR the user id is not
#  greater than 99 (i.e. not root or a privileged user), then we are on a
#  local machine (check for yourself), so we set umask 002.
#
#  Conversely, if the default group name is *different* from the username
#  AND the user id is greater than 99, we're on the server, and set umask
#  022 for easy collaborative editing.
    if [ "`id -gn`" == "`id -un`" -a `id -u` -gt 99 ]; then
        umask 002
    else
        umask 022
    fi




# ---------------------------------------------------------
# -- 1.2) Set up bash prompt and ~/.bash_eternal_history --
# ---------------------------------------------------------
# Set various bash parameters based on whether the shell is 'interactive'
# or not. An interactive shell is one you type commands into, a
# non-interactive one is the bash environment used in scripts.
#if [ "$PS1" ]; then

#    if [ -x /usr/bin/tput ]; then 
#        if [ "x`tput kbs`" != "x" ]; then # We can't do this with "dumb" terminal
#            stty erase `tput kbs`
#        elif [ -x /usr/bin/wc ]; then
#            if [ "`tput kbs|wc -c `" -gt 0 ]; then # We can't do this with "dumb" terminal
#                stty erase `tput kbs`
#            fi
#        fi
#     fi

    case $TERM in
        xterm*)
            if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
               PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
            else
               PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
            fi
        ;; # end of case condition
        screen)

            if [ -e /etc/sysconfig/bash-prompt-screen ]; then
                PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
            else
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
            fi
         ;; # end of case condition
         *)
            [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
         ;; # end of case condition
    esac

    # Bash eternal history
    # --------------------
    # This snippet allows infinite recording of every command you've ever
    # entered on the machine, without using a large HISTFILESIZE variable,
    # and keeps track if you have multiple screens and ssh sessions into the
    # same machine. It is adapted from:
    # http://www.debian-administration.org/articles/543.
    #
    # The way it works is that after each command is executed and
    # before a prompt is displayed, a line with the last command (and
    # some metadata) is appended to ~/.bash_eternal_history.
    #
    # This file is a tab-delimited, timestamped file, with the following
    # columns:
    #
    # 1) user
    # 2) hostname
    # 3) screen window (in case you are using GNU screen)
    # 4) date/time
    # 5) current working directory (to see where a command was executed)
    # 6) the last command you executed
    #
    # The only minor bug: if you include a literal newline or tab (e.g. with
    # awk -F"\t"), then that will be included verbatime. It is possible to
    # define a bash function which escapes the string before writing it; if you
    # have a fix for that which doesn't slow the command down, please submit
    # a patch or pull request.
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo -e $$\\t$USER\\t$HOSTNAME\\tscreen $WINDOW\\t`date +%D%t%T%t%Y%t%s`\\t$PWD"$(history 1)" >> ~/.bash_eternal_history'

    # Turn on checkwinsize
    shopt -s checkwinsize

    #Prompt edited from default
  #  [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u \w]\\$ "

    # Load other shell settings specific to different aplications
    if [ "x$SHLVL" != "x1" ]; then # We're not a login shell
        for i in /etc/profile.d/*.sh; do
            if [ -r "$i" ]; then
                . $i
            fi
        done
    fi
#fi



# Append to history
# See: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
    shopt -s histappend

## ---------------------
## -- Make prompt informative, taken from Amazon EC2 ubuntu instance
## ---------------------
# See: http://www.ukuug.org/events/linux2003/papers/bash_tips/
    # PS1="\[\033[0;34m\][\u@\h:\w]$\[\033[0m\] "

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color) color_prompt=yes;;
    esac

    # uncomment for a colored prompt, if the terminal has the capability; turned
    # off by default to not distract the user: the focus in a terminal window
    # should be on the output of commands, not on the prompt
    force_color_prompt=yes

    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
        else
        color_prompt=
        fi
    fi

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt









## -- Set up aliases --
## -----------------------

    # Safety
    alias rm="rm -i"
    alias mv="mv -i"
    alias cp="cp -i"
 
    alias ..='cd ..'
    alias cd.='cd ..'   
    alias cd..='cd ..'
    
    alias v='vim'
    alias vi='vim'
    alias vcat='~/cheatsheet/shell/bin/vcat'
    alias vimcat='~/cheatsheet/shell/bin/vcat'
    
    alias gt='git'
    alias gaa='git add -A :/' 
    alias ga='git add'
    alias gs='git status'
    alias gd='git diff'
    alias gm='git merge'
    alias gc='git commit -m'
    alias gp='git push'
    alias gr0='git push -f origin master ' 
    alias gr1='git fetch upstream; git checkout master; git rebase upstream/master'
    alias gr2='git rebase --continue; git rebase --skip; git mergetool'
    alias gco='git checkout'
   
    alias get='sudo apt-get install'
    alias cl='clear'

    set -o noclobber

## -----------------------------
      # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


    # grep options
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;31' # green for matches

    # sort options
    # Ensures cross-platform sorting behavior of GNU sort.
    # http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
    unset LANG
    export LC_ALL=POSIX



# Enable programmable completion features (you don't need to enable                                                                                                                                                                      
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

# Set the title to user@host:dir if this is an xterm
    case "$TERM" in
        xterm*|rxvt*)
            PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
        *)
        ;;
    esac



## ------------------------------
## -- User-customized bash --
## ------------------------------

    # Load other shell settings specific to different aplications
    if [ "x$SHLVL" != "x1" ]; then # We're not a login shell                                                               
        for i in /etc/profile.d/*.sh; do
            if [ -r "$i" ]; then
                . $i
            fi
        done
    fi


    complete -d cd pushd rmdir  #  [ is there any way to configure it to complete ] only directories for the command cd using tab?    http://superuser.com/questions/171999/smart-tab-completion-for-directories/267627#267627
    # complete -f vim # only tab files for vim, but you might sometimes want to open files inside directories for vim, so this is commented for now
    
    # make man pages colorful for easy readbility
    export LESS_TERMCAP_mb=$'\E[01;31m'
    export LESS_TERMCAP_md=$'\E[01;31m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[01;44;33m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[01;32m'
    
    
#  No more cd ../../../.. but up 4    
# Goes up many dirs as the number passed as argument, 
# if none goes up by 1 by default (found in a link in a comment in stackoverflow.com and modified a bit)
# http://serverfault.com/questions/3743/what-useful-things-can-one-add-to-ones-bashrc
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# a little script that extracts archives
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# directory and file sizes of current location
alias du="du -scHhr * | sort -n"

# # ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
export LESS="-iMFXR"
    
## Define any user-specific variables you want here.
source ~/.bashrc_custom

