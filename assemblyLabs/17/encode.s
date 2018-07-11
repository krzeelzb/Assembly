.data

  .type encode, @function
  .globl encode


.text

# char* buf		  %rdi
# uint mask			%esi
# int op			  %edx
# int c		      %ecx
# return char*		  %rax
encode:
    mov $-1,%r8
    jmp en

en:
    inc %r8
    cmp $0,(%rdi,%r8,1)
    je end
    cmp $48,(%rdi,%r8,1)
    jl en
    cmp $57,(%rdi,%r8,1)
    jg en

    mov %rsi,%rax
    mov (%rdi,%r8,1),%cl
    subb $48,%cl
    shrl %cl, %rax
    
