.data
info: .asciz "Name: Dani, NetID: dtasadamartinu\nName: Nathan, NetID: ntse\nName of the assignment: 'Recursion'\n"
input: .asciz "%lu"
result: .asciz "result: %lu! = %lu\n"
base_input: .asciz "input base number: "
base: .quad 0

.text
.global main
main:
	enter $0, $0

	mov $info, %rdi
	call printf

	mov $base_input, %rdi
	call printf

	mov $0, %rdi
	call fflush

	mov $input, %rdi
	mov $base, %rsi
	call scanf

	mov base(%rip), %rdi 
	call factorial

	mov $result, %rdi
	mov base(%rip), %rsi
	mov %rax, %rdx
	call printf

	leave

	mov $0, %rdi
	call exit 
	
factorial:
	enter $0, $0
	
	cmpq $2, %rdi #check if base 1
	jl factorial_end
	
	push %rdi
	dec %rdi
	
	call factorial

	pop %rdi
	mul %rdi
	
	leave

	ret

factorial_end: 
	mov $1, %rax
	leave
	ret
