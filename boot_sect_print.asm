print:
    pusha

start:
    mov al, [bx] ; 'bx' is the base address for the string
    cmp al, 0
    je done

    ; print with the BIOS help
    mov ah, 0x0e
    int 0x10
    
    ; increment pointer
    add bx, 1
    jmp start


done:
    popa
    ret


print_nl:
    pusha

    mov ah, 0x0e
    mov al, 0x0a ; newline character
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10

    popa
    ret
