#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
        if [ $1 - 0 ]
        then 
            echo -e "$1 install is $G SUCESS $N"
        else    
            echo -e "$2 install is $R Failed $N"
        fi
}

if [ $ID -ne 0 ]
then
    echo -e "Error:: run the script with $R root user $N"
    exit 1
else
    echo -e "$G your are root user$N"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "installing mysql"

yum install git -y &>> $LOGFILE

VALIDATE $? "installing git"

