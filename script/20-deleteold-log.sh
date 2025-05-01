#!/bin/bash

DIRECTORY="/tmp/shellcri/"

R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'

if [ ! -d $DIRECTORY ]
then    
    echo -e "$R Directory does not exist$N"
    exit 1
fi

Files_to_delete=$(find $DIRECTORY -type f -mtime +14   -name "*.log")

while IFS= read -r line
do
    echo -e "$R deleting log $line $N"
    rm -rf $line
   

done <<< "$Files_to_delete"
