#!/bin/bash
# Set HTML Page
echo "Will only work as root/sudo"
read -p "Please enter HTML text: " banner
cat << EOF > /var/www/html/index.html
<html>
<title>Cyber Summer Camp 2.0</title>
<body><h1>${banner}</h1>
</body></html>
EOF
