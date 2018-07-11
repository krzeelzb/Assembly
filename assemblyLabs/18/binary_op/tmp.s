.text
	.type binary_op,@function
	.globl binary_op

# rdi - result, rsi - 1, rdx - 2, ecx - n
binary_op:
    mov %rdi, %rax
    xor %r8,%r8
    xor %r9,%r9

# konwersja stringu na liczny    
write_tmp1:
    cmp $0,(%rsi)
    je write_tmp2
    shl $1,%r8 # przesuwamy o jeden w lewo to co było teraz
    cmp $'0',(%rsi)
    je write1_c
    inc %r8
write1_c:
    inc %rsi
    imp write_tmp1
