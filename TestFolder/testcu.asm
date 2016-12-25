  global main
  extern printf
  segment .bss
  a$5 resq 1
  a1$4 resq 1
  a2$3 resq 1
  sum$2 resq 1
  i$1 resq 1
  section .text
main:
  mov rax,1
  push rax
  pop qword[i$1]
  mov rax,0
  push rax
  pop qword[sum$2]
  mov rdi,fmt1
  mov rax,0
  push rbp
  call printf
  pop rbp
L2:
  push qword[i$1]
  mov rax,10
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  jl J2
  mov rax,0
  jmp J3
J2:
  mov rax,1
J3:
  push rax
  pop rax
  cmp rax,0
  je L3
  push qword[i$1]
  mov rax,1
  push rax
call add
push rax
  pop qword[i$1]
  push qword[sum$2]
  push qword[i$1]
call add
push rax
  pop qword[sum$2]
  push qword[i$1]
  push qword[sum$2]
  mov rdi,fmt2
  pop rdx
  pop rsi
  mov rax,0
  push rbp
  call printf
  pop rbp
  jmp L2
L3:
  mov rax,0
  push rax
  pop rax
  ret
add:
  pop r15
  pop qword[a2$3]
  pop qword[a1$4]
  push qword[a1$4]
  push qword[a2$3]
  pop rbx
  pop rax
  add rax, rbx
  push rax
  pop qword[a$5]
  push qword[a$5]
  pop rax
  push r15
  ret
  section .data
  fmt1: db `  i   sum\n`, 0
  fmt2: db `  %ld   %ld\n`, 0
