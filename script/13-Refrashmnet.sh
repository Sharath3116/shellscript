#!/bin/bash

echo "WeLcOmE to Janshi CaFe"
echo "Following are the refreshments available:"
echo "tea, milk, coffee"

read -p "Enter your item: " item

if [ "$item" == "tea" ]; then
    echo "Tea cost is 10/-"
elif [ "$item" == "milk" ]; then
    echo "Milk price is 15/-"
elif [ "$item" == "coffee" ]; then
    echo "Coffee price is 20/-"
else
    echo "Thank you"
fi

exit 0
