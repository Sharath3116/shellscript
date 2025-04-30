#!/bin/bash
ID=$(id -u)

#Colour code
R="\e[31m"
G="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo -e "$G Script Started Executing at $TIMESTAMP $N" &>> $LOGFILE
echo -e "$G Script Started Executing at $TIMESTAMP $N"

VALIDATE() {
        if [ $1 -ne 0 ]
        then 
            echo -e "$2 $R FAILED $N"
            exit 1
        else
            echo -e "$2 $G SUCESS $N"
        fi
        }

if [ $ID -ne 0 ]
then
    echo -e "RUN SCRIPT WITH$R ROOT USER$N"
    exit 1
else    
    echo -e "YOU ARE $G ROOT USER $N"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing git"

yum install inginx -y &>> $LOGFILE

VALIDATE $? "Installing inginx"








