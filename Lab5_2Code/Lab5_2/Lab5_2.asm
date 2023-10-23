.686p
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

.code
main proc
 ; Adding two hexadecimal numbers and then converting to decimal
    ; AX/BX = 05h = 0000 0101
    MOV AX, 05h ; Store 05h into AX register
    MOV BX, 05h ; Store 05h into BX register
    ADD AX, BX ; Add BX to AX register
    DAA ; Convert hex into decimal
    ; The sum should be 10 in decimal

    ; Subtracting two hexadecimal numbers and then converting to decimal
    ; AX = 20h = 0010 0000, BX = 05h = 0000 0101
    MOV AX, 20h ; Store 20h into AX register
    MOV BX, 05h ; Store 05h into BX register
    SUB AX, BX ; Subtract BX from AX register
    DAS ; Convert binary-coded decimal  into decimal
    ; The difference should be 27 in decimal


    ; Adding two ASCII values and converting back to ASCII
    ; ASCII value of '5' is 35h = 0011 0101, ASCII value of '2' is 32h = 0011 0010 
    MOV AX, 35h ; Store 35h into AX register
    MOV BX, 32h ; Store 32h into BX register
    ADD AX, BX ; Add BX to AX register
    ; AX is 67h = 0110 0111, which is the ASCII of 'g'
    AAA ; Convert the result to ASCII
    ; Now AX is 'g' 

    ; Subtracting two ASCII values and converting back to ASCII
    MOV AX, 38h ; Store 38h into AX register
    MOV BX, 32h ; Store 32h into BX register
    SUB AX, BX ; Subtract BX from AX register
    AAS ; Convert the result to ASCII
    ; Now AX is '6'

    ; Subtracting two ASCII values and converting back to ASCII
    MOV AX, 32h ; Store 32h into AX register
    MOV BX, 38h ; Store 38h into BX register
    SUB AX, BX ; Subtract BX from AX register
    AAS ; Convert the result to ASCII
    ; 0011 0010 - 0011 1000 = 1111 1010 -> FAh
    ; 0000 1010 - 0000 0110 -> 0000 0100 -> 04h
    ; AX is FF04h 
    ; Now Ax is '-4'


    ; Multiplying two numbers and converting to ASCII
    MOV AX, 11 ; Store 11 into AX register
    MOV BX, 3 ; Store 3 into BX register
    MUL BX ; Multiply AX by BX
    AAM ; Convert the result to ASCII
    ; Now AX is ‘33’

    ; the ASCII value of 0408h is 48, the ASCII value of 04h is 4
    MOV AX, 0408h ; Store 0408h into AX register
    MOV BL, 04h ; Store 04h into BX register
    AAD ; Convert ASCII to binary
    DIV BL ; Divide AX by BL
    DAA ; Convert the result to ASCII
    ; Now AX is ‘12’
  
    invoke ExitProcess, 0
main endp
end main
