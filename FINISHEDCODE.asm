#developed by Ahmed, Eshaan and Paul
#completed 5/12/23

define:
	.eqv PIXBUFFER 65536
	.eqv PIXCOUNT 16384

.text

.globl main

main:

jal p6_ppm_loader

jal load_pixel_starts

la $a0, district_prompt
la $a1, district_name
la $a2, 36
jal stringInputBox


#########################################################################

la $a0, school_1_prompt
la $a1, school_1_name
li $a2, 36
jal stringInputBox

la $a0, school_2_prompt
la $a1, school_2_name
li $a2, 36
jal stringInputBox

la $a0, school_3_prompt
la $a1, school_3_name
li $a2, 36
jal stringInputBox

la $a0, school_4_prompt
la $a1, school_4_name
li $a2, 36
jal stringInputBox


#################################################################

la $a0, laptop_prompt
jal intInputBox
sw $v0, material_counters
sw $v0, waste

la $a0, textbook_prompt
jal intInputBox
sw $v0, material_counters+4
sw $v0, waste + 4

la $a0, notebook_prompt
jal intInputBox
sw $v0, material_counters+8
sw $v0, waste + 8

la $a0, pencils_prompt
jal intInputBox
sw $v0, material_counters+12
sw $v0, waste + 12


#add up all numbers in material counters array
#divide total by 167, the floor of this value is the material to pixel ratio
#pass the ceil material allocation number divided by the resource ratio
jal calculaterpp
move $s0, $v0



#laptops
la $a0, laptop_remain
lw $a1, waste
la $a2, school_1_mats
jal input_materials
sw $v0, waste
sw $v1, laptop_allocations
li $a0, 0
li $a1, 0x001148D4
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, laptop_remain
lw $a1, waste
la $a2, school_2_mats
jal input_materials
sw $v0, waste
sw $v1, laptop_allocations + 4
li $a0, 4
li $a1, 0x001148D4
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, laptop_remain
lw $a1, waste
la $a2, school_3_mats
jal input_materials
sw $v0, waste
sw $v1, laptop_allocations + 8
li $a0, 8
li $a1, 0x001148D4
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, laptop_remain
lw $a1, waste
la $a2, school_4_mats
jal input_materials
sw $v0, waste
sw $v1, laptop_allocations + 12
li $a0, 12
li $a1, 0x001148D4
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

#textbook
la $a0, textbook_remain
lw $a1, waste + 4
la $a2, school_1_mats
jal input_materials
sw $v0, waste + 4
sw $v1, textbook_allocations
li $a0, 0
li $a1, 0x00F20808
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, textbook_remain
lw $a1, waste + 4
la $a2, school_2_mats
jal input_materials
sw $v0, waste + 4
sw $v1, textbook_allocations + 4
li $a0, 4
li $a1, 0x00F20808
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, textbook_remain
lw $a1, waste + 4
la $a2, school_3_mats
jal input_materials
sw $v0, waste + 4
sw $v1, textbook_allocations + 8
li $a0, 8
li $a1, 0x00F20808
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, textbook_remain
lw $a1, waste + 4
la $a2, school_4_mats
jal input_materials
sw $v0, waste + 4
sw $v1, textbook_allocations + 12
li $a0, 12
li $a1, 0x00F20808
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

#notebook
la $a0, notebook_remain
lw $a1, waste + 8
la $a2, school_1_mats
jal input_materials
sw $v0, waste + 8
sw $v1, notebook_allocations
li $a0, 0
li $a1, 0x00EEF211
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, notebook_remain
lw $a1, waste + 8
la $a2, school_2_mats
jal input_materials
sw $v0, waste + 8
sw $v1, notebook_allocations + 4
li $a0, 4
li $a1, 0x00EEF211
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, notebook_remain
lw $a1, waste + 8
la $a2, school_3_mats
jal input_materials
sw $v0, waste + 8
sw $v1, notebook_allocations + 8
li $a0, 8
li $a1, 0x00EEF211
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, notebook_remain
lw $a1, waste + 8
la $a2, school_4_mats
jal input_materials
sw $v0, waste + 8
sw $v1, notebook_allocations + 12
li $a0, 12
li $a1, 0x00EEF211
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

