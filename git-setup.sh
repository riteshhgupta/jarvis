#!/bin/bash

green=`tput setaf 2`
reset=`tput sgr0`

echo -e "\n......................................"
echo -e "${green}Jarvis at your service sir! Sit back, let me take care of git & github setup for you 🚀\n${reset}"

echo -e "......................................"
echo -e "${green}adding .gitignore & LICENSE to your repo..\n${reset}"
cp ~/jarvis/.gitignore .gitignore
cp ~/jarvis/LICENSE LICENSE

echo -e "......................................"
echo -e "${green}adding git to your repo..\n${reset}"
git init
git config --local user.name \"Ritesh Gupta\"
git config --local user.email \"rg.riteshh@gmail.com\"
git add --all
git commit -m "chore(*): project init"

# variables
CURRENTDIR=${PWD##*/}
GITHUBUSER=$(git config github.user) 
PRIVATE_TF=false

USERNAME='riteshhgupta'
PASSWORD='DV9Mx)Dw(4bjMzj'
REPONAME=basename `git rev-parse --show-toplevel`

REPONAME=${REPONAME:-${CURRENTDIR}}
USERNAME=${USERNAME:-${GITHUBUSER}}

echo -e "\n......................................"
echo -e "${green}creating a repo on github..\n${reset}"
curl -u $USERNAME:$PASSWORD -s https://api.github.com/user/repos -d "{\"name\": \"$REPONAME\", \"private\": $PRIVATE_TF, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": true}" > /dev/null

echo -e "......................................"
echo -e "${green}pushing your repo to github..\n${reset}" 
git remote add origin git@github.com:$USERNAME/$REPONAME.git
git push -u origin master

echo -e "\n......................................"
echo -e "${green}All done sir 🚀${reset}"
echo -e "......................................\n"









