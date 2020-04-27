#!bin/bash
APACHE2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')
 #Kontrollib mitu korda apache2 korral ok installed
if [ $APACHE2 -eq 0 ];
then echo "Apache2 paigaldamine"
apt install apache2
echo "Apache2 paigaldamine lõpule viidud" 
# Kui apache ei ole paigaldatud (ehk võrdub 0)
# Siis väljastatakse Apache paigaldamine ning hakkab apachet installima
# Kui apache installeerimine on lõpetatud, siis väljastatakse Apache2 paigaldamine lõpule viidud
elif [ $APACHE2 -eq 1 ];
then echo "Apache2 on juba installitud"
service apache2 start
service apache2 status
# Kui apache on juba paigaldatud, siis väljastatakse Apache2 on juba installitud
# ning alustab apache2 ja näitab tema olekut
fi 
# Tingimuslause ja skripti lõpp

