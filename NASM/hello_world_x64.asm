; nasm -fwin64 <this file>.asm
; golink /console <this file>.obj kernel32.dll msvcrt.dll
; <this file>.exe

    bits 64
    default rel

    extern  GetStdHandle
    extern  WriteFile
    extern  ExitProcess
    extern  printf

section .data 
message db  'Hello, World!',10,0
msglen equ $-message
written dq      1

section .text
    global Start ; GoLink will use Start as the default entry point
Start:
    ; Use the C library to print our message
    mov rcx, message
    call    printf

    ; Now try using the Windows API
    mov rcx, -11
    call    GetStdHandle

    ; Use WriteFile to print our message again.
    ; Notice the calling convention for 64-bit Windows uses
    ; rcx, rdx, r8, and r9 for the first 4 non-floating point arguments
    ; and then the rest are pushed onto the stack.
    mov rcx, rax    ; HANDLE hFile
    mov rdx, message    ; LPCVOID lpBuffer
    mov r8, msglen  ; DWORD nNumberOfBytesToWrite
    mov r9, written ; LPDWORD lpNumberOfBytesWritten
    push    qword 0     ; LPOVERLAPPED lpOverlapped
    call    WriteFile

    mov rcx, 0
    call    ExitProcess
