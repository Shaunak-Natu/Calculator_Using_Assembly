;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%include "util.asm"
GLOBAL _start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

_start:

	mov rax,1
	mov rdi,1
	mov rsi,welcome_msg
	mov rdx,len_welcome_msg
	syscall

numbers_input:
	mov rax,1
	mov rdi,1
	mov rsi,num_a_input_msg
	mov rdx,len_num_a_input_msg
	syscall

	call readint
	mov [num_a],rax

	mov rax,1
	mov rdi,1
	mov rsi,num_b_input_msg
	mov rdx,len_num_b_input_msg
	syscall

	call readint
	mov [num_b],rax

instructions_label:
	mov rax,1
	mov rdi,1
	mov rsi,instructions
	mov rdx,len_instructions
	syscall

	mov rax,1
	mov rdi,1
	mov rsi,question
	mov rdx,len_question
	syscall

input_answer:
	call readint
	mov [answer],rax

	mov rbx,[answer]
	cmp rbx,1
	je ADD
	cmp rbx,2
	je SUB
	cmp rbx,3
	je MUL 
	cmp rbx,4
	je DIV 

ADD:
	mov rax,1
	mov rdi,1
	mov rsi,calc_answer
	mov rdx,len_calc_answer
	syscall

	mov rax,[num_a]
	add rax,[num_b]
	mov rdi,rax
	call printint
	jmp continue_or_not

SUB:
	mov rax,1
	mov rdi,1
	mov rsi,calc_answer
	mov rdx,len_calc_answer
	syscall

	mov rax,[num_a]
	sub rax,[num_b]
	mov rdi,rax
	call printint
	jmp continue_or_not

MUL:
	mov rax,1
	mov rdi,1
	mov rsi,calc_answer
	mov rdx,len_calc_answer
	syscall

	mov rax,[num_a]
	imul rax,[num_b]
	mov rdi,rax
	call printint
	jmp continue_or_not

DIV:
	mov rax,1
	mov rdi,1
	mov rsi,calc_answer
	mov rdx,len_calc_answer
	syscall

	mov rdx,0
	mov rax,[num_a]
	mov rbx,[num_b]
	idiv rbx
	mov rdi,rax
	call printint
	jmp continue_or_not

continue_or_not:
	mov rax,1
	mov rdi,1
	mov rsi,continue
	mov rdx,len_continue
	syscall

	call readint
	mov [cont],rax

	mov rbx,[cont]
	cmp rbx,1
	je numbers_input

	mov rbx,[cont]
	cmp rbx,0
	je exit_label

exit_label:
	mov rax,60
	mov rdi,0
	syscall

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .data

	question: db "Select an Operation: ",
	len_question: equ $-question

	instructions: db 10,"Enter For Operation",10,"1     -->  +",10, "2     -->  -",10, "3     -->  *",10, "4     -->  /",10,10
	len_instructions: equ $-instructions

	welcome_msg: db 10,"=======================================Welcome to the Calculator=======================================",10,10,"Please enter numbers below: -",10
	len_welcome_msg: equ $-welcome_msg

	num_a_input_msg: db 10,"Enter Number a: "
	len_num_a_input_msg: equ $-num_a_input_msg

	num_b_input_msg: db "Enter Number b: "
	len_num_b_input_msg: equ $-num_b_input_msg

	continue: db 10,10,"Do you wish to continue[1 for YES or 0 for NO]: "
	len_continue: equ $-continue

	calc_answer: db "Answer = "
	len_calc_answer: equ $-calc_answer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
section .bss
        answer: resb 8
        num_a: resb 100
        num_b: resb 100
        num_c: resb 100
        cont: resb 8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
