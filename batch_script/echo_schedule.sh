#!/bin/bash
#assign parameter values to script variables (use parenthesis to
#convert strings to arrays
MONTH=($1)
MGMT=($2)
OPT=($3)

#get length of management array
MGMTLEN=${#MGMT[@]}

#structure of management lines in schedule file:
#   year    month managementtype
#option

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

#echo management type given as arguments
for i in "${MONTH[@]}"
do
    if [ "$MGMTLEN" = "1" ]; then 
        echo_mgmt ${i} ${MGMT[0]} ${OPT[0]}
    else if [ "$MGMTLEN" = "2" ]; then
        echo_mgmt ${i} ${MGMT[0]} ${OPT[0]}
        echo_mgmt ${i} ${MGMT[1]} ${OPT[1]}
    fi
fi
done 
