#!/bin/bash

read -p 'What is your datacenter / environment name? ' DC

SERVICE=$@

# Make new directories and copy files from bkk2 (except encrypted secrets)
for i in $SERVICE
do
mkdir -p $i/env/$DC
cp -v $i/env/bkk2/* $i/env/$DC/
rm -v $i/env/$DC/secrets.env.enc
done

# Grab SPOD IPs to rename files
read -ep 'Enter the IP for SPOD001: ' SPOD1
read -ep 'Enter the IP for SPOD002: ' SPOD2


echo $SPOD1
echo $SPOD2

# cp /env/{ $NEWENV }/


