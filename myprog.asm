  global main
  extern printf

  segment .bss
  month$1 resq 1
  year$2 resq 1
  day$3 resq 1
  h$4 resq 1
  firstday$7 resq 1
  lastday$6 resq 1
  tmp$8 resq 1
  dday$5 resq 1
  nrows$9 resq 1
  row$10 resq 1
  colday$11 resq 1
  year$12 resq 1
  month$13 resq 1

  section .text
main:
  mov rax,12
  push rax
  pop qword[month$1]
  mov rax,2016
  push rax
  pop qword[year$2]
  push qword[month$1]
  mov rax,1
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J2
  mov rax,0
  jmp J3
J2:
  mov rax,1
J3:
  push rax
  push qword[month$1]
  mov rax,2
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J4
  mov rax,0
  jmp J5
J4:
  mov rax,1
J5:
  push rax
  pop rbx
  pop rax
  or rax, rbx
  push rax
  pop rax
  cmp rax,0
  je L2
  push qword[month$1]
  mov rax,12
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  pop qword[month$1]
  push qword[year$2]
  mov rax,1
  push rax
  pop rbx
  pop rax
  sub rax, rbx
  push rax
  pop qword[year$2]
L2:
  mov rax,1
  push rax
  pop qword[day$3]
  push qword[day$3]
  push qword[month$1]
  mov rax,1
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  mov rax,26
  push rax
  pop rbx
  pop rax
  imul rbx
  push rax
  mov rax,10
  push rax
  mov rdx,0
  pop rbx
  pop rax
  idiv rbx
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  push qword[year$2]
  pop rbx
  pop rax
  add rax, rbx
  push rax
  push qword[year$2]
  mov rax,4
  push rax
  mov rdx,0
  pop rbx
  pop rax
  idiv rbx
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  mov rax,6
  push rax
  push qword[year$2]
  mov rax,100
  push rax
  mov rdx,0
  pop rbx
  pop rax
  idiv rbx
  push rax
  pop rbx
  pop rax
  imul rbx
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  push qword[year$2]
  mov rax,400
  push rax
  mov rdx,0
  pop rbx
  pop rax
  idiv rbx
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  pop qword[h$4]
  push qword[h$4]
  push qword[h$4]
  mov rax,7
  push rax
  mov rdx,0
  pop rbx
  pop rax
  idiv rbx
  push rax
  mov rax,7
  push rax
  pop rbx
  pop rax
  imul rbx
  push rax
  pop rbx
  pop rax
  sub rax, rbx
  push rax
  pop qword[firstday$7]
  push qword[month$1]
  mov rax,12
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  jg J6
  mov rax,0
  jmp J7
J6:
  mov rax,1
J7:
  push rax
  pop rax
  cmp rax,0
  je L3
  push qword[month$1]
  mov rax,12
  push rax
  pop rbx
  pop rax
  sub rax, rbx
  push rax
  pop qword[month$1]
  push qword[year$2]
  mov rax,1
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  pop qword[year$2]
L3:
  mov rax,0
  push rax
  pop qword[lastday$6]
  push qword[month$1]
  mov rax,4
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J8
  mov rax,0
  jmp J9
J8:
  mov rax,1
J9:
  push rax
  push qword[month$1]
  mov rax,6
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J10
  mov rax,0
  jmp J11
J10:
  mov rax,1
J11:
  push rax
  pop rbx
  pop rax
  or rax, rbx
  push rax
  push qword[month$1]
  mov rax,9
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J12
  mov rax,0
  jmp J13
J12:
  mov rax,1
J13:
  push rax
  pop rbx
  pop rax
  or rax, rbx
  push rax
  push qword[month$1]
  mov rax,11
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J14
  mov rax,0
  jmp J15
J14:
  mov rax,1
J15:
  push rax
  pop rbx
  pop rax
  or rax, rbx
  push rax
  pop rax
  cmp rax,0
  je L4
  mov rax,30
  push rax
  pop qword[lastday$6]
  jmp L9
L4:
  push qword[month$1]
  mov rax,2
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  jne J16
  mov rax,0
  jmp J17
J16:
  mov rax,1
J17:
  push rax
  pop rax
  cmp rax,0
  je L5
  mov rax,31
  push rax
  pop qword[lastday$6]
  jmp L8
