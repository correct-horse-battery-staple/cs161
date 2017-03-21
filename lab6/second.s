#Kevin Wang and Andy Tang

.globl list


#  Data Area - allocate and initialize variables
.data

count:
	.word	10
list:
        .word 3 11 157 99 81 13 17 55 11 999

answers:
	.word 0 0 0

#Text Area (i.e. instructions)
.text

	# your code goes here, after the main: label
main:
	la $t1, count		#address of count
	lw $t2, 0($t1)		#t2 = value of count
	la $t1, list		#address of list
	add $t3, $0, $0		#t3 is iterator
	add $s0, $0, $0		#t4 is sum
	lw $t5, 0($t1)
	add $s1, $0, $t5	#t6 is and
	add $s2, $0, $0		#t7 is xor
back:	lw $t5, 0($t1)		#load next element in list
	add $s0, $s0, $t5	#do stuff with the list
	and $s1, $s1, $t5
	xor $s2, $s2, $t5
	add $t1, $t1, 4		#loop stuff
	addi $t3, $t3, 1	
	bne $t3, $t2, back
	la $t1, answers		#copying to answers
	add $t2, $0, $0
back2:	l
	addi $t2, $t2, 4
	bne $, back2
	

	# leave the next line, it is a correct way to end a program in QtSpim
	
	jr $ra