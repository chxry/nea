start:
  mov %r6, 44 ; ','
  mov %r2, 0
  mov %r3, 1
  mov %r4, 0
  
  loop:
    mov %r1, %r2
    add %ra, %pc, 4
    jmp print_int

    sb %r6, 0xf002

    add %r5, %r3, %r2
    mov %r2, %r3
    mov %r3, %r5

    inc %r4
    cmp %r4, 24 ; print the first 24 terms
    jgt loop

  hlt
  jmp start

; write %r1 to the serial port, clobbers %r7-8
print_int:
  mov %r8, %sp
  conv_loop:
    rem %r7, %r1, 10
    add %r7, %r7, 48
    div %r1, %r1, 10
    
    sub %sp, %sp, 1
    sb %r7, %sp

    cmp %r1, 0
    jne conv_loop

  output_loop:
    lb %r7, %sp
    sb %r7, 0xf002
    add %sp, %sp, 1
  
    cmp %r8, %sp
    jne output_loop

  jmp %ra
