#!/bin/bash

#defining two parameters first name and ID
name=$1
id=$2

function descriptionBea(){
    echo "The Beatles were an English rock band, formed in Liverpool in 1960, that comprised John Lennon, Paul McCartney, George Harrison and Ringo Starr. They are regarded as the most influential band of all time and were integral to the development of 1960s counterculture and popular music's recognition as an art form."
}

#validating the input

str='[a-zA-Z]'
int='^[0-9]+$'
#checking the total parameter
  if [ $# != 2 ] 
  then
    echo "----------------------------------------------"
    echo "You should have entered both Name and College ID"
    echo "Program is quitting"
    sleep 3
    
    echo "Re-run the script while entering both Paramters"
    sleep 1
    exit 

#check the first parameter to be name

  elif ! [[ $name =~ $str ]]
  then 
          echo "-------------------------------------"
          echo "Proper Name must be supplied"
          sleep 2 
          echo "Thank you so Much :)"
          echo "Please Re-run the script with proper name"
          exit  #exiting the program
#check the second parameter is integer
  elif ! [[ $id =~ $int ]]
  then 
          echo "--------------------------------------"
          echo "Id must be in integer"
          sleep 2
          echo "Thank you and please try again"
      sleep 1
  exit

fi



function band(){
    echo " "
    echo "BandName  Code"
    echo "_________________"
    echo "|Beatles |  BEA  |"
    echo "|AC/DC   |  AD   |"
    echo "|Queen   |  QUE  |"
    echo "|Blondie |  BLO  |"
    echo "|Nirvana |  NIR  |"
    echo "|________|_______|"
    
    echo ""
    echo -n "Enter the code of best music band: "
    read bestBand
    if [[ $bestBand == 'BEA' || $bestBand == 'bea' ]];then
        echo "You guessed it correctly!"
        sleep 3
        echo " "
        echo "Here is the short description of the band:"
        sleep 3
        echo " "
        descriptionBea
    else
        while [[ $bestBand -ne "BEA" || 'bea' ]];
        do
                echo "Try again! You guessed it wrong"
                echo " "
                echo "BandName  Code"
                echo "_________________"
                echo "|Beatles |  BEA  |"
                echo "|AC/DC   |  AD   |"
                echo "|Queen   |  QUE  |"
                echo "|Blondie |  BLO  |"
                echo "|Nirvana |  NIR  |"
                echo "|________|_______|"
                echo ""
                echo -n "Enter the code of best music band: "
                read bestBand
                if [[ $bestBand == 'BEA' || $bestBand == 'bea' ]];then
                    echo "You guess it correctly"
                    sleep 3
                    echo " "
                    echo "Here is short description of band:"
                    sleep 3
                    echo " "
                    descriptionBea
                    echo ""

                    exit
                fi
        done
    fi
}

function welcome(){
    echo "Welcome $name"
    sleep 1
    echo "Your ID is $id"
    echo "Execution date and time: `date`"
    band
}

function secret_key(){
    echo "Enter the secret key: "
    stty -echo
    read sec_key;
    stty echo
    if [[ $sec_key == "noice" ]]; then
        echo "Correct Key"
        welcome
    else
        for i in 1 2
        do
            echo "Wrong Key!"
            echo "Enter the secret key: "
            stty -echo
            read sec_key;
            stty echo
            if [[ $sec_key == "noice" ]]; then
                echo "Correct Key"
                welcome
                exit
            fi
        done
        echo "GG! Exitiing!"
        exit
    fi

}

secret_key


#creating function try again
function tryAgain(){
    read -p "Would you like to try again? Y/N - " ans  # user will give their answer if they want to try again or not
 if [[ "$ans" = "Y" || "$ans" = "y" ]]  #validating if the user wants for new try
  then
  fiveMembers  #calling function fiveMembers
  else
  echo " "
echo "Thank you."
    echo "Have a great day with full of refreshment"
        sleep 2
        echo " "
      exit  
 fi
}



#checking the entered artist code if the typed code belongs to the table
function firstVerify(){

  for code in $one $two $three 
  do 
    if [[ $code == "JL" || $code == "AY" || $code == "FM" || $code == "DH" || $code == "KC" ]]
    then
      secondVerify
    else
      echo "Artists must be choosen from the above table."
    tryAgain
    fi
  done
}

#verifying if user has typed in three artist code or not
function secondVerify() {

ac=($one $two $three)
a=${#ac[@]}  #declaring variable a for storing the total length of user input from ac

if [[ $a != 3 ]]
then 
  echo "You have to enter three artist"
tryAgain
else
thirdVerify
fi
}


function thirdVerify() {

if [[ $one == $two || $two == $three || $one == $three ]]
then
  echo "you can not enter the same artist code"
  tryAgain
  else
  topThree
  fi
}


#creating the topThree function 

function topThree(){
echo " "
echo "______________________"
echo "| SN  | Artist Code  |"
echo "|_____|______________|"
echo "| 1   |   $one         |"
echo "| 2   |   $two         |"
echo "| 3   |   $three         |"
echo "|_____|______________|"
echo " "
echo " "


PS3="Select one of the three artist: "  #asking user to choose one of the three artist code
    select artist in $one $two $three
    do
    	case $artist in  #using case statement 
    		"JL")
    			cat JL  #To display the content of JL file using the cat command
    			echo "--------------------------------------------------------"
    			topThree  #calling topThree function to repeat the step
    			;;
    		"AY")
    			cat AY  #To display the content of JL file using the cat command
    			echo "--------------------------------------------------------"
    			topThree  #calling topThree function to repeat the step
    			;;
    		"FM")
    			cat FM  #To display the content of JL file using the cat command
    			echo "--------------------------------------------------------"
    			topThree  #calling topThree function to repeat the step
     			;;
     		"DH")
     			echo " "
     			echo "The file doesn't exist."
     			echo "Sorry :( Try again! Please"
     			echo "--------------------------------------------------------"
     			fiveMembers  #calling fiveMembers function
     			;;
     		"KC")
     			echo " "
     			echo "The file doesn't exist."
     			echo "Sorry :( Try again! Please"
     			echo "--------------------------------------------------------"
     			fiveMembers  #calling fiveMembers function
     			;;
     		*)
     			echo " "
     			echo "Please select the artist code from the above."
     			echo "--------------------------------------------------------"
          tryAgain #calling function tryAgain
     			;;
     esac  #closing case
  done
}


function fiveMembers(){
     
     echo " "
     echo "Five star members of the band"
     
     echo "_____________________________________"
     echo "| Name               | Artist Code  |"
     echo "|____________________|______________|"
     echo "| John Lennon        | JL           |"
     echo "| Angus Young        | AY           |"
     echo "| Freddie Mercury    | FM           |"
     echo "| Debbie Harry       | DH           |"
     echo "| Kurt Cobain        | KC           |"
     echo "|____________________|______________|"
     echo " "



# asking user to enter the 3 artist
echo "Please choose three artist using their respective code"
echo "Enter three artist code separating by spaces:"
read one two three
ac=($one $two $three)


#checking if the code of artist 2 letter

if [ ${#ac} != 2 ]
then
  echo "The length of the artist code must be 2."
  echo "Sorry :( Please Try again"
  tryAgain
else
  firstVerify
fi
}
fiveMembers




