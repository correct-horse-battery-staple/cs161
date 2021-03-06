
	#  Data Area - allocate and initialize variables
.data

rslabel:
	.asciiz "Rs: "
	
rtlabel:
	.asciiz "Rt: "

immlabel:
	.asciiz "Imm: "

oplabel:
	.asciiz "Opcode :"

rdlabel:
	.asciiz "Rd: "

shamtlabel:
	.asciiz "Shamt: "

functlabel:
	.asciiz "Funct: "

addrlabel:
	.asciiz "Addr: "
	
newline:
	.asciiz "\n"
	
#Text Area (i.e. instructions)
.text

	# your code goes here, after the main: label
main:
	# do not remove the next two lines

	addi $sp, $sp, -4
	sw $ra 0($sp)

	la $t0,rtype2
	lw  $t1, 0($t0)

	
	add $t5, $0, 0

	#add $a0, $t1, $0
	#jal printInt
	
	la $a0, oplabel
	lui $t3, 0xFC00
	addi $t6, $t6, 26
	jal methodA

	la $a0, rslabel
	lui $t3, 0x03E0
	addi $t6, $t6, 21
	jal methodA
	
	la $a0, rtlabel
	lui $t3, 0x001F
	addi $t6, $t6, 16
	jal methodA

	add $t5, $0, $0
	addi $t5, $t5, 16
	
	la $a0, rdlabel
	lui $t3, 0xF800
	addi $t6, $t6, 11
	jal methodA
	
	la $a0, shamtlabel
	lui $t3, 0x07C0
	addi $t6, $t6, 6
	jal methodA
	
	la $a0, functlabel
	lui $t3, 0x003F
	jal methodA

	###################

	la $t0,jtype
	lw  $t1, 0($t0)
	
	add $t5, $0, $0

	#add $a0, $t1, $0
	#jal printInt
	
	la $a0, oplabel
	lui $t3, 0xFC00
	addi $t6, $t6, 26
	jal methodA

	la $a0, addrlabel
	lui $t3, 0xFFFF
	srl $t3, $t3, 16
	lui $t3, 0x03FF
	jal methodA	

	###################
	
	la $t0,itype
	lw $t1, 0($t0)

	add $t5, $0, 0

	#add $a0, $t1, $0
	#jal printInt
	
	la $a0, oplabel
	lui $t3, 0xFC00
	addi $t6, $t6, 26
	jal methodA

	la $a0, rslabel
	lui $t3, 0x03E0
	addi $t6, $t6, 21
	jal methodA
	
	la $a0, rtlabel
	lui $t3, 0x001F
	addi $t6, $t6, 16
	jal methodA

	add $t5, $0, $0
	addi $t5, $t5, 16
	
	la $a0, immlabel
	lui $t3, 0xFFFF
	jal methodA
	
	# leave the next line, it is a correct way to end a program in QtSpim

	lw $ra, 0($sp)
	jr $ra

rtype1:
	xor $s1, $s2, $s3

rtype2:	
	srl  $s1, $s2, 24

itype:
	ori  $t0, $t2, 104

jtype:	
	j    main
	
printString:
	addi $v0,$0, 4
	syscall
	jr $ra

	
printInt:
	addi $v0, $0, 1	# put 1 into $v0  (tells OS to print an int)
	syscall			# print the number
	addi $sp, $sp, -8
	sw $ra 0($sp)
	sw $a0 4($sp)
	la $a0, newline
	jal printString
	lw $ra 0($sp)
	lw $a0 4($sp)
	addi $sp, $sp, 8
	jr $ra

methodA:
	add $s7, $ra, $0
	
	jal printString
	srlv $t3, $t3, $t5
	and $t4, $t3, $t1
	srlv $a0, $t4, $t6
	jal printInt
	add $t3, $0, $0
	add $t6, $0, $0
	
	jr $s7