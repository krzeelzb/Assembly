    
    .data
	    zmienna: .quad 0 

    .type sum_ascii @function
    .global sum_ascii
.text
# from c:
# rdi, rsi, rdx, rcx, r8, r9,r10,r11

# rax, eax, ax ,al output
# rbx, ebx, bx, bl
# rcx, ecx, cx, cl
# rdx, edx, dx, dl
    
sum_ascii:
    xor %rax,%rax
    mov %rsi,%r11
    mov $0,%rbx
    cmp $0,%rcx
    je sum_all
    cmp $1,%rcx
    je sum_num
    cmp $2,%rcx
    je sum_big
    cmp $3,%rcx
   je sum_small
    cmp $4,%rcx
    je sum_letters
sum_all:
    inc %rbx
    cmp $0,(%rdi,%rsi,1)
    je end
    cmp %rdx, %rsi  
    je end
    xor %r9,%r9
    # mov $1,%r11
    mov (%rdi,%rsi,1),%r9b
    add %r9,%r10
    inc %rsi
    jmp sum_all
sum_num:
    cmp $0,(%rdi,%r11,1)
    je end
    cmp %rdx, %r11  
    je end
    xor %r9b,%r9b
    mov (%rdi,%r11,1),%r9b
    cmp $48,%r9b # r9 <48
    jl inc_r11
    cmp $57,%r9b # r9b ?57
    jg inc_r11
    inc %rbx
    add %r9b,%r10b
    inc %r11
    jmp sum_num
inc_r11:
    inc %r11
    jmp sum_num

inc_r11b:
    inc %r11
    jmp sum_big

sum_big:
    cmp $0,(%rdi,%r11,1)
    je end
    cmp %rdx, %r11  
    je end
    xor %r9b,%r9b
    mov (%rdi,%r11,1),%r9b
    cmp $65,%r9b # r9 <48
    jl inc_r11b
    cmp $90,%r9b # r9b ?57
    jg inc_r11b
    inc %rbx
    add %r9b,%r10b
    inc %r11
    jmp sum_big

sum_small:
sum_letters:
    
end:
    mov %r10,%rax
    mov %rbx,(%r8)
    ret


