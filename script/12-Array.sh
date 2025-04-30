#!/bin/bash

ID=$(id -u)
if [ $ID -eq 0 
{
echo "YOUR ARE ROOT USER"
}
else 
{
    echo "you are not rooy user"
}
exit 1
fi
yum install mssql -y



 


