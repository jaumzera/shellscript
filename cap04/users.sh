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
# v1.5    adds sort option
# v1.6    adds invert and uppercase options
###############################################################################

USE_MESSAGE="

Use $(basename "$0") [-h|-V]

  -h  --help      shows help
  -V  --version   shows current version
  -s  --sort      sort 
  -i  --invert    invert printing order
  -u  --upper     print uppercase

"

should_sort=0
should_invert=0
should_upper=0

while test -n "$1" 
do
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

    -s | --sort)
      should_sort=1
    ;;

    -i | --invert)
      should_invert=1
    ;;

    -u | --upper)
      should_upper=1
    ;;
  esac

  shift   # forces $N to become $SN-1
done

result=$(cut -d : -f 1,5 /etc/passwd | tr : \\t)

if test "$should_sort" = 1
then
  result=$(echo "$result" | sort)
fi


if test "$should_invert" = 1 
then
  result=$(echo "$result" | tac)
fi

if test "$should_upper" = 1
then
  result=$(echo "$result" | tr a-z A-Z)
fi

echo "=============================================================================="
echo "$result"

exit 0
