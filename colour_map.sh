# Author: coder0526
# Start Date: Jun,20.2013
#
# Original from http://stackoverflow.com/questions/6159856/how-do-zsh-ansi-colour-codes-work
# answer by Farooq
# 

function Colour.Show(){
  text="test123!@#"
  bg=1
  fg=1
  [[ "$#" == "0" ]] && echo "Please use named variables 'bg', 'fg', 'text'" || local $*;
  bgTag="\e[48;5;${bg}m"
  fgTag="\e[38;5;${fg}m"
  text="${bgTag}${fgTag} $text \e[0m"
  echo $text
}

function Colour.Table(){
  for i in {0..15} ; do
    for j in {1..16}; do
      num=$((i*16+j - 1))
#     echo -en "\e[48;5;${num}m ${num} \e[0m"
      printf "\e[48;5;%dm \e[38;5;232m %3s \e[0m" $num ${num}
    done
    echo
  done
  echo
}

function Colour.printall(){
  for COLOR in $(seq 0 255) 
  do
    for STYLE in "38;5"
    do
      TAG="\033[${STYLE};${COLOR}m"
      STR="${STYLE};${COLOR}"
      echo -ne "${TAG}${STR}${NONE}  "
    done
    echo
  done
}

