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
# v1.3    fixes the program basename
#         adds --help and --version
# v1.4    adds automatic grepped version
##############################################################################

USE_MESSAGE="

Use $(basename "$0") [-h|-V]

  -h  --help      shows help
  -V  --version   shows current version

"

case "$1" in
  -h | --help)
    echo "$USE_MESSAGE"
    exit 0
  ;;

  -V | --version)	
    # Shows version from file header
    grep '^# v' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
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
