; Lab4 my_cal

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
a WORD 9
b WORD 5
maskValue WORD 30 ; cannot use mask because it is a reserved word
x WORD 2

sum WORD ? ; sum = a + b
sub1 WORD ? ; sub1 = a - b
product WORD ? ; product = a * b
quotient WORD ? ; quotient = a / b
remainder WORD ? ; remainder = a % b
a_minus WORD ? ; a_minus = -a
b_plus1 WORD ? ; b_plus1 = b + 1 (Don't use ADD)
a_and_mask WORD ? ; a_and_mask = a & mask
b_or_mask WORD ? ; b_or_mask = b | mask
a_shr_x WORD ? ; a_shr_x = shift right a by x times
b_shl_x WORD ? ; b_shl_x = shift left a x times
a_ror_x WORD ? ; a_ror_x = rotate right a by x times
b_rcl_x WORD ? ; b_rcl_x = rotate left with carry b by x times

.code
main PROC
    ; Calculate sum = a + b
    MOV AX, a       ; Load 'a' into AX register
    ADD AX, b       ; Add 'b' to AX
    MOV sum, AX     ; Store the result in 'sum'

    ; Calculate sub1 = a - b
    MOV AX, a       ; Load 'a' into AX register
    SUB AX, b       ; Subtract 'b' from AX
    MOV sub1, AX    ; Store the result in 'sub1'

    ; Calculate product = a * b
    MOV AX, a       ; Load 'a' into AX register
    IMUL AX, b      ; Multiply AX by 'b'
    MOV product, AX ; Store the result in 'product'

    ; Calculate quotient = a / b and a%b
    MOV AX, a       ; Load 'a' into AX register
    CWD             ; Sign extend AX into DX:AX
    IDIV b          ; Divide DX:AX by 'b', result in AX, remainder in DX
    MOV quotient, AX ; Store the result in 'quotient'
    MOV remainder, DX ; Store the remainder in 'remainder'

    ; Calculate a_minus = -a
    MOV AX, a       ; Load 'a' into AX register
    NEG AX          ; Negate AX to get -a
    MOV a_minus, AX ; Store the result in 'a_minus'

    ; Calculate b_plus1 = b + 1
    MOV AX, b       ; Load 'b' into AX register
    INC AX          ; Increment AX by 1
    MOV b_plus1, AX ; Store the result in 'b_plus1'

    ; Calculate a_and_mask = a & maskValue
    MOV AX, a       ; Load 'a' into AX register
    AND AX, maskValue ; Bitwise AND with 'maskValue'
    MOV a_and_mask, AX ; Store the result in 'a_and_mask'

    ; Calculate b_or_mask = b | maskValue
    MOV AX, b       ; Load 'b' into AX register
    OR AX, maskValue ; Bitwise OR with 'maskValue'
    MOV b_or_mask, AX ; Store the result in 'b_or_mask'

    ; Calculate b_shl_x = b << x
    MOV BX, b       ; Use BX instead of AX for word-sized operations
    MOV CX, x       ; Load 'x' into CX register
    SHL BX, CL      ; Bitwise left shift BX by CX bits
    MOV b_shl_x, BX ; Store the result in 'b_shl_x'

    ; Calculate a_ror_x = a rotated right by x
    MOV BX, a       ; Use BX instead of AX for word-sized operations
    MOV CX, x       ; Load 'x' into CX register
    ROR BX, CL      ; Rotate right BX by CX bits
    MOV a_ror_x, BX ; Store the result in 'a_ror_x'

    ; Calculate b_rcl_x = b rotated left with carry by x
    MOV BX, b       ; Use BX instead of AX for word-sized operations
    MOV CX, x       ; Load 'x' into CX register
    RCL BX, CL      ; Rotate left BX with carry by CX bits
    MOV b_rcl_x, BX ; Store the result in 'b_rcl_x'


    ; Exit the program
    INVOKE ExitProcess, 0
main ENDP

END main
