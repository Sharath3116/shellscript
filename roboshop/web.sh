$!/bin/bash

ID=$(id -u)

#Colour Code
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE (){
    if [ $1 -ne 0 ]
    then    
        echo -e "$2 $R Failed $N"
        exit 1
    else
        echo -e "$2 $G Failed $N"
    fi
}

#Checking root access"
if [ $ID -ne 0 ]
then 
    echo -e "Please run script $R root user $N" &>> $LOG_FILE
    exit 1
else
    echo -e "Your $G root user $N" &>> $LOG_FILE
fi
dnf install nginx  -y &>> $LOG_FILE
VALIDATE $? "nginx installation status"

systemctl enable nginx

systemctl start nginx

rm -rf /usr/share/nginx/html/*

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip

cd /usr/share/nginx/html

unzip /tmp/web.zip

vim /etc/nginx/default.d/roboshop.conf 

vim /etc/nginx/default.d/roboshop.conf 

systemctl restart nginx 