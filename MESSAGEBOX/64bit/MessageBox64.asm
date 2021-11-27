                                                ; Message Box, 64 bit. V1.02
MB_DEFBUTTON1 EQU 0                             ; Constants
MB_DEFBUTTON2 EQU 100h
IDNO          EQU 7
MB_YESNO      EQU 4

extern MessageBoxA                              ; Import external symbols
extern ExitProcess                              ; Windows API functions, not decorated

global Start                                    ; Export symbols. The entry point

section .data                                   ; Initialized data segment
 MessageBoxText    db "코리아IT아카데미 수업에 만족하십니까?", 0
 MessageBoxCaption db "코리아IT아카데미", 0

section .text                                   ; Code segment
Start:
 sub   RSP, 8                                   ; Align the stack to a multiple of 16 bytes

 sub   RSP, 32                                  ; 32 bytes of shadow space

.DisplayMessageBox:
 xor   ECX, ECX                                 ; 1st parameter
 lea   RDX, [REL MessageBoxText]                ; 2nd parameter
 lea   R8, [REL MessageBoxCaption]              ; 3rd parameter
 mov   R9D, MB_YESNO | MB_DEFBUTTON2            ; 4th parameter. 2 constants ORed together
 call  MessageBoxA

 cmp   RAX, IDNO                                ; Check the return value for "No"
 je    .DisplayMessageBox

 add   RSP, 32                                  ; Remove the 32 bytes

 xor   ECX, ECX
 call  ExitProcess