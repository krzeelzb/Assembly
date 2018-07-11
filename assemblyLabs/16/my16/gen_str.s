    
    .data
	    counter: .quad 0 

    .type generate_str @function
    .global generate_str

# from c:
# rdi, rsi, rdx, rcx, r8, r9
# s, c, n, inc 
# rax, eax, ax ,al output
# rbx, ebx, bx, bl
# rcx, ecx, cx, cl
# rdx, edx, dx, dl
    
generate_str:
    mov $0,%r8
    cmp %r8,%rcx 
    je the_same
    cmp $1,%rcx
    je increase

the_same:
    cmp %r8,%rdx # rdx<r8 to end
    jl end
    mov %rsi,(%rdi) # przenoszenie odpowiedniej wartości 
    # na adres pamięci wskazywany przes rsi czyli (*rsi)
    inc %rdi
    inc %r8
    jmp the_same

increase:
   
    cmp %r8,%rdx # rdx<r8 to end
    jl end
    mov %rsi,(%rdi)
    inc %rdi
    inc %r8
    add $1,%rsi
    jmp increase
end:
    inc %rdi
    movb $0,(%rdi) # znak końca stringa
    # mov %rdi,%rax
    ret
    
