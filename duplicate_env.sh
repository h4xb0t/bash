#!/bin/bash

# this script is currently designed to copy BKK2 files to the new DC folders - renaming those with SPOD IPs in the names appropriately.
# pass arguments with the name of the services needed at runtime i.e. './duplicate_env.sh cacti dns pulp' you will be prompted for thenew datacenter name and SPOD IPs.

read -p 'Enter the new datacenter / environment name: ' DC

# old DC to copy from
# read -p 'What is the datacenter / environment that you would like to duplicate? ' DC_OLD

# passed arguments
SERVICE=$@

# Grab SPOD IPs to rename files
read -p 'Enter the IP for SPOD001: ' SPOD1
read -p 'Enter the IP for SPOD002: ' SPOD2

# make new directories and copy files from (mainly) bkk2 (except encrypted secrets) - this could take another variable of an environment you'd like to copy from (see DC_OLD)
for i in $SERVICE
do
# if tests for snowflake services folders
if [ $i = 'dns' ]
then
    mkdir -p dns-master/env/$DC
    mkdir -p dns-slave/env/$DC
    cp -v dns-master/env/bkk2/* dns-master/env/$DC
    cp -v dns-slave/env/bkk2/* dns-slave/env/$DC
    rm -v dns-master/env/$DC/secrets.env.enc
    rm -v dns-slave/env/$DC/secrets.env.enc
elif [ $i = 'cauth' ]
then
    mkdir -p $i/env/$DC
    cp -v $i/env/bkk2/* $i/env/$DC/
    mv -v cauth/env/$DC/cauth.10.69.213.3.env cauth/env/$DC/cauth.$SPOD1.env
    mv -v cauth/env/$DC/cauth.10.69.213.67.env cauth/env/$DC/cauth.$SPOD2.env
    rm -v $i/env/$DC/secrets.env.enc
elif [ $i = 'exabgp' ]
then
    mkdir -p $i/env/$DC
    cp -v $i/env/bkk2/* $i/env/$DC/
    mv -v exabgp/env/$DC/exabgp.10.69.213.3.env exabgp/env/$DC/exabgp.$SPOD1.env
    mv -v exabgp/env/$DC/exabgp.10.69.213.67.env exabgp/env/$DC/exabgp.$SPOD2.env
    rm -v $i/env/$DC/secrets.env.enc
elif [ $i = 'monitor' ]
then
    mkdir -p $i/env/$DC
    cp -v $i/env/bkk2/* $i/env/$DC/
    mv -v monitor/env/$DC/host_tester.10.69.213.3.env monitor/env/$DC/host_tester.$SPOD1.env
    mv -v monitor/env/$DC/host_tester.10.69.213.67.env monitor/env/$DC/host_tester.$SPOD2.env
    rm -v $i/env/$DC/secrets.env.enc
elif [ $i = 'op5' ]
then
    mkdir -p $i/env/$DC
    cp -v $i/env/pdx2/* $i/env/$DC/
    mv -v op5/env/$DC/op5.10.142.213.3.env op5/env/$DC/op5.$SPOD1.env
    mv -v op5/env/$DC/op5.10.142.213.67.env op5/env/$DC/op5.$SPOD2.env
    rm -v $i/env/$DC/secrets.env.enc
elif [ $i = 'proxy' ]
then
    mkdir -p $i/env/$DC
    cp -v $i/env/bkk2/* $i/env/$DC/
    mv -v proxy/env/$DC/sidecar.10.69.213.3.env proxy/env/$DC/sidecar.$SPOD1.env
    mv -v proxy/env/$DC/sidecar.10.69.213.67.env proxy/env/$DC/sidecar.$SPOD2.env
    rm -v $i/env/$DC/secrets.env.enc
elif [ $i = 'drp' ]
then
    mkdir -p $i/env/$DC
    cp -v $i/env/pdx32/* $i/env/$DC/
    rm -v $i/env/$DC/secrets.env.enc
else
#   echo 'STARTING ELSE'
    mkdir -p $i/env/$DC
    cp -v $i/env/bkk2/* $i/env/$DC/
    rm -v $i/env/$DC/secrets.env.enc
fi
done








