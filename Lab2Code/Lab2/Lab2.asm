;Lab2

.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

.code
main proc
	MOV AL, 10
	MOV BL, 9
	SUB BL, AL


	invoke ExitProcess, 0

main endp
end main