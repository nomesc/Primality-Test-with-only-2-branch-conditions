.data
 n:.word 9              #your number
 x:.space 1             #answer
.text
main:
 lw $t0,n		#$t0=n
 li $t2,2               #$t2=2  d
 div $t0,$t2
 mflo $t1               #$t1=n/2
 li $t4,1               #$t4=1  resturile

#loop

entry:
 bge $t2,$t1,exit1
 div $t0,$t2  
 mfhi $t3
 mult $t4,$t3
 mflo $t4
 addi $t2,1
j entry

exit1:
 li $t7,1
 sub $t6,$t0,$t7           #$t6=n-1
 mult $t0,$t6
 mflo $t7              #$t7=n*(n-1)
 mult $t7,$t4
 mflo $t7              #$t7=n*(n-1)*resturi
 beq $t7,$zero,neprim
 li $t6,1
 sb $t6,x
 j exit2

neprim:
 sb $zero,x


 li $v0,10
 syscall