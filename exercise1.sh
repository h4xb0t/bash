#!/bin/bash

VAR1="Shell scripting is fun!"

HOSTNAME=$(hostname)

echo ${VAR1}

echo "This script is running on ${HOSTNAME}."


echo "Let's test if /etc/passwd exists shall we?"

sleep 1
echo ".."
sleep 1
echo ".."
sleep 1

if [ -e /etc/passwd ]; then
echo "IT DOES EXIST!"
fi

if [ -w /etc/passwd ]; then
echo "You have write permissions!"
else
echo -e "You do NOT have write permissions!\n"
fi


ANIMALS="man bear pig dog cat sheep"
for i in ${ANIMALS}; do
    echo $i 
done

# Uncomment to accept user input
# read -p 'Name a file, any file, and I will check for it: ' FILE
# echo $FILE

# sets the first argument to file
# FILE=$1

#sets all arguments passed to file variable
FILE=$@

for FILE in $@; do
if [ -e $FILE ]; then
    echo -e "Let me check that file!\n..."
else
    echo "That file does not exist"
fi

if [ -f $FILE ]; then
    echo -e "That is a regular file"
    ls -al $FILE
elif [ -d $FILE ]; then
    echo -e "That is a directory"
    ls -al $FILE
fi
done

exit 0