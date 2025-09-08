.data

userinfo: .asciz "Name: Dani, NetID: dtasadamartinu\nName: Nathan, NetID: ntse\nName of the assignment: 'Powers'\n"
uint_input: .asciz "%lu"
result_fmt: .asciz "result: %lu^%lu = %lu\n"

base_input_fmt: .asciz "input base number: "
exp_input_fmt: .asciz "input exponent: "

base: .quad 0
exp: .quad 0

.text
.global main

main:
	enter $0, $0 # prologue

	mov $userinfo, %rdi
	call printf

	# get use input for base
	mov $base_input_fmt, %rdi
	call printf

	# flush after printf
	mov $0, %rdi
	call fflush

	mov $uint_input, %rdi
	mov $base, %rsi
	call scanf

	# get use input for exp
	mov $exp_input_fmt, %rdi
	call printf

	# flush after printf
	mov $0, %rdi
	call fflush

	# input exponent
	mov $uint_input, %rdi
	mov $exp, %rsi
	call scanf

	# call pow
	mov base(%rip), %rdi # 2 to the power of 3
	mov exp(%rip), %rsi
	call pow

	mov $result_fmt, %rdi # load format string into arg 1
	mov base(%rip), %rsi # load base into arg 2
	mov exp(%rip), %rdx # load exp into arg 3
	mov %rax, %rcx # load result of pow arg 4
	call printf

	leave # epilogue

	# exit
	mov $1, %rdi
	call exit

pow: # base in %rdi, exp in %rsi. return value in %rax

	mov $0, %rcx
	mov $1, %rax # start return value at 1

pow_body:
	# if counter isn't less than exp, break
	cmp %rcx, %rsi
	jle pow_end

	# multiply %rax (result) by %rdi
	mul %rdi

	# increment counter and loop back
	inc %rcx
	jmp pow_body

pow_end:
	ret
