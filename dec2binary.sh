#!/bin/bash
# SCRIPT:  dec2binary.sh
# USAGE:   dec2binary.sh Decimal_Number(s)
# PURPOSE: Decimal to Binary Conversion. Takes input as command line
#          arguments.
#                        \\\\ ////
#                       \\  - -  //
#                           @ @
#                   ---oOOo-( )-oOOo---
#
#####################################################################
#                      Script Starts Here                           #
#####################################################################

if [ $# -eq 0 ]
then
    echo "Argument(s) not supplied "
    echo "Usage: dec2binary.sh Decimal_number(s)"
else
echo -e "\033[1mDECIMAL             \t\t BINARY\033[0m"

    while [ $# -ne 0 ]
    do
         DecNum=$1
         Binary=
         Number=$DecNum

         while [ $DecNum -ne 0 ]
         do
              Bit=$(expr $DecNum % 2)
              Binary=$Bit$Binary
              DecNum=$(expr $DecNum / 2)
         done

     if [ $Binary -lt 0 ]
	then
		Binary = Binary  
	
     fi	     


         echo -e "$Number              \t\t $Binary"
         shift
# Shifts command line arguments one step.Now $1 holds second argument
        unset Binary
   done

fi
