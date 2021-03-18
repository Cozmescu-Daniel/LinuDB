#!/bin/bash
echo "What do you want to change?"
echo "Options are: name,email,ip."
read general_choice
echo "Who do you wanna change? Insert username"
read who
if [ "$general_choice" = "name" ]
then
echo "insert first name:"
read firstname
echo "insert last name:"
read lastname


if [[ "${firstname}" =~ [^a-zA-Z] ]]; then
   echo "Invalid because contains special character or number";exit 1
else
   sleep .5s;echo "First Name Format: OK"
fi

if [[ "${lastname}" =~ [^a-zA-Z] ]]; then
   echo "Invalid because contains special character or number";exit 1
else
   sleep .5s;echo "Last Name Format: OK"
fi

sudo mysql -u root -ppi <<qry
USE db2;
UPDATE tb2
SET firstname="$firstname", lastname="$lastname"  
where username="$who";
qry
fi


if [ "$general_choice" = "email" ]
then
echo "insert email:"
read email
regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"


if [[ $email =~ $regex ]] ; then
    echo "Mail Format: OK"
else
    echo "The mail is not a correct format";exit 1
fi

sudo mysql -u root -ppi <<quer
USE db2;
UPDATE tb2
SET email="$email"  
where username="$who";
quer
fi


if [ "$general_choice" = "ip" ]
then
echo "insert ip:"
read ip
if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
 echo "IP Format: OK"
else
  echo "Incorrect IP";exit 1
fi

sudo mysql -u root -ppi <<quu
USE db2;
UPDATE tb2
SET ip="$ip"
where username="$who";
quu
fi
