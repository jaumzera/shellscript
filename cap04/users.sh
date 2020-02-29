#!/bin/bash

###############################################################################
# users.sh
#
# Shows users login and system user names
# Obs: reads /etc/passwd
#
# Jaumzera, Feb 20th, 2020
#
# v1.0		adds support to -h
# v1.1		adds support to -V (version)
# v1.2    fixes the bug when no params is passed
##############################################################################

CURRENT_VERSION="v1.1"

USE_MESSAGE="
Use $0 [-h]

  -h	shows help
  -V	shows current version

"

case "$1" in
  -h)
    echo $USE_MESSAGE
    exit 0
  ;;

  -V)	
    echo $CURRENT_VERSION
    exit 0
  ;;

   *)
    if test -n "$1"
    then 
      echo "invalid option: $1"
      exit 1
    fi
  ;;
esac

cut -d : -f 1,5 /etc/passwd | tr : \\t\\t