#pencil
la $a0, pencil_remain
lw $a1, waste + 12
la $a2, school_1_mats
jal input_materials
sw $v0, waste + 12
sw $v1, pencil_allocations
li $a0, 0
li $a1, 0x00C66EE6
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, pencil_remain
lw $a1, waste + 12
la $a2, school_2_mats
jal input_materials
sw $v0, waste + 12
sw $v1, pencil_allocations + 4
li $a0, 4
li $a1, 0x00C66EE6
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, pencil_remain
lw $a1, waste + 12
la $a2, school_3_mats
jal input_materials
sw $v0, waste + 12
sw $v1, pencil_allocations + 8
li $a0, 8
li $a1, 0x00C66EE6
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

la $a0, pencil_remain
lw $a1, waste + 12
la $a2, school_4_mats
jal input_materials
sw $v0, waste + 12
sw $v1, pencil_allocations + 12
li $a0, 12
li $a1, 0x00C66EE6
div $a2, $v1, $s0
addi $a2, $a2, 1
jal append_pixel

###########################################################

li $v0, 13
la $a0, output_file
li $a1, 1
syscall
move $s1, $v0

#$a0 is nothing		$a1 is string 		$a2 is string length
la $a1, district_name_message
jal output_string

la $a1, district_name
jal output_string

la $a1, shipping_manifest_message
jal output_string


la $a1, newline
jal output_string


la $a1, newline
jal output_string


la $a1, newline
jal output_string


##

la $a1, school_name_message
jal output_string

la $a1, school_1_name
jal output_string

la $a1, newline
jal output_string

la $a1, laptop_consumed_message
jal output_string

lw $a0, laptop_allocations
jal output_integer

la $a1, newline
jal output_string

la $a1, textbook_consumed_message
jal output_string

lw $a0, textbook_allocations
jal output_integer

la $a1, newline
jal output_string

la $a1, notebook_consumed_message
jal output_string

lw $a0, notebook_allocations
jal output_integer

la $a1, newline
jal output_string

la $a1, pencil_consumed_message
jal output_string

lw $a0, pencil_allocations
jal output_integer


la $a1, newline
jal output_string


la $a1, newline
jal output_string


##

la $a1, school_name_message
jal output_string

la $a1, school_2_name
jal output_string

la $a1, newline
jal output_string

la $a1, laptop_consumed_message
jal output_string

lw $a0, laptop_allocations + 4
jal output_integer

la $a1, newline
jal output_string

la $a1, textbook_consumed_message
jal output_string

lw $a0, textbook_allocations + 4
jal output_integer

la $a1, newline
jal output_string

la $a1, notebook_consumed_message
jal output_string

lw $a0, notebook_allocations + 4
jal output_integer

la $a1, newline
jal output_string

la $a1, pencil_consumed_message
jal output_string

lw $a0, pencil_allocations + 4
jal output_integer


la $a1, newline
jal output_string


la $a1, newline
jal output_string


##

la $a1, school_name_message
jal output_string

la $a1, school_3_name
jal output_string

la $a1, newline
jal output_string

la $a1, laptop_consumed_message
jal output_string

lw $a0, laptop_allocations + 8
jal output_integer

la $a1, newline
jal output_string

la $a1, textbook_consumed_message
jal output_string

lw $a0, textbook_allocations + 8
jal output_integer

la $a1, newline
jal output_string

la $a1, notebook_consumed_message
jal output_string

lw $a0, notebook_allocations + 8
jal output_integer

la $a1, newline
jal output_string

la $a1, pencil_consumed_message
jal output_string

lw $a0, pencil_allocations + 8
jal output_integer


la $a1, newline
jal output_string


la $a1, newline
jal output_string


##

la $a1, school_name_message
jal output_string

la $a1, school_4_name
jal output_string

la $a1, newline
jal output_string

la $a1, laptop_consumed_message
jal output_string

lw $a0, laptop_allocations + 12
jal output_integer

la $a1, newline
jal output_string

