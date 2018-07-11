    
    .data
	    counter: .quad 0 

    .type binary_op @function
    .global binary_op

# from c:
# rdi, rsi, rdx, rcx, r8, r9

# rax, eax, ax ,al output
# rbx, ebx, bx, bl
# rcx, ecx, cx, cl
# rdx, edx, dx, dl
    
binary_op:
     # mov (%rsi),%r9
     # mov (%rdx),%r10
    # sub $48,%r9
    # sub $48,%r10
    mov $0,%r8
    cmp $0,%rcx
    je _add
    cmp $1,%rcx
    je _and
    cmp $2,%rcx
    je _or
    cmp $3,%rcx
    je _xor
    jmp end

error:
    mov $404,%rdi
    ret

_add:
   
    cmp $0,(%rsi)
    jz end
    cmp $0,(%rdx)
    jz end

    mov (%rsi),%r9
    mov (%rdx),%r10

  #  add $48,%r9
  #  add $48,%r10
    add %r9,%r10

    

    sub $48,%r10

    cmp $'2',%r10
    je _add_zero
  
    mov %r10,(%rdi)
   
    inc %rsi
    inc %rdi
    inc %rdx
    # mov $0,(%rdi)
    jmp _add

_add_zero:
    movq $1,(%rdi)
    inc %rdi
    movq $0,(%rdi)

    inc %rdi
    inc %rsi
    inc %rdx
    # mov $0,(%rdi)
    jmp _add
_and:
    mov (%rsi),%r9
    mov (%rdx),%r10
    and %r9,%r10
   # add $48,%r10
    mov %r10,(%rdi)
    
    jmp end
_or:
    mov (%rsi),%r9
    mov (%rdx),%r10
    or %r9,%r10
    mov %r10,(%rdi)
    jmp end

# rdi, rsi, rdx, rcx, r8, r9
_xor:
    cmp $0,(%rsi)
    je end
    cmp $0,(%rdx)
    je end

    mov (%rsi),%r9
    mov (%rdx),%r10
    sub $48,%r9
    sub $48,%r10
    # add $48,%r9
    # add $48,%r10
     xorq %r9,%r10
    # not %r9
    # and %r9, %r10
   
    mov %r9,(%rdi)

    inc %rsi
    inc %rdi
    inc %rdx
    # mov $0,(%rdi)
    jmp _xor

end:
    # mov %rdi,%rax
    ret
    

