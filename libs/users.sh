 #! /bin/bash
clear
function UserMenu(){
   echo -e "1. Create user\n2. Delete user\n3. Edit user\n0. Exit"
   read choice
}

function CreateUser (){
   clear
   echo -e "1. Create user by name\n2. Create user by name + uid + gid";
   read userChoice
   if (( $userChoice == 1 ))
   then 
     echo "Enter username: "
     read newUserName
     cat /etc/passwd | grep $newUserName
     if (( $? == 0  ))
     then 
      echo "User exist!"
     else
       useradd $newUserName 
       passwd $newUserName
     fi
   elif (( $userChoice == 2 ))
   then 
     echo "Enter username: "
     read newUserName
     cat /etc/passwd | grep $newUserName
     if (( $? == 0 ))
     then
       echo "User exist"
     else
       echo "Enter UID: "
       read uid
     fi
     cat /etc/passwd | grep $uid
     if (( $? == 0 ))
     then 
       echo "User exist!"
     else
     	echo "Enter GID: "
    	read gid
        cat /etc/group | grep $gid
        if (( $? != 0  )) 
        then 
          echo "Group does no exist!"
        else 
     	 useradd $newUserName -u $uid -g $gid
     	 passwd $newUserName
        fi

     fi
    else echo "Wrong choice!"
   fi 
}

function DeleteUser(){
  echo "Enter username to delete: "
  read delName
  cat /etc/passwd | grep $delName
  if (( $delName == 0 ))
  then 
    userdel $delName -r
    echo "Success!"
  else 
    echo "User dous not exist!"
  fi

}

EditUser(){
  echo -e "1. Change name\n2. Change UID\n3. Change GID\n4. Password";
  read editUserChoice
  
  if (( $editUserChoice == 1 ))
  then 
   echo "Enter username:"
   read editUser
   cat /etc/passwd  | grep $editUser
   if (( $? == 0 )) 
   then
    echo "Enter new name:"
    read newName
    usermod $editUser -l $newName
   else
     echo "User does not exist"
   fi
   
   elif (( $editUserChoice == 2 )) 
   then
    echo "Enter username for uid change: "
    read userNameUID
    cat /etc/passwd | grep $userNameUID
    if (( $? == 0 ))
    then 
     echo "Enter new UID"
     read newUID
     usermod $userNameUID -u $newUID
    else
     echo "User does not exist"   
    fi
    
    elif (( $editUserChoice == 3 )) 
   then
    echo "Enter username for gid change: "
    read userNameUID
    cat /etc/passwd | grep $userNameUID
    if (( $? == 0 ))
    then 
     echo "Enter new GROUP"
     read newUID
     usermod $userNameUID -g $newUID
    else
     echo "User does not exist"   
    fi
    
    elif (( $editUserChoice == 4 )) 
   then
    echo "Enter username for change password: "
    read userNameUID
    cat /etc/passwd | grep $userNameUID
    if (( $? == 0 ))
    then 
     passwd $userNameUID
    else
     echo "User does not exist"   
    fi
    
     
  fi

}



  exit=true
  
  while [ $exit == true ]
  do
     UserMenu;
     case $choice in
       1) CreateUser; ;;
       2) DeleteUser; ;;
       3) EditUser; ;;
       0) echo "Bye!"; let exit=false ;;
       *) echo "R.T.F.M."; ;;
  
     esac
  done
