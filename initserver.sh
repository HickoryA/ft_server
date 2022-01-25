



chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

mkdir /etc/nginx/ssl
openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/lkarine.key -out /etc/nginx/ssl/lkarine.crt  -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=fuck/CN=lkarine"

mv ./root/nginx-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service mysql start
echo "CREATE USER 'lkarine'@'localhost' IDENTIFIED BY 'qwerty';" | mysql -u root 
echo "CREATE DATABASE wordpress;" | mysql -u root 
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'lkarine'@'localhost';" | mysql -u root 
echo "FLUSH PRIVILEGES;" | mysql -u root 

mkdir /var/www/html/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/html/phpmyadmin
mv ./root/phpmyadmin.inc.php /var/www/html/phpmyadmin/config.inc.php

wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/html/
mv ./root/wp-config.php /var/www/html/wordpress/

service php7.3-fpm start
service nginx start
bash