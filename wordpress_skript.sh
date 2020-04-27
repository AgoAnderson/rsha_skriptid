#!bin/bash
APACHE2=$(dpkg-query -W -f="${Status}" apache2 2>/dev/null | grep -c "ok installed")
 #Kontrollib mitu korda apache2 korral ok installed
if [ $APACHE2 -eq 0 ]; then
echo "Apache2 paigaldamine"
apt install apache2
echo "Apache2 paigaldamine lõpule viidud"
# Kui apache ei ole paigaldatud (ehk võrdub 0)
# Siis väljastatakse Apache paigaldamine ning hakkab apachet installima
# Kui apache installeerimine on lõpetatud, siis väljastatakse Apache2 paigaldamine lõpule viidud
elif [ $APACHE2 -eq 1 ]; then
echo "Apache2 on juba installitud"
service apache2 start
service apache2 status
# Kui apache on juba paigaldatud, siis väljastatakse Apache2 on juba installitud
# ning alustab apache2 ja näitab tema olekut
fi
MYSQL=$(dpkg-query -W -f="${status}" mysql-server 2>/dev/null | grep -c "ok installed")
#Kontrollib mitu korda MYSQL korral ok installed
if [ $MYSQL -eq 0 ]; then
echo "MYSQL ja vajalike lisade pagialdamine"
apt install mysql-server
echo "MYSQL paigaldamine lõpule viidud"
# Kui MYSQL ei ole paigaldatud (ehk võrdub 0)
# Siis väljastatakse PHP ja vajalike lisade paigaldamine ning hakkab MYSQL'i installima$
# Kui MYSQL installeerimine on lõpetatud, siis väljastatakse MYSQL paigaldamine lõpule viidud$
touch $HOME/.my.cnf
# Lisasime võimaluse kasutada MYSQL käsk ilma kasutaja ja parooli lisamisteta
echo "[client]" >> $HOME/.my.cnf
echo "host = localhost" >> $HOME/.my.cnf
echo "user = root" >> $HOME/.my.cnf
echo "password = qwerty" >> $HOME/.my.cnf
echo "mysql-server on paigaldatud"
# Lisasime vajaliku konfiguratsiooni faili antud kasutaja kodukausta
elif [ $MYSQL -eq 1 ]; then
echo "MYSQL on juba installitud"
# Kui MYSQL on juba installitud (ok installed = 1), siis väljastab MYSQL on juba installitud$
fi
PHP=$(dpkg-query -W -f="${status}" php7.0 2>/dev/null | grep -c "ok installed")
if [ $PHP -eq 0 ]; then
#Kontrollib mitu korda PHP korral ok installed
echo "PHP ja vajalike lisade paigaldamine"
apt install php7.0 libapache2-mod-php7.0 php7.0-mysql
echo "PHP paigaldamine lõpule viidud"
# Kui PHP ei ole paigaldatud (ehk võrdub 0)
# Siis väljastatakse PHP ja vajalike lisade paigaldamine ning hakkaba PHP'd installima
# Kui apache installeerimine on lõpetatud, siis väljastatakse PHP paigaldamine lõpule viidud$
elif [ $PHP -eq 1]; then
echo "PHP on juba installitud"
which php
# Kui PHP on juba installitud (ok installed = 1), siis väljastab  PHP on juba installitud
# ning kontrollib olemasolu
fi
#wordpressi installimine
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp wordpress/wp-config-sample.php wordpress/wp-config.php
mv wordpress /var/www/html
#wordpressi jaoks andmebaasis andmebaasi tegemine ja ksutaja tegemine
mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'qwerty';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL database ja user on tehtud."
# skripti lõpp
