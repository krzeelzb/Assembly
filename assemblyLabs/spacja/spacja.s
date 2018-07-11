    
    .data
	    zmienna: .quad 0 

    .type spacja @function
    .global spacja

# from c:
# rdi, rsi, rdx, rcx, r8, r9

# rax, eax, ax ,al output
# rbx, ebx, bx, bl
# rcx, ecx, cx, cl
# rdx, edx, dx, dl

.text


spacja:
    mov $-1,%r8
    jmp loop1

loop1: 
    inc %r8
    cmp $0,(%rdi,%r8,1)
    je end
    mov (%rdi,%r8,1),%r10b

    cmp $32,%r10b
    je remove_s

    mov %r10b,(%rdi,%r8,1)

    cmp $1,%rsi
    jne loop1

    cmp $'a',%r10b  # r10
    jl loop1
    cmp $'z',%r10b # r10> 'z'
    jg loop1

    sub $32,%r10b
    MOV %r10b, (%rdi,%r8,1)
    jmp loop1

remove_s:
   ; movq $'z',(%rdi,%r8,1)
   ; ret 
   MOVQ %r8, %r9  # przeniesienie rejstru 
   jmp loop2

loop2:
; # przesuwamy cały string w prawo 
  CMPB $0, (%rdi,%r9,1)
  JE loop1
  INCQ %r9
  MOV (%rdi,%r9,4), %r10
  DECQ %r9
  MOV %r10, (%rdi,%r9,1)
  INCQ %r9
  JMP loop2

end:
  MOVQ %rdi, %rax  # i wypisanie tablicy
  ret


