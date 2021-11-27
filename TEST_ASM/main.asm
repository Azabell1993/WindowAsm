global _asm_main

;초기화되지 않은 전역변수 등이 들어감
section .bss
buffer:     resb   128
res:        resb    10
increase:   resb    10

;data와 text는 핵심
;초기화된 전역변수
section .data
fmt:        db      '%d',   0
equal:      db      '=',    0
mul:        db      '*',    0
end:        db      10,     0

;작성한 코드가 컴파일되어 들어감
section .text
    extern  printf
    extern  scanf
    extern  exit

multi: 
    push    rbp
    mov     rbp,    rsp
    xor     rax,    rax
    inc     rax                 ; rax의 값을 1씩 증가
    inc     rbx                 ; rbx의 값을 1씩 증가

_loop:
    mov     rcx,    9
    cmp     rbx,    rcx
                jg _end         ; 테스트를 따르는 조건부 점프
                                ; 대상 피 연산자가 소스 피연산자보다 크면 cmp 후에 부호있는 비교점프를 수행한다.
    mov     rax,    rbx
    mov     rdi,    [buffer]
    mul     rdi
    mov     [increase], rbx
    mov     [res],      rax
    call    printf_func
    inc     rbx                 ; operand의 값을 1씩 증가해주는 함수(operand 갯수 1개)
    jmp     _loop

_end:
    leave
    ret

printf_func:
    push    rbp
    mov     rbp,    rsp
    mov     rsi,    [buffer]
    mov     rdi,    fmt
    mov     rax,    0
    call    printf
    mov     rdi,    mul
    mov     rax,    0
    call    printf
    mov     rsi,    [increase]
    mov     rdi,    fmt
    mov     rax,    0
    call    printf
    mov     rdi,    equal
    mov     rax,    0
    call    printf
    mov     rsi,    [res]
    mov     rdi,    fmt
    mov     rax,    0
    call    printf
    mov     rdi,    end
    mov     rax,    0
    call    printf
    leave
    ret

_asm_main:
    push    rbp
    mov     rsi,    buffer
    mov     rdi,    fmt
    mov     rax,    0
    call    scanf
    call    multi
    call    exit
    pop     rbp             ; pop: stack맨 위를 레지스터로 복원하는 데 사용된다.
    ret


