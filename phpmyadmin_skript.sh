#!bin/bash
PHPMYADMIN=$(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c 'ok installed'$)
#Kontrollib mitu korda PHP korral ok installed
if [ $PHPMYADMIN -eq 0 ];
then echo "PHPMYADMIN ja vajalike lisade paigaldamine"
apt install phpmyadmin
echo "PHPMYADMIN paigaldamine lõpule viidud"
# Kui PHPMYADMIN ei ole paigaldatud (ehk võrdub 0)
# Siis väljastatakse PHPMYADMIN ja vajalike lisade paigaldamine ning hakkaba PHPMYADMIN'i installima$
# Kui PHPMYADMIN installeerimine on lõpetatud, siis väljastatakse PHPMYADMIN paigaldamine lõpule viidud$
elif [ $PHPMYADMIN -eq 1 ];
then echo "PHPMYADMIN on juba installitud"
# Kui PHPMYADMIN on juba installitud (ok installed = 1), siis väljastab PHPMYADMIN on juba isntallitud$
# ning kontrollib olemasolu
fi
# Tingimuslause ja skripti lõpp

