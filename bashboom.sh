#!/bin/bash

function menu(){

  echo -e "0 - exit\n1 - chmod\n2 - user manager";
  
  echo -e "Please enter action:";
}

start=1

while ((start == 1));
do

  clear
  
  menu;
  
  read action;
  
  case $action in 
    0) start=0;;
    1) source libs/chmod.sh; ;;
    2) source libs/users.sh; ;;
  
  esac

done