#!/bin/bash

#Add new user for bolt
sudo useradd -G wheel -m bolt
echo boltpasswd | sudo passwd --stdin bolt

#copy bolt public key
sudo mkdir -p /home/bolt/.ssh
cat /vagrant/keys/id_rsa.pub > /home/bolt/.ssh/authorized_keys
sudo chown -R bolt:bolt /home/bolt/.ssh
sudo chmod -R 600 /home/bolt/.ssh