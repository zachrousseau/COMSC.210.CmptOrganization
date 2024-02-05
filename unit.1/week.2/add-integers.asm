# Comsc210 Assignment 2 Add 2 integers 

# Programmer: Z Rousseau
# Data: 2/5/24 

.data
  prompt1: .asciiz "Enter the first integer: "
  prompt2: .asciiz "Enter the second integer: "
  result_msg: .asciiz "The sum is: "

.text
  main:
    # Prompt for the first integer
    li $v0, 4   # System call code for printing a string
    la $a0, prompt1
    syscall

    # Read the first integer
    li $v0, 5   # System call code for reading an integer
    syscall
    move $t0, $v0  # Store the first integer in $t0

    # Prompt for the second integer
    li $v0, 4
    la $a0, prompt2
    syscall

    # Read the second integer
    li $v0, 5
    syscall
    move $t1, $v0  # Store the second integer in $t1

    # Add the two integers
    add $t2, $t0, $t1  # Store the sum in $t2

    # Print the result message
    li $v0, 4
    la $a0, result_msg
    syscall

    # Print the sum
    li $v0, 1   # System call code for printing an integer
    move $a0, $t2
    syscall

    # Exit the program
    li $v0, 10  # System call code for exit
    syscall