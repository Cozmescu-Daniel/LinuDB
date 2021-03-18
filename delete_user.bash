#!/bin/bash
echo "Username":
read usr

sudo mysql -u root -ppi <<query
	USE db2;
	DELETE FROM tb2 WHERE username="$usr";
query
echo "DELETED USER $usr"
