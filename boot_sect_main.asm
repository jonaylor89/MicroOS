
[org 0x7c00]
    mov bp, 0x8000 ; set the stack safety away from us
    mov sp, bp

    mov bx, 0x9000 ; es:bx = 0x0000:0x9000 = 0x09000
    ; the bios sets 'dl' for our boot disk number
  
    call disk_load

    mov dx, [0x9000]
    call print_hex

    call print_hl

    mov dx, [0x9000 + 512]
    call print_hex

    jmp $

%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"

;magic number
times 510 - ($-$$) db 0
dw 0xaa55

; boot sector = sector 1 of cyl 0 of head of hdd 0
; from now on = sector 2 ...
times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes
