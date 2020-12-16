## Aliases
alias q="exit"
alias ll="ls -lah"
alias netport="netstat -tulanp"
alias h="history"
alias c="clear"
alias sl="sudo -l"
# sort all cpu starting with highest
alias pscpu="ps auxf | sort -nr -k 3"
# sort top 10 processes using cpu
alias pscpu10="ps auxf | sort -nr -k 3 | head -10"
 
## Safety Net
# preserve root and prompt if removing more than 3 files
alias rm="rm -I --preserve-root"
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## Functions
# grep for process name
procname(){
    ps aux | grep -i $1
}

# grep for user owned processes
userproc() {
    ps -U $1 -u $1 u
}

# mkdir and cd to that dir
md() {
    test -n "$1" || return
    mkdir -p "$1" && cd "$1"
}

# uncompress files based on ext
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1    ;;
      *.tar.gz)    tar xzvf $1    ;;
      *.bz2)       bzip2 -d $1    ;;
      *.rar)       unrar2dir $1    ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip2dir $1     ;;
      *.Z)         uncompress $1    ;;
      *.7z)        7z x $1    ;;
      *.ace)       unace x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()"   ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

## Prompt
## show OS version in prompt
os_release="$(< /etc/redhat-release tr ' ' _ | cut -d . -f 1 | grep -Eo '5|6|7')"
# turn root prompt red and user prompt green
if [[ $(id -u) -eq 0 ]]
then
   PS1="[RHEL:$os_release:\[\033[01;31m\]\u@\h: \W]\e[00m\] "
else
   PS1="[RHEL:$os_release:\[\033[01;32m\]\u@\h: \W]\e[00m\] "
fi
 
## Other stuff
 
# history with timestamps
HISTTIMEFORMAT="%Y-%m-%d %T "
# don't add dupe lines to history
HISTCONTROL=ignoreboth
