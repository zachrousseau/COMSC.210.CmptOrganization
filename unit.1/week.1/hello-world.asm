# Comsc210 Assignment 1 Hello World

# Programmer: Z Rousseau
# Data: 1/25/24 

.data

message: .asciiz "Hello World"

.text # program instructions 
la $a0, message # la = load Address (Addresses on the right, 32 registers). Loading message into register $a0 
li $v0, 4 # Loads immediate value into register $v0 
syscall  # syscall for print a string function 