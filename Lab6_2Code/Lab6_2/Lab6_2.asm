.686p
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data
num1 WORD 5       ; Declare num1 as a word variable
my_sum WORD ?     ; Declare my_sum as a word variable to store the result

.code
main proc

MOV AX, 0 ;set AX to 0
MOV CX, num1 ;set CX to 5

seq:
	ADD AX, CX ; add CX to AX
	JCXZ DONE ; checks of CX is zero. If so, jump to done function

	loop seq ; decrements CX by 1, loop seq

	DONE:
	MOV my_sum, ax ; moves the final sum to variable my_sum

; Exit the program
invoke ExitProcess, 0

main endp
end main
