.globl myArray

#  Data Area - allocate and initialize variables
.data

# MyArray declaration allocates a 3 integer array, 
myArray:
        .word 0x00000003 0x0000009 0x0000000 

#Text Area (i.e. instructions)
.text

main:

	la 	$s0, myArray  #this is a pseudoinstruction
	
	lw	$s1, 0($s0)	# $s1 <-- 3

	lw 	$s2, 4($s0)	# $s2 <-- 9

	and 	$s3, $s1, $s2	# $s3 <-- 1

	or 	$s4, $s1, $s2   # $s4 <-- 11

	sw	$s4, 8($s0)	# store 11 in the third word of myArray

	addi	$s3, $s3, 5	# add 5 to $s3

	ori	$t0, $0, 0x14A0	# $t0 <-- 5280
	
	srl	$t0, $t0, 2		# $t0 <-- 1320

	addi	$t2, $0,  6		# $t2 <-- 6

	or	$t3, $0, $0		# $t3 <-- 0
	
back:	add	$t3, $t3, $t2

	addi	$t2, $t2, -1

		# this is a branch if not equal	
		# the program goes to back if $t2 != $0	

	bne	$t2, $0, back	
	j	main


