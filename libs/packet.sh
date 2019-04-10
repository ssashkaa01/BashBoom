#!/usr/bin/env bash

clear
PTMenu(){
    echo -e "1. Install\n2. Search\n3. Remove\n4. Update\n0. Exit"
    read choice
}

PTInstall(){
  read -p "Enter packet name => " packetName
  yum install $packetName
}

PTSearch(){
  read -p "Enter packet name => " packetName
  yum search $packetName
}

PTRemove(){
  read -p "Enter packet name => " packetName
  yum remove $packetName
}

PTUpdate(){
  yum update
}

pmexit=true

while [ $pmexit == true ]
do
  PTMenu;
  case $choice in
    1) PTInstall; ;;
    2) PTSearch; ;;
    3) PTRemove; ;;
    4) PTUpdate; ;;
    0) echo "Back to main menu!"; let pmexit=false; ;;
    *) echo "Wrong choice!"; ;;
  esac
done