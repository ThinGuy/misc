#!/bin/bash
##############################################################################
# Title:         getops+usage.fu
# Purpose:       Bash getops and usage function
# Rev:           1.0
# Author:        Craig Bender
# Date:          10/07/2016 
# Copyright ©️:   2016 Craig Michael Bender. All rights reserved.
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
example_usage() {
cat <<EOF 1>&2|sed -r 's/[ \t]*$//g'

${FUNCNAME%%_*} does blah, blah

Usage: ${FUNCNAME%%_*} [-h] [-A A_VALUE_EXAMPLE] [-a a_VALUE_EXAMPLE] [-B b_VALUE_EXAMPLE] [-b b_VALUE_EXAMPLE]  [-C] [-c]
  
Options:

  -A            : Explanation of option A
                  Default = Default setting if option A is not set

  -a            : Explanation of option a
                  Default = Default setting if option a is not set

  -B            : Explanation of option B
                  Default = Default setting if option B is not set

  -b            : Explanation of option b
                  Default = Default setting if option b is not set

  -C            : Explanation of option C
                  Default = false

  -c            : Explanation of option c
                  Default = true

  -h            : This usage message

$(printf 'Copyright \u00a9 2016 Craig Michael Bender. All rights reserved.\n\n')

EOF
}
 
# Parse the Args
parseArgs "$@"

#Now do stuff based on arguments
[[ $A_ARG= "AOO" ]] && echo "The -A option was set to the default" || echo "The -A option was set to $A_ARG"
