#!bin/bash

DIRECTORY="/log/testsclog"

R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'

if [ ! -d $DIRECTORY ]
then    
    echo -e "$R Directory does not exist$N"
else   
    echo -e "$G Directory exists$N"
fi
