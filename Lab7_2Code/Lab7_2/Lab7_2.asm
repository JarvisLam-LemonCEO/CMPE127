.686p
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data
numbers DW 34, 45, 56, 67, 75, 89
odd_sum DW ?
even_sum DW ?

.code
main proc
    mov ecx, 6              ; Set the count of elements in the array
    lea ebx, numbers        ; Load the base address of the numbers array into EBX
    mov eax, 0              ; Initialize AX to 0 (for even_sum)
    mov edx, 0              ; Initialize DX to 0 (for odd_sum)

sum_loop:
    mov ax, [ebx]           ; Load the value at the address in EBX into AX
    test ax, 1              ; Check if it's odd (bitwise AND with 1)
    jnz next_iteration      ; If zero flag is not set (not even), move to next number 
    add dx, ax              ; even number gets added to dx
    jmp next_iteration      ; jump to next number


next_iteration: 
    add bx, 2               ; Move to the next element in the array (increment by 2 for 16-bit words)
    loop sum_loop           ; Continue looping until all elements are processed

    mov [even_sum], dx      ; Store the result in even_sum

    ;RESET FOR ODD NUMBERS

    mov ecx, 6              ; Set the count of elements in the array
    lea ebx, numbers        ; Load the base address of the numbers array into EBX
    mov eax, 0              ; Initialize AX to 0 (for even_sum)
    mov edx, 0              ; Initialize DX to 0 (for odd_sum)


sum_loop_odd:
    mov ax, [ebx]           ; Load the value at the address in EBX into AX
    test ax, 1              ; Check if it's odd (bitwise AND with 1)
    jz next_iteration_odd   ; If zero flag is set, it's even
    add dx, ax              ; add odd number to dx
    jmp next_iteration_odd  ; iterate to next number


next_iteration_odd:
    add bx, 2               ; Move to the next element in the array (increment by 2 for 16-bit words)
    loop sum_loop_odd       ; Continue looping until all elements are processed

    mov [odd_sum], dx       ; Store the result in even_sum


    Invoke ExitProcess, 0

main endp
end main
