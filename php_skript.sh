#!bin/bash
PHP=$(dpkg-query -W -f='${Status}' php7.0 2>/dev/null | grep -c 'ok installed'$)
#Kontrollib mitu korda PHP korral ok installed
if [ $PHP -eq 0 ];
then echo "PHP ja vajalike lisade paigaldamine"
apt install php7.0 libapache2-mod-php7.0 php7.0-mysql
echo "PHP paigaldamine lõpule viidud"
# Kui PHP ei ole paigaldatud (ehk võrdub 0)
# Siis väljastatakse PHP ja vajalike lisade paigaldamine ning hakkaba PHP'd installima
# Kui apache installeerimine on lõpetatud, siis väljastatakse PHP paigaldam$
elif [ $PHP -eq 1 ];
then echo "PHP on juba installitud"
which php
# Kui PHP on juba installitud (ok installed = 1), siis väljastab  PHP on juba installitud
# ning kontrollib olemasolu
fi
# Tingimuslause ja skripti lõpp
