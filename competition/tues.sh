#!/bin/bash
# useradd -M -g sudo -p $(openssl passwd -crypt password) username
# -M no home dir
# -p password
# -g main group
# -u uid

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

