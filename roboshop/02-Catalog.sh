#!/bin/bash

#colour code
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
    echo -e "Starting the Script $TIMESTAMP" &>> $LOGFILE
VALIDATE (){
             if [ $1 -ne 0 ]
            then 
                echo -e "$2 $R Failed$N"
                exit 1
            else
                echo -e "$2 $G Sucess$N"
            fi 
            }
#checking root user status
if [ $ID -ne 0 ]
then
    echo -e "Please run script with$R root user $N"
    exit 1
else
    echo -e "Your running with $G root user $N"
fi

dnf module disable nodejs -y &>> $LOGFILE
    VALIDATE $? "Disable NodeJS Old version"

dnf module enable nodejs:18 -y &>> $LOGFILE
    VALIDATE $? "Enable Noeja Version 18"

dnf install nodejs -y &>> $LOGFILE
    VALIDATE $? "Packange install nodejs"

useradd roboshop &>> $LOGFILE
    VALIDATE $? "SystemAccount roboshop add status"

mkdir /app &>> $LOGFILE
    VALIDATE $? "/app Folder Creation"

curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip &>> $LOGFILE
    VALIDATE $? "Package download"

cd /app 
    VALIDATE $? "Directory Entry"
 
unzip /tmp/catalogue.zip &>> $LOGFILE
    VALIDATE $? "Package unzip status"

cd /app
    VALIDATE $? "Directory Entry"

npm install &>> $LOGFILE
    VALIDATE $? "npm install status"

cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service &>> $LOGFILE
    VALIDATE $? "File Copy Status"

systemctl daemon-reload &>> $LOGFILE
    VALIDATE $? "daemon-reload Status"

systemctl enable catalogue &>> $LOGFILE
    VALIDATE $? "enable catalogue Status"

systemctl start catalogue &>> $LOGFILE
    VALIDATE $? "Catalogue Service Start Status"

cp /home/centos/roboshop-shel/mongo.repo /etc/yum.repos.d/mongo.repo &>> $LOGFILE
    VALIDATE $? "CopCopying mongodb repo" 

dnf install mongodb-org-shell -y &>> $LOGFILE
    VALIDATE $? "mongod shell install"

mongo --host mongodb.olavu.in </app/schema/catalogue.js &>> $LOGFILE
     VALIDATE $? "Loading Catalogue data to MongoDB"



