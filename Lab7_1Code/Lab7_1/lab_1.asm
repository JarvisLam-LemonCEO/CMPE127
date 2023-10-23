.686p
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data
n DW 5       ; The number for which factorial is to be calculated
fact DW ?    ; Variable to store the factorial result

.code
main proc
mov ax, 1        ; Initialize ax to 1 (1 is the multiplicative identity)
mov bx, [n]      ; Load n into bx

start_loop:
    mul bx        ; Multiply ax by bx
    dec bx        ; Decrement bx
    jnz start_loop ; Repeat the loop until bx is not zero

mov [fact], ax   ; Store the result in fact
Invoke ExitProcess, 0

main endp
end main
