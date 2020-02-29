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
##############################################################################

USE_MESSAGE="
Use $0	[-h]

  -h	shows help
  -V	shows current version

"

if test "$1" = "-h"
then
  echo "$USE_MESSAGE"
  exit 0
fi

cut -d : -f 1,5 /etc/passwd | tr : \\t\\t
