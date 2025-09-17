.data

userinfo: .asciz "Name: Dani, NetID: dtasadamartinu\nName: Nathan, NetID: ntse\nName of the assignment: 'Recursion'\n"
uint_input: .asciz "%lu"
result_fmt: .asciz "result: %lu! = %lu\n"

base_input_fmt: .asciz "input base number: "

base: .quad 0

.text
.global main

main:
	# prologue
	push %rbp
	mov %rsp, %rbp 

	# print user info
	mov $userinfo, %rdi
	call printf

	# get user input for base
	mov $base_input_fmt, %rdi # print first part
	call printf

	mov $0, %rdi
	call fflush

	# push %rbp
	mov $uint_input, %rdi
	mov $base, %rsi
	call scanf

	# call factorial
	mov base(%rip), %rdi
	call factorial

	mov $result_fmt, %rdi # load result_fmt into the first argument
	mov base(%rip), %rsi # load the base into the second arg
	mov %rax, %rdx # load the result of factorial into the third arg
	call printf

	# epilogue
	mov %rbp, %rsp
	pop %rbp

	mov $0, %rdi
	call exit

factorial:
	enter $0, $0
	# if base < 2, break
	cmpq $2, %rdi
	jl factorial_ret_1

	# save current base for multiplication
	push %rdi

	# set new base to base - 1
	dec %rdi

	# call factorial(base - 1)
	call factorial

	pop %rsi # restore base into rsi
	mul %rsi # put (base * factorial(base - 1) in rax
	leave
	ret

	# mov %rsp, %rbp # prologue
factorial_ret_1:
	mov $1, %rax
	leave
	ret
