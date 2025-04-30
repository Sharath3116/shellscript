#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $ID -ne 0 ]
then 
    echo -e "your not $R root user $N"
    exit 1
    else
        echo -e "your $G root user $N"
fi

yum install mysql -y

if [ $? -eq 0 ]
then
    echo -e "sql install $G SUCESS $N"
else 
    echo -e "sql install $R FAILURE $N"
    exit 1
fi


