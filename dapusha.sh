#!/bin/bash

echo "push list file path -- push serverlist /tmp/temp.sh /tmp"

##------Define variables------##
list=$1
file=$2
path=$3

##------Get credentials------##
echo -n "Enter your username:"
read un

echo -n "Enter your password:"
read -s pass

##------Logic------##
for x in `cat $list`;
 do
  sshpass -p $pass scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $file $un@$x:$path
  ls -lah $path|grep -i $file
  echo "---------------"
done
