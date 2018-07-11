    
    .data
	    zmienna: .quad 0 

    .type spa @function
    .global spa
 
 .text
# from c:
# rdi, rsi, rdx, rcx, r8, r9

# rax, eax, ax ,al output
# rbx, ebx, bx, bl
# rcx, ecx, cx, cl
# rdx, edx, dx, dl
    
spa:
    xor %r8,%r8
    xor %r9,%r9
    jmp loop1
loop1:
    cmp $0,(%rdi,%r8,1)
    je end
    cmp $32,(%rdi,%r8,1)
    je just_incr
    mov (%rdi, %r8, 1), %r10
    mov %r10,(%r9)
    inc %r8
    inc %r9
    jmp loop1

just_incr:
    inc %r8
    jmp loop1
end:
mov %r9, %rax
ret
