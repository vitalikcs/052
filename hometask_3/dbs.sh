#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

MYSQL_ROOT_PASSWORD='123456'


echo debconf mysql-server/root_password password $MYSQL_ROOT_PASSWORD | \
  sudo debconf-set-selections
echo debconf mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD | \
  sudo debconf-set-selections



sudo apt-get -qq install mysql-server > /dev/null 


sudo apt-get -qq install expect > /dev/null


tee ~/secure_our_mysql.sh > /dev/null << EOF
spawn $(which mysql_secure_installation)

expect "Enter password for user root:"
send "$MYSQL_ROOT_PASSWORD\r"

expect "Press y|Y for Yes, any other key for No:"
send "y\r"

expect "Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG:"
send "2\r"

expect "Change the password for root ? ((Press y|Y for Yes, any other key for No) :"
send "n\r"

expect "Remove anonymous users? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Disallow root login remotely? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Remove test database and access to it? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Reload privilege tables now? (Press y|Y for Yes, any other key for No) :"
send "y\r"

EOF


sudo expect ~/secure_our_mysql.sh


rm -v ~/secure_our_mysql.sh 


echo "MySQL setup finished."