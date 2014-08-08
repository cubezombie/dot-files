# .bashrc

# User specific aliases and functions
# Source user defs

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]"
#PS1="[\[\033[32m\]\w\[\033[01;00;0m\]]\$ "
#PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$"
#PS1="\[\033[31m\]\t\[\033[m\]-\[\033[1;37m\]\u\[\033[m\]@\[\033[34m\]\h:\[\033[33;1m\]\w\[\033[m\]\$"

#fucking around with umask
#umask 006
## Current bash prompt
#PS1="[\u@\h \d \A]\w\$"

## gpg shit
GPG_TTY=`tty`
export GPG_TTY

## git bash prompt
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
source ~/.git-completion.sh

## Some things to make my life easier
shopt -s cdspell

## Append live to bash_history from terminals
shopt -s histappend

## Using vim
alias vi='vim'

## Let's ignore dup commands in history
export HISTIGNORE="ls:ls *:exit:clear:cd"

## I like having my commands in history
export HISTFILESIZE=200000

## Date I ran teh awesome commands
export HISTTIMEFORMAT="%F %T "

##CVS Shit

## This is for mutt

## some commands##
alias ls='ls -lh --color'
alias ifconfig='/sbin/ifconfig'
alias route='/sbin/route'
alias nfinger='ssh fileserver "finger $1"'
alias nid='ssh fileserver "id $1"'
alias ngetent='ssh fileserver "getent $1"'

## Work RT shit

export RTUSER=jwaltersataddress.com
export RTSERVER='https://fileserver/rt'
export PERL_LWP_SSL_VERIFY_HOSTNAME=0

##OpenVPN stuff
alias wvpn='sudo openvpn --config /etc/openvpn/ovpn.conf'

##RT Stuff##
alias triage='ticket triage'
alias mine='ticket mine'
alias user='ticket user'

##work machines##
alias 22='ssh jwalters@fileserver'
alias site2='ssh jwalters@fileserver'
alias site1='ssh jwalters@fileserver'
alias home='ssh jwalters@fileserver'

##NetBackup##
alias nbu='/usr/openv/netbackup/bin/jnbSA'
alias empty_slots='ssh jwalters@fileserver "/usr/local/bin/empty-slots.sh"'

##home##

##I hate windows##
#alias citrix-old='rdesktop -T citrix-old -za 16 -k en-us -r disk:home=$HOME -g 1024x768 citrix-old &'
#alias citrix-stage='rdesktop -T citrix-stage -za 16 -k en-us -r disk:home=$HOME -r disk:cdrom=/mnt/cdrom -g 1280x1024 citrix-stage &'
#alias citrix01='rdesktop -T citrix01 -za 16 -k en-us -r disk:home=$HOME -r printer:two_west@cups1 -r printer:two_east_color -g 1280x1024 citrix01 &'
#alias dbatools='rdesktop -T dbatools -za 16 -k en-us -r disk:home=$HOME -g 1280x1024 dba-wintools &'
#alias windows='rdesktop -g 1280x1024 jwalters-virt &'
#alias ntterminal='rdesktop -g 1280x1024 ntterminal &'
#alias bes01='rdesktop -g 1280x1024 bes01 &'

##console shit

function console()

{

local OPT=$(shopt -p -o nounset)
set -o nounset

# Treat unset variables as an error

local HOST=$1

local CONSERVER

case ${HOST} in

    *office1*) CONSERVER="conserver-01";;

    *office2*) CONSERVER="conserver-01";;

    *office3*) CONSERVER="conserver-02";;

    *office4*) CONSERVER="conserver";;

    *office5*) CONSERVER="console";;

    *)     CONSERVER="conserver-01";;

esac

/usr/bin/console -M ${CONSERVER} ${HOST}

eval ${OPT}
}
