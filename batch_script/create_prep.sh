#!/bin/bash
#Create prep files with different management typ options fast
#Argument 2 can be an array which needs to be given in "" separated by spaces

MGMT=$1
OPT=($2)

for i in "${OPT[@]}"
do
    echo "$1&7&${MGMT}&${i}" > "${MGMT}_${i}_1.prep"
    echo "$1&6 8&${MGMT}&${i}" > "${MGMT}_${i}_2.prep"
    echo "$1&5 7 9&${MGMT}&${i}" > "${MGMT}_${i}_3.prep"
    echo "$1&4 6 8 10&${MGMT}&${i}" > "${MGMT}_${i}_4.prep"
done
