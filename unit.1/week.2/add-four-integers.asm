# Comsc210 Assignment 2 Add 4 integers 

# Programmer: Z Rousseau
# Data: 2/5/24 

.data
  prompt1: .asciiz "Enter the first integer: "
  prompt2: .asciiz "Enter the second integer: "
  prompt3: .asciiz "Enter the third integer: "
  prompt4: .asciiz "Enter the fourth integer: "
  result_msg: .asciiz "The sum is: "

.text
  main:
    # Prompt and read the first integer
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Prompt and read the second integer
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Prompt and read the third integer
    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Prompt and read the fourth integer
    li $v0, 4
    la $a0, prompt4
    syscall
    li $v0, 5
    syscall
    move $t3, $v0

    # Add the four integers
    add $t4, $t0, $t1  # Add the first two and store in $t4
    add $t4, $t4, $t2  # Add the third to $t4
    add $t4, $t4, $t3  # Add the fourth to $t4

    # Print the result message
    li $v0, 4
    la $a0, result_msg
    syscall

    # Print the sum
    li $v0, 1
    move $a0, $t4
    syscall

    # Exit the program
    li $v0, 10
    syscall