global recortar_ventana_asm

section .text

recortar_ventana_asm:
    push rbx
    push rsi
    push rdi

    ; Guardar punteros estables pasados por la convención de llamadas de Windows x64
    mov rsi, rcx        ; 
    mov rdi, rdx        ; 

    ; Calcular origen X de la cámara (jugador_x - 10)
    sub r8d, 10         
    jns .eval_x_max
    xor r8d, r8d        ; 
.eval_x_max:
    cmp r8d, 40
    jle .ajustar_y
    mov r8d, 40         ; 

.ajustar_y:
    ; Calcular origen Y de la cámara (jugador_y - 10)
    sub r9d, 10         
    jns .eval_y_max
    xor r9d, r9d        ; 
    jmp .loop_init
.eval_y_max:
    cmp r9d, 40
    jle .loop_init
    mov r9d, 40         ;

.loop_init:
    xor r10, r10        ; 

.loop_f:
    cmp r10, 20
    je .done
    xor r11, r11        ; 

.loop_c:
    cmp r11, 20
    je .next_f

    ;--- Calcular índice en el mapa grande ---
    ; Indice = (cam_y + f) * 60 + (cam_x + c)
    mov eax, r9d        
    add eax, r10d       
    imul eax, 60        
    add eax, r8d        
    add eax, r11d       

    ; Leer carácter desde la memoria del mapa grande
    mov al, [rsi + rax]

    ;--- Calcular índice en la ventana pequeña ---
    ; Indice = (f * 20) + c
    mov rbx, r10        
    imul rbx, 20        
    add rbx, r11        

    mov [rdi + rbx], al

    inc r11
    jmp .loop_c

.next_f:
    inc r10
    jmp .loop_f

.done:
    pop rdi
    pop rsi
    pop rbx
    ret