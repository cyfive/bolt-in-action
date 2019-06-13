#!/bin/bash

#Add new user for bolt
sudo useradd -G wheel -m bolt
echo boltpasswd | sudo passwd --stdin bolt

#copy bolt public key
sudo -u bolt mkdir -p /home/bolt/.ssh
sudo -u bolt cat /vagrant/keys/id_rsa.pub > /home/bolt/.ssh/authorized_keys
sudo chown -R bolt:bolt /home/bolt/.ssh
sudo chmod 600 /home/bolt/.ssh/*
sudo chmod 700 /home/bolt/.ssh
sudo chcon -v unconfined_u:object_r:ssh_home_t:s0 /home/bolt/.ssh
sudo chcon -R -v unconfined_u:object_r:ssh_home_t:s0 /home/bolt/.ssh