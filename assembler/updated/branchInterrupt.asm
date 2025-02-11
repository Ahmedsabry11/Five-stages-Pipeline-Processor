﻿#branch.asm
#this is a comment 
#all numbers are in hexadecimal
#the reset signal is raised before this code is executed and the flags and the registers are set to zeros.
.ORG 0 #this is the interrupt code
MOVI R7,15h     #R7=00000015
ADD R7,R4
STD R4,R7
RTI
.ORG 20 #this is the instructions code
IN R6   #R6=300
IN R1     #R1=40
IN R2     #R2=500
IN R3     #R3=100
IN R4     #R4=07FF
Push R6   #SP=000007FE, M[000007FF]=300
LDD R4,R5 #stall
CALL R5 
INC R1	  #42 this statement shouldn't be executed until ret
#check flag fowarding  
.ORG 30
AND R1,R5   #R5=0 , Z = 1
JN R2
JZ R2       #Jump taken, Z = 0
SETC        # this statement shouldn't be executed, C-->1
#check on flag updated on jump
.ORG 300
MOV R3,R5  #R5=100, flag no change
JC R5      #shouldn't be taken
#check destination forwarding
NOT R7     #R7=FFFFFFFF, Z= 0, C--> not change, N=1
## raise interrupt here
MOV R5,R7 #R7=100, flag no change
INC R1   #R1=41  
RET
