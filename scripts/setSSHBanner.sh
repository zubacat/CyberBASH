#!/bin/bash
#SSH Banner test - only /etc/issue.net
echo "Will only work as root/sudo"
read -p "Please enter SSH banner text: " banner
echo $banner > /etc/issue.net
