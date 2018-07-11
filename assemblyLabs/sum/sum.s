    
    .data
	    min: .quad 0 
        max: .quad 0 

    .type sum @function
    .global sum

# from c:
# rdi, rsi, rdx, rcx, r8, r9
# a, b
# rax, eax, ax ,al output
# rbx, ebx, bx, bl
# rcx, ecx, cx, cl
# rdx, edx, dx, dl
    
sum:
   xor %rax,%rax
    cmp %rsi,%rdi # rdi <rsi, a<b
 
    jl a_min  # a rdi min, b rsi  max
    # a max, b min
    jmp suma

suma:
    cmp %rsi, %rdi # max <min
    jl end
    add %rsi,%rax
    inc %rsi
    jmp suma  

a_min:
    cmp %rdi,%rsi
    jl end
    add %rdi,%rax
    inc %rdi
    jmp a_min
end:
    ret




