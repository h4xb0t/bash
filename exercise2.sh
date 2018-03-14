#!/bin/bash

#Part 1 - Write a shell script that displays "This script will exit with a 0 exit status." Be sure that the script does indeed exit with a 0 exit status.

#echo 'This script will exit with a 0 status.'

#exit 0

#Part 2 - Write a shell script that accepts a file or directory name as an argument. Have the script report if it is a regular file, a directory, or other type of file. If it is a regular file, exit with a 0 exit status. If it is a directory, exit with a 1 exit status. If it is some other type of file, exit with a 2 exit status.

# FILE=$1

# if [ -f $FILE ] 
# then
#     echo 'This is a regular file, exiting with "exit 0"'
#     exit 0
# elif [ -d $FILE ]
# then
#     echo 'This is a directory, exiting with "exit 1"'
#     exit 1
# else
#     echo 'This is neither a regular file or directory, exiting with "exit 2"'
#     exit 2
# fi

#Part 3 - Write a script that executes the command "cat /etc/shadow". If the command returns a 0 exit status report "Command succeeded" and exit with a 0 exit status. If the command returns a non­zero exit status report "Command failed" and exit with a 1 exit status.

cat /etc/shadow

if [ $? -eq '0' ]
then
    echo 'Command succeeded'
    exit 0
#this could easily be done as else but I am being explicit  
elif [ $? -ne '0' ]
then
    echo 'Command failed'
    exit 1
fi

