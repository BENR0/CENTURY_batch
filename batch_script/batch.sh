#!/bin/bash
#get arguments for input and output file and assign variables
IFILE=$1
OFILE=$2

#management echo function
echo_mgmt () {
    #get arguments of function and assign to vars
    MM=$1
    MG=$2
    OP=$3
    echo "   1    $MM $MG"
    echo "$OP"
    return 1
}

#set first line counter
k=1
#get number of lines of schedule file
nlines=$(cat $IFILE | wc -l)

#read management definition file given as first argument line by line
#and write output to file given as second argument.
#Using '&' as delimiter between fields in the same line
#run variable not used as of now
while IFS='&' read -r run first second third;do

    #write header for schedule file only once
    if [ "$k" == "1" ]; then
        cat batch_script/schedule_header.txt
        #first echo default for growing season month
        echo_mgmt 3 FRST
    fi

   #echo each management defined in lines of file
   echo_schedule.sh "$first" "$second" "$third" 

   if [ "$k" == "$nlines" ]; then
       #echo default for last growingseason month
       echo_mgmt 10 LAST 
       #echo closing line of schedule file
       echo '-999 -999 X' 
   fi 
   
   #increase line count
   ((k++))

done < $IFILE > $OFILE


