    
    .data
	    zmienna: .quad 0 

    .type fun @function
    .global fun

# from c:
# rdi, rsi, rdx, rcx, r8, r9
# buf, a,    b
# rax, eax, ax ,al output
# rbx, ebx, bx, bl
# rcx, ecx, cx, cl
# rdx, edx, dx, dl
    
fun:
    cmp $0, (%rsi)
    jz end
    cmp $0, (%rdx)
    jz end
    mov (%rsi),%r8
    mov (%rdx),%r9
    mov %r8,(%rdi)
   
    inc %rdi
    mov %r9,(%rdi)
    inc %rdi
    inc %rdx
    inc %rsi
    jmp  fun

end: 
    # movb $0,(%rdi)
    # mov %rdi,%rax
    ret


