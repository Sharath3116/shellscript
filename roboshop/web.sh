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

systemctl enable nginx &>> $LOG_FILE
VALIDATE $? "enable nginx"

systemctl start nginx &>> $LOG_FILE
VALIDATE $? "nginx installation status"

rm -rf /usr/share/nginx/html/* &>> $LOG_FILE
VALIDATE $? "Remove the default content that web server is serving."

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip &>> $LOG_FILE
VALIDATE $? "Download the frontend content"

cd /usr/share/nginx/html &>> $LOG_FILE
VALIDATE $? "Extract the frontend content" 

unzip -o /tmp/web.zip &>> $LOG_FILE
VALIDATE $? "unzip files"

cp home/ec2-user/shellscript/roboshop/roboshop.conf /etc/nginx/default.d/roboshop.conf &>> $LOG_FILE
VALIDATE $? "Copied ngnix revers proxcy config"


systemctl restart nginx &>> $LOG_FILE
VALIDATE $? "nginx service restart"