la $a1, textbook_consumed_message
jal output_string

lw $a0, textbook_allocations + 12
jal output_integer

la $a1, newline
jal output_string

la $a1, notebook_consumed_message
jal output_string

lw $a0, notebook_allocations + 12
jal output_integer

la $a1, newline
jal output_string

la $a1, pencil_consumed_message
jal output_string

lw $a0, pencil_allocations + 12
jal output_integer

la $a1, newline
jal output_string

la $a1, newline
jal output_string

la $a1, laptop_waste_message
jal output_string

lw $a0, waste
jal output_integer

la $a1, newline
jal output_string

la $a1, textbook_waste_message
jal output_string

lw $a0, waste + 4
jal output_integer

la $a1, newline
jal output_string

la $a1, notebook_waste_message
jal output_string

lw $a0, waste + 8
jal output_integer

la $a1, newline
jal output_string

la $a1, pencil_waste_message
jal output_string

lw $a0, waste + 12
jal output_integer





###########################################################
system_end:
jal closingjingle
li $v0, 10
syscall


###########################################################
closingjingle:
	
	li $a0 88	#argument register a0 is for pitch
	li $a1 1000	#argument register is for duration (1000 is 1 second)
	li $a2 1	#argument register a2 is for instrument
	li $a3 100	#argument register a3 is for volume
	li $v0 31	#code in $v0
	syscall
	#88
	
	li $a0 750
	li $v0 32
	syscall

	li $a0 85	#argument register a0 is for pitch
	li $a1 1000	#argument register is for duration (1000 is 1 second)
	li $a2 1	#argument register a2 is for instrument
	li $a3 100	#argument register a3 is for volume
	li $v0 31	#code in $v0
	syscall
	#85
	
jr $ra
	
############################################################

#params $a0 = string
#params $a1 = result string
#params $a2 = maxchars
stringInputBox:

	move $t5, $a1

	li $t0, 0			#consts
	li $t1, -1
	li $t2, -2
	li $t3, -3
	li $v0, 54

	syscall
	beq $a1, $t0, sib_return
	beq $a1, $t1, sib_default
	beq $a1, $t2, system_end
	beq $a1, $t3, sib_default

sib_default:

	la $t4, default_string

sib_loop_copy:
	lb $t6, 0($t4)        # Load a byte from default_string
	sb $t6, 0($t5)        # Store the byte in the buffer
	beqz $t6, sib_end_copy    # If null character is encountered, break the loop
	addi $t4, $t4, 1      # Move to the next byte in default_string
	addi $t5, $t5, 1      # Move to the next byte in the buffer
	j sib_loop_copy
sib_end_copy:

sib_return:
jr $ra

###########################################################################

#params $a0 = string
intInputBox:
	li $t0, 0			#consts
	li $t1, -1
	li $t2, -2
	li $t3, -3
	li $v0, 51

	syscall
	beq $a1, $t0, iib_return
	beq $a1, $t1, iib_default
	beq $a1, $t2, system_end
	beq $a1, $t3, iib_default

iib_default:
	move $v0, $zero
jr $ra


iib_return:
	abs $v0, $a0
	#move $v0, $a0
jr $ra


#################################################################################3

p6_ppm_loader:

	# METADATA REMOVER

	li $v0, 13			# open image ppm
	la $a0, file_name		# image ppm path
	li $a1, 0			# read mode
	li $a2, 0			# ignored
	syscall				

	move $t3, $v0			# saving file descriptor

	li $v0, 14			# reading from file
	move $a0, $t3			# file descriptor
	la $a1, metadata		# buffer 
	la $a2, 14			# number of bytes
	syscall			
	
	#t3 FILE DESCRIPTOR
	#t4 WORKING COLOR REGISTER
	
	li $t0, 0x10010000	#display address
	li $t1, 0
	li $t2, PIXCOUNT
	

