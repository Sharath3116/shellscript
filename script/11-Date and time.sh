#!/bin/bash

DATE=$(TZ=IST-5:30 date +'%d/%m/%y %T %Z')
echo "script started at ${DATE}"

PERSON1=$1
PERSON2=$2
NUMBER1=$3
NUMBER2=$4
SUM=$((NUMBER1+NUMBER2))

echo "Hello my name is ${PERSON1}: have pet name ${PERSON2}"
echo "what you expect me to do ${PERSON2}:nothing whats is your problem ${PERSON1}"
echo "Total is ${SUM}"

DATE=$(TZ=IST-5:30 date +'%d/%m/%y %T %Z')
echo "script ended at ${DATE}"







