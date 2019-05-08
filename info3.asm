
SECTION .text   

toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     edi, 32
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax+8H]
        mov     rax, qword [rbp-18H]
        mov     rdx, rax
        lea     rsi, [rel L_006]
        mov     rdi, rcx
        mov     eax, 0
        call    sprintf
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-8H]
        leave
        ret


print:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rax
        lea     rdi, [rel L_007]
        mov     eax, 0
        call    printf
        nop
        leave
        ret


println:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rdi, rax
        call    puts
        nop
        leave
        ret


fifib:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 24
        mov     qword [rbp-18H], rdi
        cmp     qword [rbp-18H], 0
        jnz     L_001
        mov     eax, 1
        jmp     L_003

L_001:  cmp     qword [rbp-18H], 1
        jnz     L_002
        mov     eax, 1
        jmp     L_003

L_002:  mov     rax, qword [rbp-18H]
        sub     rax, 1
        mov     rdi, rax
        call    fifib
        mov     rbx, rax
        mov     rax, qword [rbp-18H]
        sub     rax, 2
        mov     rdi, rax
        call    fifib
        add     rax, rbx
L_003:  add     rsp, 24
        pop     rbx
        pop     rbp
        ret
		
mallocx8:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     rax, qword [rbp-18H]
        add     rax, 2
        shl     rax, 3
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-18H]
        lea     rdx, [rax-1H]
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-8H]
        leave
        ret

		
		
		
;mallocx8:
;        push    rbp
;        mov     rbp, rsp
;        sub     rsp, 32
;        mov     qword [rbp-18H], rdi
;        mov     rax, qword [rbp-18H]
;        add     rax, 2
;        shl     rax, 3
;        mov     rdi, rax
;        call    malloc
;        mov     qword [rbp-8H], rax
 ;       mov     rax, qword [rbp-8H]
 ;       mov     rdx, qword [rbp-18H]
 ;       mov     qword [rax], rdx
 ;       mov     rax, qword [rbp-8H]
 ;       leave
 ;       ret



;mallocx8:
;        push    rbp
;        mov     rbp, rsp
;        sub     rsp, 32
;        mov     qword [rbp-18H], rdi
;        mov     rax, qword [rbp-18H]
;        add     rax, 2
;        shl     rax, 3
;        mov     rdi, rax
;        call    malloc
;        mov     qword [rbp-8H], rax
;        mov     rax, qword [rbp-8H]
;        leave
;        ret


parseInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi


        mov     rax, qword [fs:abs 28H]
        mov     qword [rbp-8H], rax
        xor     eax, eax
        mov     rax, qword [rbp-18H]
        lea     rcx, [rax+8H]
        lea     rax, [rbp-10H]
        mov     rdx, rax
        lea     rsi, [rel L_006]
        mov     rdi, rcx
        mov     eax, 0
        call    __isoc99_sscanf
        mov     rax, qword [rbp-10H]
        mov     rdx, qword [rbp-8H]


        xor     rdx, qword [fs:abs 28H]
        jz      L_004
        call    __stack_chk_fail
L_004:  leave
        ret


str_add:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-20H], rsi
        mov     rax, qword [rbp-18H]
        mov     rdx, qword [rax]
        mov     rax, qword [rbp-20H]
        mov     rax, qword [rax]
        add     rax, rdx
        mov     qword [rbp-10H], rax
        mov     rax, qword [rbp-10H]
        add     rax, 16
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        mov     rdx, qword [rbp-10H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-18H]
        mov     rax, qword [rax]
        mov     rdx, rax
        mov     rax, qword [rbp-18H]
        lea     rcx, [rax+8H]
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rcx
        mov     rdi, rax
        call    memcpy
        mov     rax, qword [rbp-20H]
        mov     rax, qword [rax]
        mov     rsi, rax
        mov     rax, qword [rbp-20H]
        lea     rcx, [rax+8H]
        mov     rax, qword [rbp-8H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-18H]
        mov     rax, qword [rax]
        add     rax, rdx
        mov     rdx, rsi
        mov     rsi, rcx
        mov     rdi, rax
        call    memcpy
        mov     rax, qword [rbp-8H]
        leave
        ret


str_le:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setle   al
        movzx   eax, al
        leave
        ret


str_ge:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        not     eax
        shr     eax, 31
        movzx   eax, al
        leave
        ret


str_l:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        shr     eax, 31
        movzx   eax, al
        leave
        ret


str_g:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setg    al
        movzx   eax, al
        leave
        ret


str_e:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        sete    al
        movzx   eax, al
        leave
        ret


str_ne:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setne   al
        movzx   eax, al
        leave
        ret


getString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rsi, [rel __buffer_cache__]
        lea     rdi, [rel L_008]
        mov     eax, 0
        call    __isoc99_scanf
        lea     rdi, [rel __buffer_cache__]
        call    strlen
        mov     qword [rbp-10H], rax
        mov     rax, qword [rbp-10H]
        add     rax, 16
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        mov     rdx, qword [rbp-10H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-10H]
        mov     rdx, qword [rbp-8H]
        lea     rcx, [rdx+8H]
        mov     rdx, rax
        lea     rsi, [rel __buffer_cache__]
        mov     rdi, rcx
        call    memcpy
        mov     rax, qword [rbp-8H]
        leave
        ret


str_len:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        mov     rax, qword [rax]
        pop     rbp
        ret


printlnInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        mov     rdi, rax
        call    toString
        mov     rdi, rax
        call    println
        nop
        leave
        ret


getInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16


        mov     rax, qword [fs:abs 28H]
        mov     qword [rbp-8H], rax
        xor     eax, eax
        lea     rax, [rbp-10H]
        mov     rsi, rax
        lea     rdi, [rel L_006]
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, qword [rbp-10H]
        mov     rdx, qword [rbp-8H]


        xor     rdx, qword [fs:abs 28H]
        jz      L_005
        call    __stack_chk_fail
L_005:  leave
        ret


substring:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-20H], rsi
        mov     qword [rbp-28H], rdx
        mov     rax, qword [rbp-28H]
        sub     rax, qword [rbp-20H]
        add     rax, 1
        mov     qword [rbp-10H], rax
        mov     rax, qword [rbp-10H]
        add     rax, 16
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        mov     rdx, qword [rbp-10H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-10H]
        mov     rdx, qword [rbp-18H]
        lea     rcx, [rdx+8H]
        mov     rdx, qword [rbp-20H]
        lea     rsi, [rcx+rdx]
        mov     rdx, qword [rbp-8H]
        lea     rcx, [rdx+8H]
        mov     rdx, rax
        mov     rdi, rcx
        call    memcpy
        mov     rax, qword [rbp-8H]
        leave
        ret


ord:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-8H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-10H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movsx   rax, al
        pop     rbp
        ret

