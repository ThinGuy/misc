#!/bin/bash
##############################################################################
# getopts_and_usage.sh
# Bash Shell Script Example with getops and usage
#                                                          Rev: 1.0
#                                                       Author: Craig Bender
#                                                         date: 10/07/2014
# 
# Function: Provides a script example to run with options
# Copyright (c) 2016 Craig Michael Bender. All rights reserved.
##############################################################################
#Global Variables and settings
export TRUE=true
export FALSE=false
export PROGNAME="${$0##*/}"

# Set default values
export A_ARG="AOO"
export a_arg="aoo"
export B_ARG="BOO"
export b_arg="boo"
export C_ARG="$FALSE"
export c_arg="$TRUE"

#Functions

#parseArgs is the function that performs getopts
parseArgs() {
 
 # Options separated by : require an argument
 # those that do not need to have their value set
   
    while getopts "A:a:B:b:Cch" inOpt ; do
         case $inOpt in
            [A])   export A_ARG="$OPTARG";;
            [a])   export a_ARG="$OPTARG";;
            [B])   export B_ARG="$OPTARG";;
            [b])   export b_ARG="$OPTARG";;
            [C])   export C_ARG="$TRUE";;
            [c])   export c_ARG="$FALSE";;
            [h])    usage
                    exit 0
                    ;;
            \?) echo "Error: invalid option specified"
                  exit 1;;
         esac
    done
}

#usage is the function that displays program help
usage()
{
cat <<EOF
Usage: $PROGNAME [-h] [-A A_VALUE_EXAMPLE] [-a a_VALUE_EXAMPLE] [-B b_VALUE_EXAMPLE] [-b b_VALUE_EXAMPLE]  [-C] [-c]
 
Short Explanation of what this script does 
 
Options:

  -A            : Explalantion of option A
                  Default = Default setting if option A is not set

  -a            : Explalantion of option a
                  Default = Default setting if option a is not set

  -B            : Explalantion of option B
                  Default = Default setting if option B is not set

  -b            : Explalantion of option b
                  Default = Default setting if option b is not set

  -C            :  Explalantion of option C
                  Default = false

  -c            : Explalantion of option c
                  Default = true

  -h            : This usage message
  
 
Copyright (c) 2016 Craig Michael Bender.. All rights reserved.
EOF
}
 
# Parse the Args
parseArgs "$@"

#Now do stuff based on arguments
[[ $A_ARG= "AOO" ]] && echo "The -A option was set to the default" || echo "The -A option was set to $A_ARG"
