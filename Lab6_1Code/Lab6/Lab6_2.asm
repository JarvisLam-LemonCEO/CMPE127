.686p
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data
num1 dw 5       ; Declare num1 as a word variable
my_sum dw 0     ; Declare my_sum as a word variable to store the result

.code
main proc

; Load num1 into a register
MOV AX, [num1]

; Initialize my_sum to 0
MOV BX, 0
MOV [my_sum], BX

; Initialize a counter to 1
MOV CX, 1

; Loop to calculate the cumulative sum
SumLoop:
  ADD [my_sum], CX     ; Add the value of CX to my_sum
  INC CX              ; Increment CX
  CMP CX, AX          ; Compare CX with num1
  JLE SumLoop         ; Continue looping if CX is less than or equal to num1

; Exit the program
invoke ExitProcess, 0

main endp
end main
