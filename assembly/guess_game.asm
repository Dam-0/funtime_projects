.LC0:
        .string "Guess the age."
.LC1:
        .string "%d"
.LC2:
        .string "Age is lower"
.LC3:
        .string "Age is higher"
.LC4:
        .string "YOU GOT IT"
main:
        push    rbx
        sub     rsp, 16
        call    rand
        mov     ebx, eax
        cdqe
        imul    rax, rax, 1374389535
        mov     edx, ebx
        sar     edx, 31
        sar     rax, 37
        sub     eax, edx
        imul    eax, eax, 100
        sub     ebx, eax
        inc     ebx
.L2:
        mov     edi, 10
        call    putchar
        mov     edi, OFFSET FLAT:.LC0
        call    puts
        xor     eax, eax
        lea     rsi, [rsp+12]
        mov     edi, OFFSET FLAT:.LC1
        call    __isoc99_scanf
        cmp     DWORD PTR [rsp+12], ebx
        jg      .L8
        jl      .L9
        jne     .L2
        mov     edi, OFFSET FLAT:.LC4
        call    puts
        add     rsp, 16
        xor     eax, eax
        pop     rbx
        ret
.L8:
        mov     edi, OFFSET FLAT:.LC2
        call    puts
        jmp     .L2
.L9:
        mov     edi, OFFSET FLAT:.LC3
        call    puts
        jmp     .L2