


################################################################################
#
#         
#         Program Name: Lab4 - VowelCounter
#
#         Desription:   Determine How Many Vowels are in a String of Text
#         
#         Group:  ** Enter the name of your group and the programmers in the group
#                    		Programmer: 
#				Programmer: 
#			  	Programmer: 
#			  	Programmer: 
#				Programmer: 
################################################################################

# This program is full of bugs!

####################################  Data Segment #############################
.data
        

          prompt1: .asciiz "Enter Text: "
          prompt2: .asciiz "\n   There are  "		## BUG FIX: Changed prompt: -> prompt2		
          prompt3: .asciiz " Vowels in the Text that you entered "
          text:    .word 4 # make a 4 byte word to hold the address of text


# Register Use:
#
# CountTheVowels is the subroutine used to count the number of vowels
# 
#  a0 - holds string address
#  a1 - holds the max number of characters to read
#  s0 - holds number of vowels
#  v0 - returns number of vowels
#  t3 - this is used to save the result (returned in $v0) 


######################################  Text Segment #######################
.text
.globl  main

        
main:   
                initialize:    jal Initialize
                 inputtext:    jal InputText
            countthevowels:    jal CountTheVowels ## BUG FIX: Change CountTheVowel -> CountTheVowels		
            displayoutput:     jal DisplayOutput
                      exit:    jal Exit
  

######################### Subroutines ################################

######################### Initialize

Initialize:

            li $a0, 0
            li $a1, 0
            li $s0, 0
            li $v0, 0
            li $t3, 0
            jr $ra
            
######################### Input the Text
InputText:

        li      $v0,4            # print prompt to ask for Text
        la      $a0,prompt1   
        syscall
        
        li      $v0,8            # Enter documentation here
        li      $a1, 80          # Enter documentation here
        la      $a2,text         #  Enter documentation here 				
        syscall
        

  # move    $s0,$v0          #  Enter documentation here
        jr $ra

######################## Count the number of Vowels
   
CountTheVowels:  
        sub $sp,$sp,16    #  $sp = $sp - 16 # BUG FIX: Should be Increments of 4 
        sw $a0,0($sp)
        sw $s0,4($sp)
        sw $s1,8($sp)							
        sw $ra,12($sp)
        
        move $s1,$a0   #  Enter documentation here

loop:  
         lb $a0,($s1)      # get each character
         beqz $a0,done     # zero marks end	 ## BUG FIX: Changed beqtz -> beqz			
         jal IsAVowel      # call the IsAVowel subroutine
         add $s0,$s0,$v0   # add 0 or 1 to count
         add $s1,$s1,1     # move along string
         b loop
done:    
         move $v0,$s0   # use $v0 for result

         lw $a0,0($sp)  #  Enter documentation here
         lw $s0,4($sp)
         lw $s1,8($sp)
         lw $ra,12($sp)
         add $sp,$sp,16
         jr $ra

##################  Check if it IsAVowel 

IsAVowel:   # this will check to see if the character being passed in $a0 is a vowel or not

         li $v0,0
         beq  $a0,'a',true
         beq  $a0,'e',true
         beq  $a0,'i',true
         beq  $a0,'o',true
         beq  $a0,'u',true
         			
     

         jr $ra  # Enter documentation here - What is this instruction doing?

true:    li $v0,1 # if the character is a vowel it will set the return value in $v0 to 1
                  # and return from here
         jr $ra

##################  Display the Output
DisplayOutput:

        move $t3,$v0   # $v0 has the number of vowels counted, save it in $a0

        li      $v0,4            # print first part of the result prompt
        la      $a0,prompt2   
        syscall
        
        move    $a0, $t3         # move the number of vowels saved in $t3 to $a0 for output
        li $v0,1                 #  Enter documentation here
        syscall                  #  Enter documentation here
        
        li      $v0,4            # print second part of the result prompt
        la      $a0,prompt3   
        syscall
        
        jr $ra

################ Exit Program ######################

Exit:
      
        li      $v0,12           # exit     
        syscall
