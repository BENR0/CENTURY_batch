Batch shell scripts for running CENTURY carbon model
====================================================

Prerequesits
------------

 - directory named "output" in the roots directory of century model which is used for output files
 - one ore more prep files like the example file in the "batch_script" directory

User options/ adaptations
-------------------------

The scripts in the "batch_script" directory are used to create schedule files (.sch) based on the
prep files which are used
to run the century model.
The .prep files are simple text files which contain four fields per line separated by "&" The first
field is not used as of now and can therefore contain any text but it is suggested to use
a short descriptive text for this field might later on be used to create files names.
The second field contains one or more month at which the management type, specified in field three
is applied. This field should be numeric with month separated by spaces. No checking of formating or
data type is applied. The last field needs to be used if a management type which has options is
selected and will therefore contain the option. 

The file "schedule_header.txt" contains the header which is usually created by the event100 program
and contains the basic selections of running periode, name of site.100 file which should be used,
the type of weather and so on. This file needs to be adapted by hand or appropiate ouput of the
event100 program output needs to be copied here.


Running
-------

In order to run a batch of different schedule files, the user simply needs to run the "iterate.sh"
script in the root directory of the century model. The script then will translate the .prep files
the user has created to schedule files, run the model on each of them, save the binary output to the
"output" directory and convert the binary data to ASCII files using the list100 program supplied by
CENTURY. Afterwards the binary data will get deleted to be prepared for the next run.
It is important to note that the list100 program can not overwrite existing files, thus it is
necessary to move the ASCII output of a run to a different directory or rename them in order to make
a run with the same schedule files.
