# Syscalls
# 		  Print	  Read
# int 		1		5
# float 	2		6
# double 	3		7
# string 	4		8
# char		11		12
# exit 10
#
# ASCII Values
# +		43
# -		45
# *		42
# x		120




# Calling main just in case
jal main
li $v0, 10
syscall



main:
	addi $s0, $ra, 0		# Save return address to s0


	jal readInt				# Jump and link to readInt label
	addi $a0, $v0, 0		# Read integer part of first number and save to a0

	jal readInt				# Jump and link to readInt label
	addi $a2, $v0, 0		# Read float part of first number and save to a1

	jal readChar			# Jump and link to readChar label
	addi $s1, $v0, 0		# Read operator and save to s0
	jal readChar			# Reading one more character to get new line char

	jal readInt				# Jump and link to readInt label
	addi $a1, $v0, 0		# Read integer part of second number and save to a2

	jal readInt				# Jump and link to readInt label
	addi $a3, $v0, 0		# Read float part of second number and save to a3



C1:	slt $t0, $a0, $zero		# If integer part of first number is negative set t0 (flag)
	beq $t0, $zero, C2		# If flag is not set then it is positive, go to second number (C)heck on C2
	mul $a2, $a2, -1		# Convert float part to negative too

C2:	slt $t0, $a1, $zero		# If integer part of second number is negative set t0 (flag)
	beq $t0, $zero, OP		# If flag is not set then it is positive, go to (OP)erator check on OP
	mul $a3, $a3, -1		# Convert float part to negative too



OP:	addi $t0, $zero, 43		# Load t0 the ASCII of '+'
	beq $t0, $s1, ADD		# Branch ADD if operator == '+'

	addi $t0, $zero, 45		# Load t0 the ASCII of '-'
	beq $t0, $s1, SUB		# Branch SUB if operator == '-'

	addi $t0, $zero, 42		# Load t0 the ASCII of '*'
	beq $t0, $s1, MUL		# Branch J2 if operator == '*'

	j end					# Operator unknown, abort





ADD:jal addition			# Jump and link to addition
	addi $s1, $v0, 0		# Taking integer part to s1
	addi $s2, $v1, 0		# Taking floating part to s2
	j check					# Jump to end



SUB:jal subtraction			# Jump and link to subtraction
	addi $s1, $v0, 0		# Taking integer part to s1
	addi $s2, $v1, 0		# Taking floating part to s2
	j check					# Jump to end


MUL:jal multiplication		# Jump and link to multiplication for integer parts
	addi $s1, $v0, 0		# Taking integer part to s1
	addi $s2, $v1, 0		# Taking floating part to s2
	j check					# Jump to end






end:addi $ra, $s0, 0		# Load return address from s0
	jr $ra					# End prosedure and return the caller of main






addition:
	add $v0, $a0, $a1		# Adding integer parts
	add $v1, $a2, $a3		# Adding float parts
	jr $ra					# Return 1


subtraction:
	sub $v0, $a0, $a1		# Subtracting second integer part from first
	sub $v1, $a2, $a3		# Subtracting second float part from first
	jr $ra					# Return 2


multiplication:
	mul $v0, $a0, $a1		# Multiplying integers on arguments
	mul $v1, $a2, $a3		# Multiplying float parts on arguments
	jr $ra					# Return 3


readInt:
	li $v0, 5				# Loading integer input code
	syscall					# Making system call
	jr $ra					# Returning to the caller



readChar:
	li $v0, 12				# Loading char input code
	syscall					# Making system call
	jr $ra					# Returning to the caller




check:
	slt $t0, $s2, $zero
	beq $t0, $zero, print
	sub $s2, $zero, $s2

print:
	add $a0, $s1, $zero		# Placing integer part to print
	li $v0, 1				# Loading integer output code
	syscall					# Making system call

	la $a0, '.'
	li $v0, 11
	syscall

	add $a0, $s2, $zero		# Placing float part to print
	li $v0, 1				# Loading float output code
	syscall					# Making system call

	j end









J1:	slt $t0, $a0, $zero
	slt $t1, $a1, $zero
	xor $t2, $t0, $t1
	beq $t2, $zero, ADD
	xor $t2, $t1, $zero
	beq $t2, $zero, AD1		# Make second float number positive

	add $t0, $a0, $zero
	add $a0, $a1, $zero
	add $a1, $t0, $zero		# Swap integer parts
	add $t0, $a3, $zero
	add $a3, $a2, $zero
	add $a2, $t0, $zero		# Swap float parts
	mul $a1, $a1, -1
	mul $a1, $a3, -1
	j SUB


AD1:mul $a1, $a1, -1
	mul $a1, $a3, -1
	j SUB








J2:	slt $t0, $a0, $zero
	slt $t1, $a1, $zero
	xor $t2, $t0, $t1
	bne $t2, $zero, S1
	xor $t2, $t0, $zero
	bne $t2, $zero, SUB
	mul $a1, $a1, -1
	mul $a1, $a3, -1
	add $t0, $a0, $zero
	add $a0, $a1, $zero
	add $a1, $t0, $zero		# Swap integer parts
	add $t0, $a3, $zero
	add $a3, $a2, $zero
	add $a2, $t0, $zero		# Swap float parts
	j SUB

S1:	xor $t2, $t0, $zero
	bne $t2, $zero, S2
	mul $a0, $a0, -1
	mul $a2, $a2, -1
	j ADD


S2:	mul $a1, $a1, -1
	mul $a1, $a3, -1
	j ADD





J3:	jal multiplication		# Jump and link to multiplication for integer parts
	mflo $s1				# Taking lower part of the result of multiplication
	addi $a0, $a2, 0		# Changing arguments to float parts
	addi $a1, $a3, 0		# Changing arguments to float parts
	jal multiplication		# Jump and link to multiplication for float parts
	mflo $s2				# Storing multiplication of float parts in s1
	j check					# Jump to end
