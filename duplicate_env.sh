#!/bin/bash

read -p 'What is the new datacenter / environment name? ' DC

# old DC to copy from
# read -p 'What is the datacenter / environment that you would like to duplicate? ' DC_OLD

SERVICE=$@

# make new directories and copy files from bkk2 (except encrypted secrets) - this could take another variable of an environment you'd like to copy from (see DC_OLD)
for i in $SERVICE
do
# if test for dns - could add other services if needed
if [ $i = "dns" ]
then
mkdir -p dns-master/env/$DC
mkdir -p dns-slave/env/$DC
cp -v dns-master/env/bkk2/* dns-master/env/$DC
cp -v dns-slave/env/bkk2/* dns-slave/env/$DC
rm -v dns-master/env/$DC/secrets.env.enc
rm -v dns-slave/env/$DC/secrets.env.enc
else
echo 'starting else'
mkdir -p $i/env/$DC
cp -v $i/env/bkk2/* $i/env/$DC/
rm -v $i/env/$DC/secrets.env.enc
fi
done

# Grab SPOD IPs to rename files
read -p 'Enter the IP for SPOD001: ' SPOD1
read -p 'Enter the IP for SPOD002: ' SPOD2


echo $SPOD1
echo $SPOD2



