#!/bin/sh

#temporaily export batch srcipt dir to path
export PATH="$PATH:$(pwd)/batch_script"

for f in batch_script/*.prep; do
    batch.sh $f ${f%.prep}.sch
    echo $f
done

for f in batch_script/*.sch; do
    fname=${f##*/}
    wine century -s ${f%.sch} -n output/${fname%.sch} 
done
 
for f in output/*.bin; do
    wine list100 ${f%.bin} ${f%.bin} batch_script/outvars.txt
    rm $f
done
