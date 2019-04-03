#!/bin/bash


function bootstrap() {
printf "We will start kill DogeCash services before downloading the Bootstrap.\n"

killall dogecashd
sleep 2
systemctl stop DogeCash.service

printf "Now we need to install MegaTools.\n"
sudo apt-get install -y megatools unzip

cd /root/.dogecash
megadl 'https://mega.nz/#!VMhB3AoJ!T1tblj6FnG7ymKw18TkfSnFuL9Q_BqaDQQJUrNy27XI'
sleep 10
unzip blocks-03-04-19.zip

echo -e " "

read -n 1 -s -r -p "Bootstrap Applied."

}


function restart_mn() {

systemctl start DogeCash.service
sleep 15
systemctl enable DogeCash.service

printf "DogeNode restarted. \n"
read -n 1 -s -r -p "Press any key to continue"

}

##MAIN##

clear
bootstrap
restart_mn
