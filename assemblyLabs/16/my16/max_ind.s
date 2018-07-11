.data
	small: .quad 0 # rezulatat koncowy
    large: .quad 0 
    counter:  .quad 1

    .type max_ind @function
    .global max_ind

   #  rdi, rsi, rdx, rcx, r8, r9
   
max_ind:
    cmp %rdi,%rsi
    jg a_less_b  # czy rsi > rdi,nie to idz dalej, tak nie skocz do a_less_b
    cmp %rdi,%rdx
    jg b_less_c
    cmp %rdi,%rcx
    jg c_less_d
    mov %rdi,large
    jmp final

a_less_b:
    add $1,counter
    cmp %rsi,%rdx
    jg b_less_c
    cmp %rsi,%rcx
    jg c_less_d
    mov %rsi,large
    jmp final
   
b_less_c:
    add $1,counter
    cmp %rdx,%rcx
    jg c_less_d
    mov %rdx,large
    jmp final

    
c_less_d:
    add $1,counter
    mov %rcx,large
    jmp final
    

final:  
    # rdi, rsi, rdx, rcx,
    mov large,%r8
    cmp %r8,%rdi
    je add_counter
    cmp %r8,%rsi
    je add_counter
    cmp %r8,%rsi
    je add_counter
    cmp %r8,%rsi
    je add_counter


    mov counter,%rax
    ret

add_counter:
    mov $0,%rax
    ret
    

