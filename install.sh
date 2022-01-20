#!/usr/bin/env bash

if [ -e /usr/bin/catfetch.sh ]
then 
  echo "catfetch installed"
else
  echo "catfetch not installed"
fi

echo "You want download for ${LOGNAME} or for all users?"
echo """
[1] = Only ${LOGNAME}
[2] = All users
[c] = Cancel
"""
read -a choose

str1="2"

if [ ${choose} == "$str1" ]; then
  sudo wget --quiet https://raw.githubusercontent.com/JhonnyRice/cat-fetch-reborn/main/catfetch.sh -P /usr/bin/
  sudo chmod +x /usr/bin/catfetch.sh
else
  if [ ! -d "$HOME/.local/bin/" ]; then 
    echo "Directory $HOME/.local/bin/ does not exist, creating"
    mkdir $HOME/.local/bin/
  fi
  wget --quiet https://raw.githubusercontent.com/SpyLima/cat-fetch-reborn/main/catfetch -P $HOME/.local/bin/.sh
  chmod +x $HOME/.local/bin/catfetch.sh
fi
