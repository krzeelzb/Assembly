    .data
	    zmienna: .quad 0 

    .type range @function
    .global range

# from c:
# rdi, rsi, rdx, rcx, r8, r9
# x,   a,  b,     c

# rax, eax, ax ,al output
# rbx, ebx, bx, bl
# rcx, ecx, cx, cl
# rdx, edx, dx, dl
    

#  int range (int x, int a, int b, int c)
# zawsze a<b<c
# Zwraca 0 gdy x <a
# 1 gdy x >=a i x <b
# 2 gdy x >= b i x< c
# 3 gdy x >= c   

range:
    cmp %rsi,%rdi # czy rdi< rsi, x< a
    jl return_zero
    cmp %rdx,%rdi # czy rdi<rdx, x<b
    jl return_one
    cmp %rcx,%rdi 
    jl return_two
    jmp return_three

return_zero:
    mov $0,%rax
    ret
return_one:
    mov $1,%rax
    ret
return_two:
    mov $2,%rax
    ret
return_three:
    mov $3,%rax
    ret