L5:
  push qword[year$2]
  call leapyear
  push rax
  pop rax
  cmp rax,0
  je L6
  mov rax,29
  push rax
  pop qword[lastday$6]
  jmp L7
L6:
  mov rax,28
  push rax
  pop qword[lastday$6]
L7:
L8:
L9:
  push qword[month$1]
  call printmonth
  push rax
  pop qword[tmp$8]
  mov rdi,fmt1
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,2
  push rax
  push qword[firstday$7]
  pop rbx
  pop rax
  sub rax, rbx
  push rax
  pop qword[dday$5]
  push qword[firstday$7]
  push qword[lastday$6]
  pop rbx
  pop rax
  add rax, rbx
  push rax
  mov rax,7
  push rax
  mov rdx,0
  pop rbx
  pop rax
  idiv rbx
  push rax
  mov rax,1
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  pop qword[nrows$9]
  mov rax,1
  push rax
  pop qword[row$10]
L14:
  push qword[row$10]
  push qword[nrows$9]
  pop rbx
  pop rax
  cmp rax,rbx
  jle J18
  mov rax,0
  jmp J19
J18:
  mov rax,1
J19:
  push rax
  pop rax
  cmp rax,0
  je L15
  mov rax,1
  push rax
  pop qword[colday$11]
L12:
  push qword[colday$11]
  mov rax,7
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  jle J20
  mov rax,0
  jmp J21
J20:
  mov rax,1
J21:
  push rax
  pop rax
  cmp rax,0
  je L13
  push qword[dday$5]
  mov rax,1
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  jl J22
  mov rax,0
  jmp J23
J22:
  mov rax,1
J23:
  push rax
  push qword[dday$5]
  push qword[lastday$6]
  pop rbx
  pop rax
  cmp rax,rbx
  jg J24
  mov rax,0
  jmp J25
J24:
  mov rax,1
J25:
  push rax
  pop rbx
  pop rax
  or rax, rbx
  push rax
  pop rax
  cmp rax,0
  je L10
  mov rdi,fmt2
  mov rax,0
  push rbp
  call printf
  pop rbp
  jmp L11
L10:
  push qword[dday$5]
  mov rdi,fmt3
  pop rsi
  mov rax,0
  push rbp
  call printf
  pop rbp
L11:
  push qword[colday$11]
  mov rax,1
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  pop qword[colday$11]
  push qword[dday$5]
  mov rax,1
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  pop qword[dday$5]
  jmp L12
L13:
  mov rdi,fmt4
  mov rax,0
  push rbp
  call printf
  pop rbp
  push qword[row$10]
  mov rax,1
  push rax
  pop rbx
  pop rax
  add rax, rbx
  push rax
  pop qword[row$10]
  jmp L14
L15:
  mov rdi,fmt5
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  ret
  mov eax, 1
  int 0x80
leapyear:
  pop r15
  pop qword[year$12]
  push qword[year$12]
  mov rax,4
  push rax
  mov rdx,0
  pop rbx
  pop rax
  idiv rbx
  push rax
  mov rax,4
  push rax
  pop rbx
  pop rax
  imul rbx
  push rax
  push qword[year$12]
  pop rbx
  pop rax
  cmp rax,rbx
  jne J26
  mov rax,0
  jmp J27
J26:
  mov rax,1
J27:
  push rax
  pop rax
  cmp rax,0
  je L16
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L16:
  push qword[year$12]
  mov rax,100
  push rax
  mov rdx,0
  pop rbx
  pop rax
  idiv rbx
  push rax
  mov rax,100
  push rax
  pop rbx
  pop rax
  imul rbx
  push rax
  push qword[year$12]
  pop rbx
  pop rax
  cmp rax,rbx
  jne J28
  mov rax,0
  jmp J29
J28:
  mov rax,1
J29:
  push rax
  pop rax
  cmp rax,0
  je L17
  mov rax,1
  push rax
  pop rax
  push r15
  ret
L17:
  push qword[year$12]
  mov rax,400
  push rax
  mov rdx,0
  pop rbx
  pop rax
  idiv rbx
  push rax
  mov rax,400
  push rax
  pop rbx
  pop rax
  imul rbx
  push rax
  push qword[year$12]
  pop rbx
  pop rax
  cmp rax,rbx
  je J30
  mov rax,0
  jmp J31
