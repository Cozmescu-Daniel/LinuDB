#!/bin/bash
clear
username=$1
firstletter=${username:0:1}
echo "Verifying data."
sleep .5s
clear
echo "Verifying data.."
sleep .5s
clear
echo "Verifying data..."
sleep .5s
clear
echo "Verifying data...."
sleep .5s
clear 
echo "Verifying data....."
sleep .5s
clear
 if [[ $firstletter =~ ^[0-9] ]]
then
        echo " First character must be a letter. Error: Number as first character "
	exit 1
else
	sleep .5s;echo "Username Format: OK"	 
fi
# nu mai este nevoie de o verificare suplimentara pentru 1 singur cuvant deoarece prin $1 se primeste doar primul cuvant dintr-un sir de cuvinte separat de spatii

firstname=$2

if [[ $firstname == *"-"* ]]; then
  lastname=${firstname#*-}
  firstname=${firstname%-*}

else
  lastname=$3;shift
fi

if [[ "${firstname}" =~ [^a-zA-Z] ]]; then
   echo "Invalid because contains special character or number";exit 1
else 
   sleep .5s;echo "Name Format: OK"
fi

if [[ "${lastname}" =~ [^a-zA-Z] ]]; then
   echo "Invalid because contains special character or number";exit 1
else
   sleep .5s;echo "Name Format: OK"
fi


email=$3
regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"


if [[ $email =~ $regex ]] ; then
    sleep .5s; echo "Mail Format: OK"
else
    echo "The mail is not a correct format";exit 1
fi


ip=$4

if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
 sleep .5s; echo "IP Format: OK"
else
  echo "Incorrect IP";exit 1
fi

sleep 1s
clear 
echo "------------------------------------------"
echo "INSERTING DATA INTO DATABASE...PLEASE WAIT"
echo "------------------------------------------"
sleep 2s
clear
echo "-------------------"
echo "YOUR DATABASE FIELD"
echo "-------------------"
sleep .5s
clear
echo "USERNAME: $username"; sleep .5s
echo "FIRST NAME:  $firstname"; sleep .5s
echo "LAST NAME:  $lastname"; sleep .5s
echo "EMAIL: $email"; sleep .5s
echo "IP: $ip"; sleep 2s

clear
echo "Showing database."
sleep .5s
clear
echo "Showing database.."
sleep .5s
clear
echo "Showing database..."
sleep .5s
clear

sudo mysql -u root -ppi <<EOF
USE db2;
INSERT INTO tb2(username,firstname,lastname,email,ip)
VALUES("$username","$firstname","$lastname","$email","$ip");
EOF
