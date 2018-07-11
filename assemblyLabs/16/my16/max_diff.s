.data
	small: .quad 0 # rezulatat koncowy
    large: .quad 0 

    .type maxdiff @function
    .global maxdiff

   #  rdi, rsi, rdx, rcx, r8, r9
   
maxdiff:
   
    
    cmp %rdi,%rsi   # relacja rsi do rdi
    jl a_more_b  # jesli rsi < rdi
    cmp %rdi,%rdx 
    jl b_more_c
    cmp %rdi,%rcx
    jl c_more_d
    mov %rdi,small
    jmp largest
     

a_more_b:
    cmp %rsi,%rdx
    jl b_more_c
    cmp %rsi,%rcx
    jl c_more_d
    mov %rsi,small
    jmp largest
    
b_more_c:
    cmp %rdx,%rcx
    jl c_more_d
    mov %rdx,small
    jmp largest
    
c_more_d:
    mov %rcx,small
    jmp largest
    
    



largest:
    
    cmp %rdi,%rsi
    jg a_less_b  # czy rsi > rdi,nie to idz dalej, tak nie skocz do a_less_b
    cmp %rdi,%rdx
    jg b_less_c
    cmp %rdi,%rcx
    jg c_less_d
    mov %rdi,large
    jmp final

a_less_b:
    cmp %rsi,%rdx
    jg b_less_c
    cmp %rsi,%rcx
    jg c_less_d
    mov %rsi,large
    jmp final
   
b_less_c:
    cmp %rdx,%rcx
    jg c_less_d
    mov %rdx,large
    jmp final

    
c_less_d:
    mov %rcx,large
    jmp final
    

final:
    mov large,%rbp
    mov small,%rbx

    sub %rbx,%rbp # rbp -rbx, wynik w rbp !!!
    mov %rbp,%rax
    ret

wypisz:
    mov %rbp,%rax
    ret

