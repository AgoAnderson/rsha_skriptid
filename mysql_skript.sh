#!bin/bash
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed'$)
#Kontrollib mitu korda MYSQL korral ok installed
if [ $MYSQL -eq 0 ];
then echo "MYSQL ja vajalike lisade paigaldamine"
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
# Lisasime vajaliku konfiguratsiooni faili antud kasutaja kodukausta
elif [ $MYSQL -eq 1 ];
then echo "MYSQL on juba installitud"
mysql
# Kui MYSQL on juba installitud (ok installed = 1), siis väljastab MYSQL on juba installitud$
# ning kontrollib olemasolu
fi
# Tingimuslause ja skripti lõpp