J30:
  mov rax,1
J31:
  push rax
  pop rax
  cmp rax,0
  je L18
  mov rax,1
  push rax
  pop rax
  push r15
  ret
L18:
  mov rax,0
  push rax
  pop rax
  push r15
  ret
printmonth:
  pop r15
  pop qword[month$13]
  push qword[month$13]
  mov rax,1
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J32
  mov rax,0
  jmp J33
J32:
  mov rax,1
J33:
  push rax
  pop rax
  cmp rax,0
  je L19
  mov rdi,fmt6
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L19:
  push qword[month$13]
  mov rax,2
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J34
  mov rax,0
  jmp J35
J34:
  mov rax,1
J35:
  push rax
  pop rax
  cmp rax,0
  je L20
  mov rdi,fmt7
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L20:
  push qword[month$13]
  mov rax,3
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J36
  mov rax,0
  jmp J37
J36:
  mov rax,1
J37:
  push rax
  pop rax
  cmp rax,0
  je L21
  mov rdi,fmt8
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L21:
  push qword[month$13]
  mov rax,4
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J38
  mov rax,0
  jmp J39
J38:
  mov rax,1
J39:
  push rax
  pop rax
  cmp rax,0
  je L22
  mov rdi,fmt9
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L22:
  push qword[month$13]
  mov rax,5
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J40
  mov rax,0
  jmp J41
J40:
  mov rax,1
J41:
  push rax
  pop rax
  cmp rax,0
  je L23
  mov rdi,fmt10
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L23:
  push qword[month$13]
  mov rax,6
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J42
  mov rax,0
  jmp J43
J42:
  mov rax,1
J43:
  push rax
  pop rax
  cmp rax,0
  je L24
  mov rdi,fmt11
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L24:
  push qword[month$13]
  mov rax,7
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J44
  mov rax,0
  jmp J45
J44:
  mov rax,1
J45:
  push rax
  pop rax
  cmp rax,0
  je L25
  mov rdi,fmt12
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L25:
  push qword[month$13]
  mov rax,8
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J46
  mov rax,0
  jmp J47
J46:
  mov rax,1
J47:
  push rax
  pop rax
  cmp rax,0
  je L26
  mov rdi,fmt13
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L26:
  push qword[month$13]
  mov rax,9
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J48
  mov rax,0
  jmp J49
J48:
  mov rax,1
J49:
  push rax
  pop rax
  cmp rax,0
  je L27
  mov rdi,fmt14
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L27:
  push qword[month$13]
  mov rax,10
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J50
  mov rax,0
  jmp J51
J50:
  mov rax,1
J51:
  push rax
  pop rax
  cmp rax,0
  je L28
  mov rdi,fmt15
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L28:
  push qword[month$13]
  mov rax,11
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J52
  mov rax,0
  jmp J53
J52:
  mov rax,1
J53:
  push rax
  pop rax
  cmp rax,0
  je L29
  mov rdi,fmt16
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L29:
  push qword[month$13]
  mov rax,12
  push rax
  pop rbx
  pop rax
  cmp rax,rbx
  je J54
  mov rax,0
  jmp J55
J54:
  mov rax,1
J55:
  push rax
  pop rax
  cmp rax,0
  je L30
  mov rdi,fmt17
  mov rax,0
  push rbp
  call printf
  pop rbp
  mov rax,0
  push rax
  pop rax
  push r15
  ret
L30:
  mov rax,1
  push rax
  pop rax
  push r15
  ret

  section .data
  fmt1: db `Su Mo Tu We Th Fr Sa\n`, 0
  fmt2: db `   `, 0
  fmt3: db `%2d `, 0
  fmt4: db `\n`, 0
  fmt5: db `\n`, 0
  fmt6: db `       January\n`, 0
  fmt7: db `      February\n`, 0
  fmt8: db `        March\n`, 0
  fmt9: db `        April\n`, 0
  fmt10: db `         May\n`, 0
  fmt11: db `        June\n`, 0
  fmt12: db `        July\n`, 0
  fmt13: db `       August\n`, 0
  fmt14: db `      September\n`, 0
  fmt15: db `       October\n`, 0
  fmt16: db `      November\n`, 0
  fmt17: db `      December\n`, 0
