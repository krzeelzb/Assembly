    .data
	    min: .quad 0 
        max: .quad 0 
    
    .type is_outside @function
    .global is_outside

 
 # rdi, rsi, rdx, rcx, r8, r9
 # x, a, b
# Funkcja zwraca:
# 1 jeżeli x>max(a,b)
# -1 jeżeli x<min(a,b)
# 0 jeżeli x>=min(a,b) & x<=max(a,b) 
# 3 (czyli po prostu w innym wypadku)
    
is_outside:
    cmp %rsi,%rdx  # czy rdx <rsi, b<a
    jl min_rdx   # wtedy b mniejsze, czyli rdx
    # rdx max
    mov %rdx,max
    mov %rsi, min
    jmp compare
compare:
    mov max,%r9
    mov min,%r8
    cmp  %r9,%rdi # rdi >max to 1
    jg return_one
    cmp %r8,%rdi # rdi<min to -1
    jl return_minus
    jmp return_zero


min_rdx:
    mov %rdx,min
    mov %rsi, max
    jmp compare
   

return_zero:
    mov $0,%rax
    ret
return_minus:
    mov $-1,%rax
    ret
return_one:
    mov $1,%rax
    ret

