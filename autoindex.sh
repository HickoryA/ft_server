

#!bin/sh

if grep -q "autoindex off;" /etc/nginx/sites-available/localhost
then
	sed -i 's/autoindex off;/autoindex on;/' /etc/nginx/sites-available/localhost
	echo "autoindex ON"
else
	sed -i 's/autoindex on;/autoindex off;/' /etc/nginx/sites-available/localhost
	echo "autoindex OFF"
fi
service nginx restart