#!/bin/bash
#export DEBIAN_FRONTEND=noninteractive ;
#set -eu ; # abort this script when a command fails or an unset variable is used.
#set -x ; # echo all the executed commands.

#user='custom_ssh_username' ;

# // UPDATE & INSTALL
#sudo apt-get -q update ;
#sudo apt-get -yq install nginx ;

# // ADD CUSTOM USER LOGIN
#usermod  -l $user ubuntu ;
#groupmod -n $user ubuntu ;
#usermod  -d /home/$user -m $user ;
#if [ -f /etc/sudoers.d/90-cloudimg-ubuntu ]; then
#  mv /etc/sudoers.d/90-cloudimg-ubuntu /etc/sudoers.d/90-cloud-init-users ;
#fi ;
#perl -pi -e "s/ubuntu/$user/g;" /etc/sudoers.d/90-cloud-init-users ;

#printf "\nUSER-DATA FINISHED @ $(date)\n" > /tmp/zcc.txt