#!/bin/bash

#--- Variables ---#

iparg=$1
cmd=$2

#--- Help for usage / common connects ---#

if [[  $1 == -h  ]]; then
  echo "Usage: connect [IP/List] ['Command to be executed']"
  echo "Ex: connect 10.0.0.1 'uname -a'"
  echo "****Command should be in quotations****"
  return
fi

#--- SSH Connect Script ---#

echo -n "Enter your Username:"
read un

echo -n "Enter your password:"
read -s pass

if [[  -f ${iparg} ]];
    then
      for i in `cat $iparg` ;
        do
          echo $i
          sshpass -p $pass ssh -q -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null  $un@$i $cmd;
          echo "--------------------------------"
        done
elif [[ $# -eq 0 ]];
    then
      echo -n "Enter IP(s) to connect to:"
      read ip
      ssh -q -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null $un@$ip $cmd
    else
      ssh -q -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null $un@$iparg $cmd
fi
