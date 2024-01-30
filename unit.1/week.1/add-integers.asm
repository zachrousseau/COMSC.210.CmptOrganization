# Comsc210 Assignment 1 Add integers 

# Programmer: Z Rousseau
# Data: 1/27/24 

.data
prompt1: .asciiz "\n Please Input the first value "
prompt2: .asciiz "\n Please Input the second value "
result: .asciiz "The total is "
bye: .asciiz "\n **** Adios Amigo - Have a good day ****"
.globl main
.text

main:
	# Get the first value
	li $v0, 4
	la $a0, prompt1
	syscall
	li $v0, 5
	syscall
	blez $v0, end 
	li $t0, 0 
	add $t0, $t0, $v0
	
	# Get the second value
	li $v0, 4
	la $a0, prompt2
	syscall
	li $v0, 5
	syscall
	blez $v0, end 
	li $t1, 0
	add $t1, $t1, $v0
	
	# Add the values 
	add $t3, $t0, $t1
	
end:
	# Print the results 
	li $v0, 4 
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 10 
	syscall
	
	
	