parse_pixel_loop:
	
	li $v0, 14			# read 1 color pixel
	move $a0, $t3			# file descriptor
	la $a1, colorbuf		# save to color buffer
	li $a2, 3			# 3 bytes for rgb
	syscall

	li $t4, 0x00000000		# working color register
	
	lb $t5, colorbuf		# colorbyte R
	sll $t5, $t5, 16		
	li $t6, 0x00FF0000		# mask
	and $t5, $t5, $t6
	or $t4, $t4, $t5
	
	lb $t5, colorbuf+1		# colorbyte G
	sll $t5, $t5, 8			
	li $t6, 0x0000FF00		# mask
	and $t5, $t5, $t6
	or $t4, $t4, $t5
	
	lb $t5, colorbuf+2		# colorbyte B
	li $t6, 0x000000FF		# mask
	and $t5, $t5, $t6
	or $t4, $t4, $t5
	
	sw $t4, ($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	
	beq $t1, $t2, parse_pixel_end
	j parse_pixel_loop
	
parse_pixel_end:	

	#close file	
	li $v0, 16
	move $a0, $t3
	syscall

jr $ra


#######################################################################

#a0 is the string stating remaining values
#a1 is the total number of the resource getting allocated this call
#a2 is the school string ie school1 school2
input_materials:
	li $t0, 0			#consts
	li $t1, -1
	li $t2, -2
	li $t3, -3
	
	move $t4, $a0	#t4 is string stating remaing resource
	move $t5, $a1	#t5 is the remaining resource
	move $t6, $a2	#t6 is the school number
	
mib_loop:	
	move $a0, $t4
	move $a1, $t5
	li $v0, 56
	syscall

	li $v0, 51
	move $a0, $t6
	syscall
	abs $a0, $a0
	bgt $a0, $t5, mib_overflow
	beq $a1, $t0, mib_return
	beq $a1, $t1, mib_default
	beq $a1, $t2, system_end
	beq $a1, $t3, mib_default
	
	
mib_default:
	move $v0, $t5
	move $v1, $zero
	jr $ra
	
mib_overflow:
	li $v0, 55
	la $a0, warning_exceed
	li $a1, 0
	syscall
	j mib_loop
	
mib_return:
	abs $a0, $a0
	sub $v0, $t5, $a0
	move $v1, $a0
jr $ra

###############################################################################

load_pixel_starts:

	li $t0, 0x10010000

	addi $t1, $t0, 4192
	sw $t1, pixel_starts

	addi $t1, $t0, 20576
	sw $t1, pixel_starts + 4

	addi $t1, $t0, 36960
	sw $t1, pixel_starts + 8

	addi $t1, $t0, 53344
	sw $t1, pixel_starts + 12
	
	sw $zero, append_counters
	sw $zero, append_counters+4
	sw $zero, append_counters+8
	sw $zero, append_counters+12
	
	
jr $ra

##############################################################################

#$a0 enum 0, 4, 8, or 12 for school 1, 2, 3 or 4
#$a1 color
#$a2 number of pixel columbs to add
append_pixel:

	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	
	lw $t3, pixel_starts($t0)
	lw $t4, append_counters($t0)
	
	add $t3, $t3, $t4
	li $t6, 0
	#t3 now contains the starting value for the current pixel
	#save color to it and the five below it, then iterate t3 by 4
	
ap_loop:

	move $t5, $t3
	
	sw $t1, ($t5)
	addi $t5, $t5, 1024
	sw $t1, ($t5)
	addi $t5, $t5, 1024
	sw $t1, ($t5)
	addi $t5, $t5, 1024
	sw $t1, ($t5)
	addi $t5, $t5, 1024
	sw $t1, ($t5)
	addi $t5, $t5, 1024
	sw $t1, ($t5)
	
	addi $t3, $t3, 4
	addi $t6, $t6, 4
	
	addi $t2, $t2, -1
	
	bne $t2, $zero, ap_loop
	
	add $t6, $t4, $t6
	sw $t6, append_counters($t0)
	
jr $ra


#################################################################

calculaterpp:
	lw $t0, material_counters
	lw $t1, material_counters + 4
	lw $t2, material_counters + 8
	lw $t3, material_counters + 12
	
	add $v0, $t0, $t1
	add $v0, $v0, $t2
	add $v0, $v0, $t3
	
	div $v0, $v0, 167
	addi $v0, $v0, 1		#adding 1 to prevent overflow (auto rounds down causing ratio to overflow bar)

jr $ra


################################################################################
output_integer:

la $a1, printbuf + 31
sb $zero, ($a1)
li $a2, 0

oi_loop:
li $t0, 10
remu $t1, $a0, $t0
addi $t1, $t1, 48
addi $a1, $a1, -1
addi $a2, $a2, 1
sb $t1, ($a1)

div $a0, $a0, $t0
bnez $a0, oi_loop

move $a0, $s1
li $v0, 15
syscall

jr $ra

################################################################################
#$a0 is nothing		$a1 is string 		$a2 is string length
output_string:

move $t0, $a1
li $t1, 0

os_loop:

	lb $t2, ($t0)
	beqz $t2, os_end
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	j os_loop
	
os_end:

	move $a2, $t1

	li $v0, 15
	move $a0, $s1
	syscall
jr $ra
###############################################################################



.data


image_buffer: .space PIXBUFFER

metadata: .space 16
colorbuf: .space 4
printbuf: .space 32

material_counters: .space 16

pixel_starts: .space 16
append_counters: .space 16

laptop_allocations: .space 16
textbook_allocations: .space 16
notebook_allocations: .space 16
pencil_allocations: .space 16

school_1_name: .space 36
school_2_name: .space 36
school_3_name: .space 36
school_4_name: .space 36
district_name: .space 36

waste: .space 16

#####################################################################################

file_name: .asciiz "C:\\Users\\email\\Sync\\SP23\\CS118\\GroupLab\\team-project-invalid_string\\image.ppm"
#file_name: .asciiz "/home/aek/Sync/SP23/CS118/GroupLab/team-project-invalid_string/image.ppm"
#file_name: .asciiz "C:\\Users\\eshaa\\OneDrive\\Desktop\\MARS MIPS programs\\team-project-invalid_string\\image.ppm"
output_file: .asciiz "C:\\Users\\email\\Sync\\SP23\\CS118\\GroupLab\\team-project-invalid_string\\output.txt"
file_mode: .asciiz "w"

default_string: .asciiz "invalid_string"

laptop_prompt: .asciiz "Number of laptops in stock: "
textbook_prompt: .asciiz "Number of textbooks in stock: "
notebook_prompt: .asciiz "Number of notebooks in stock: "
pencils_prompt: .asciiz "Number of pencils in stock: "

district_prompt: .asciiz "What is the name of this district: "
school_1_prompt: .asciiz "First school name: "
school_2_prompt: .asciiz "Second school name: "
school_3_prompt: .asciiz "Third school name: "
school_4_prompt: .asciiz "Fourth school name: "

school_1_mats: .asciiz "Please allocate some of these materials to school 1: "
school_2_mats: .asciiz "Please allocate some of these materials to school 2: "
school_3_mats: .asciiz "Please allocate some of these materials to school 3: "
school_4_mats: .asciiz "Please allocate some of these materials to school 4: "

laptop_remain: .asciiz "You have this many laptops remaining: "
textbook_remain: .asciiz "You have this many textbooks remaining: "
notebook_remain: .asciiz "You have this many notebooks remaining: "
pencil_remain: .asciiz "You have this many pencils remaining: "

warning_exceed: .asciiz "You have exceeded materials that you have in stock!"

district_name_message: .asciiz "District Name: "
shipping_manifest_message: .asciiz "Shipping Manifest"
school_name_message: .asciiz "School Name: "
newline: .asciiz "\n"

laptop_consumed_message: .asciiz "Laptops given to this school: "	#23 default + material name
textbook_consumed_message: .asciiz "Textbooks given to this school: "
notebook_consumed_message: .asciiz "Notebooks given to this school: "
pencil_consumed_message: .asciiz "Pencils given to this school: "

laptop_waste_message: .asciiz "Laptops wasted: "
textbook_waste_message: .asciiz "Textbooks wasted: "
notebook_waste_message: .asciiz "Notebooks wasted: "
pencil_waste_message: .asciiz "Pencils wasted: "



