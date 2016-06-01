#!/bin/bash
sudo apt-get -y update

# install the LAMP stack
sudo apt-get -y install apache2 php5 libapache2-mod-php5 php5-mcrypt php5-curl php5-mysql php5-gd php5-cli php5-dev mysql-client
php5enmod mcrypt

# set up a silent install of MySQL
# the following commands set the MySQL root password when you install the mysql-server package.
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password Pass1word'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password Pass1word'

sudo apt-get -y install mysql-server

#Restart all the installed services to verify that everything is installed properly

echo -e "\n"

service apache2 restart && service mysql restart > /dev/null

echo -e "\n"

if [ $? -ne 0 ]; then
   echo "Please Check the Install Services, There is some $(tput bold)$(tput setaf 1)Problem$(tput sgr0)
else
   echo "Installed Services run $(tput bold)$(tput setaf 2)Sucessfully$(tput sgr0)"
fi

echo -e "\n"
