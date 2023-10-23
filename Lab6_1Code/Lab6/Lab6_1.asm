.686p
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data
max_num dw 0 ; Declare max_num as a word variable
min_num dw 0 ; Declare min_num as a word variable

.code
main proc

; Load num1, num2, and num3 into registers
MOV AX, 5      ; num1
MOV BX, 8      ; num2
MOV CX, 2      ; num3

; compare num1 and num2
CMP AX, BX            ; Compare AX and BX
JL LessAB             ; Jump if AX < BX
MOV max_num, AX       ; Store num1 in max_num
MOV min_num, BX       ; Store num2 in min_num
JMP Done

LessAB:
; compare num2 and num3
CMP BX, CX            ; Compare BX and CX
JL LessBC             ; Jump if BX < CX
MOV max_num, BX       ; Store num2 in max_num
MOV min_num, CX       ; Store num3 in min_num
JMP Done

LessBC:
MOV max_num, CX       ; Store num3 in max_num
MOV min_num, BX       ; Store num2 in min_num

Done:
; code continues here, after finding max_num and min_num

; Exit the program
invoke ExitProcess, 0

main endp
end main
