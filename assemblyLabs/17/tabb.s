.data
    max: .quad 0

tab:
  .fill 64,4,0
.type check_tab, @function

.globl check_tab

.text

# int* tab		%rdi   tablica
# int n			  %rsi  ilość elementów tablicy 
# int* max		%rdx
# return 		  %eax  

check_tab:
    mov $0,%r8
    jmp find_max
find_max:
    cmp %rsi,%r8  # r8>esi
    jg end
    mov (%rdi,%r8,4),%r10  # element np.2

    cmp $0,%r10 # r10<0
    jl end
    cmp $64,%r10 # r10>64
    jg end

    mov max,%r9 
    cmp %r9, %r10 # r10> max
    jg change_max
    add $1, tab(,%r10,4)
    inc %r8
    jmp find_max

change_max:
 
    mov %r10,max

    incl tab(,%r10,4)
    inc %r8
    jmp find_max 
end:
    mov max,%rbx
    mov %rbx,(%rdx)
    mov %rbx,%rax
    ret


