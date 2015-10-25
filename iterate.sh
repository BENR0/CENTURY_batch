#!/bin/sh

#temporaily export batch srcipt dir to path
export PATH="$PATH:$(pwd)/batch_script"

#convert prepared runs to schedule files for CENTURY
echo 'Converting prep files'
echo '====================='
for f in batch_script/*.prep; do
    batch.sh $f ${f%.prep}.sch
    echo $f
done

#run the model with the schedule files
echo 'Running model'
echo '====================='
for f in batch_script/*.sch; do
    fname=${f##*/}
    wine century -s ${f%.sch} -n output/${fname%.sch} 
done
 
#convert binary output file to ASCII
echo 'Converting output to ASCII'
echo '====================='
for f in output/*.bin; do
    wine list100 ${f%.bin} ${f%.bin} batch_script/outvars.txt
    sed -e 's/  */;/g' ${f%.bin}.lis > ${f%.bin}.csv
    rm $f
    rm ${f%.bin}.lis
done
