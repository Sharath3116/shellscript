#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))
echo "Total is $SUM"

echo "How many arg passed :: $#"
echo "All args passwed :: $@"
echo "The script name is $0"