    
    .data
	    bit_result: .quad 0 
        counter: .quad 0 

    .type divv @function
    .global divv

# from c:
# rdi, rsi, rdx, rcx, r8, r9

# rax, eax, ax ,al output
# rbx, ebx, bx, bl
# rcx, ecx, cx, cl
# rdx, edx, dx, dl
    
divv:
    cmp $0,%rdx
    je a_b
    mov $1,%r8
    cmp $1,%rdx
    je hard
    
    
a_b:
    mov %rdi,%rax
    div %rsi
    cmp $0,%rdx
    je return_one
    mov $0,%rax
    ret
return_one:
    mov $1,%rax
    ret
hard:
    cmp $64,%r8
    je end
    mov %rdi,%rax
    mov %r8,%rbx
    xor %rdx,%rdx
    div %rbx
    cmp $0,%rdx
    je shift_bit
    inc %r8
    add $1, counter
    jmp hard

shift_bit:
    mov bit_result,%rsi
    mov counter,%cl
    mov $1,%rbx
    shl %cl,%rbx
    or bit_result,%rbx
    mov %rbx,bit_result
    add $1, %r8
    add $1, counter
    jmp hard

end: 
    mov bit_result,%rax
    ret


    # a/ r8
