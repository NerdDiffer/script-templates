#!/bin/bash

promptDelete()
{
  echo "Do you want to remove everything in this directory? ($PWD)"
  echo "  choices are: 'yes', 'no', 'ls'"
  read RES

  case $RES in
    yes | y)
      echo "you chose yes"
      ;;
    no | n)
      echo "you chose no"
      ;;
    ls)
      echo "you chose ls"
      ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F
      ;;
  esac
}

promptDelete
