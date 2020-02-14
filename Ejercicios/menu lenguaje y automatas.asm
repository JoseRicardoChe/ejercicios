;ITSVA
;ISC 6B 
;Elaborado por: Jose Ricardo Che Cauich

.MODEL SMALL  

IMPRIMIR MACRO OP, RES
    MOV AH,09
    LEA DX,OP 
    INT 21H
    
    MOV AL,RES
    AAM
    MOV BX,AX
    MOV AH,02H
    MOV DL,BH
    ADD DL,30H
    INT 21H
    
    MOV AH,02H
    MOV DL,BL
    ADD DL,30H
    INT 21H
IMPRIMIR ENDM

IMPRIMIR2 MACRO NUM
    LEA DX,MAYOR 
    MOV AH,9
    INT 21h
    
    LEA DX, NUM 
    MOV AH,9
    INT 21h
IMPRIMIR2 ENDM

PUTC    MACRO   char
    PUSH    AX
    MOV     AL, char
    MOV     AH, 0Eh
    INT     10h     
    POP     AX
ENDM

.DATA
    SUMA DB 0
    RESTA DB 0
    MULTI DB 0
    DIVI DB 0
    NUM1 DW ?
    NUM2 DW ?
    NUMERO1 DB 100 dup('$')
    NUMERO2 DB 100 dup('$')
    NUMERO3 DB 100 dup('$') 
    CADENA1 DB '[1] OPERACIONES$' 
    CADENA2 DB '[2] DETERMINAR EL MAYOR DE 3 NUMEROS$'
    CADENA3 DB 'MENU DE OPERACIONES$' 
    CADENA4 DB 'SELECCIONA UN VALOR$' 
    CADENA5 DB 'Operaciones$'
    CADENA6 DB 0Dh,0Ah, 0Dh,0Ah, 'Primer numero: $'
    CADENA7 DB 0Dh,0Ah,"Segundo numero: $"
    CADENA8 DB 0ah,0dh, 'Tercer numero: ', '$'
    CADENA9 DB  0dh,0ah ,'Enter para regresar al menu ', 0Dh,0Ah, '$' 
    CADENAS DB 10,13, "Suma= ",'$'
    CADENAR DB 10,13, "Resta= ",'$'
    CADENAM DB 10,13, "Multiplicacion= ",'$'
    CADENAD DB 10,13, "Division= ",'$'
    CADENA10 DB 0ah,0dh, 'Ingrese tres numeros ','$'
    MAYOR DB 0ah,0dh, 'El numero mayor es: ','$' 
     
.CODE 
     MOV AX,@DATA
     MOV DS,AX 
               
     ;fondo uno          
     MOV AH,06H        
     MOV AL,0      
     MOV BH,4FH    
     MOV CX,0000H  
     MOV DX,184FH
     INT 10H          
                                 
     ;fondo 2
     MOV AH,06H        
     MOV AL,0      
     MOV BH,2FH    
     MOV CX,0507H                            
     MOV DX,1448H
     INT 10H       
     
     ;fondo 3
     MOV AH,06H        
     MOV AL,0      
     MOV BH,9FH    
     MOV CX,0707H                 
     MOV DX,0248H
     INT 10H       
     
     ;cadena 1
    MOV AH,02H
    MOV BH,0   
    MOV DH,08H
    MOV DL,0CH
    INT 10H 
    
    MOV AH,09H
    MOV DX,OFFSET CADENA1
    INT 21H 
    
    ;cadena 2        
    MOV AH,02H
    MOV BH,0      
    MOV DH,0BH   
    MOV DL,0CH  
    INT 10H  
    
    MOV AH,09H
    MOV DX,OFFSET CADENA2
    INT 21H                
                 
    ;Cadena 3
    MOV AH,02H
    MOV BH,0     
    MOV DH,02H   
    MOV DL,1EH   
    INT 10H  
    
    MOV AH,09H
    MOV DX,OFFSET CADENA3
    INT 21H
        
    ;Cadena 4
    MOV AH,02H
    MOV BH,0     
    MOV DH,17H   
    MOV DL,1EH   
    INT 10H  
    
    MOV AH,09H
    MOV DX,OFFSET CADENA4
    INT 21H  
    
    INICIO: MOV AH,0H
    INT 16H
    
    CMP AL,'1'
    JE PARTE1
    CMP AL,'2'
    JE PARTE2   
    
    JMP FINAL
    
    PARTE1:
    MOV AH,05H
    MOV AL,1
    INT 10H
    MOV AH,06H
    MOV AL,0
    MOV BH,1AH
    MOV CX,0000
    MOV DX,184FH
    INT 10H 
    
    LEA DX,CADENA5
    MOV AH,9
    INT 21h

    LEA DX, CADENA6
    MOV AH, 09h    
    INT 21h  

    CALL ESCANEAR
    MOV NUM1, CX 

    LEA DX, CADENA7
    MOV AH, 09h
    INT 21h  

    CALL ESCANEAR
    MOV NUM2, CX   

    ; CALCULAR: 

    ;SUMA
    MOV AX, NUM1
    ADD AX, NUM2
    MOV SUMA,AL   

    ;RESTA
    MOV AX, NUM1
    SUB AX, NUM2
    MOV RESTA,AL   

    ;MULTIPLICACION
    MOV AX, NUM1
    MUL NUM2 
    MOV MULTI,AL 
    
    ;DIVISION
    XOR AX,AX
    MOV AX, NUM1
    DIV NUM2  
    MOV DIVI,AL   

    ;SUMA
    IMPRIMIR CADENAS, SUMA  
    
    ;RESTA
    IMPRIMIR CADENAR, RESTA
    
    ;MULTIPLICACION
    IMPRIMIR CADENAM, MULTI
    
    ;DIVISION
    IMPRIMIR CADENAD, DIVI
    
    ;REGRESO
    LEA DX, CADENA9 
    MOV AH, 09h
    INT 21h
    
    MOV AH, 0H
    INT 16H
    CMP AL,013
    JE REGRESO
    JMP FINAL
    
    PARTE2:
    MOV AH,05H
    MOV AL,2
    INT 10H
    MOV AH,06H
    MOV AL,0
    MOV BH,1AH
    MOV CX,0000
    MOV DX,184FH
    INT 10H   
    
    LEA DX, CADENA10
    MOV AH, 09h    
    INT 21h
    
    LEA DX, CADENA6
    MOV AH, 09h    
    INT 21h  

    mov ah,01h
    int 21h
    MOV NUMERO1, AL 

    LEA DX, CADENA7
    MOV AH, 09h
    INT 21h  

    mov ah,01h
    int 21h
    MOV NUMERO2, AL
    
    LEA DX, CADENA8
    MOV AH, 09h
    INT 21h  

    MOV ah,01h
    INT 21h
    MOV NUMERO3, AL
    
    MOV ah,NUMERO1
    MOV al,NUMERO2
    CMP ah,al 
    JA compara-1-3 
    JMP compara-2-3 
    compara-1-3:
    MOV al,NUMERO3
    CMP ah,al
    JA mayor1 
    
    compara-2-3:
    MOV ah,NUMERO2
    MOV al,NUMERO3
    CMP ah,al 
    JA mayor2 
    JMP mayor3
    
    MAYOR1:
    IMPRIMIR2 NUMERO1
    
    MAYOR2:
    IMPRIMIR2 NUMERO2
    
    MAYOR3:
    IMPRIMIR2 NUMERO3
    
    ;REGRESO
    LEA DX, CADENA9 
    MOV AH, 09h
    INT 21h
    
    MOV AH, 0H
    INT 16H
    CMP AL,013
    JE REGRESO
    JMP FINAL
    
    REGRESO:
    MOV AH,05H
    MOV AL,0
    INT 10H
    JMP INICIO
      
    FINAL:
    MOV AH,4CH
    INT 21H
    
    RET

ESCANEAR PROC NEAR
        PUSH    DX
        PUSH    AX
        PUSH    SI
        
        MOV     CX, 0

        MOV     CS:menos, 0
siguiente:
        MOV     AH, 00h
        INT     16h
       
        MOV     AH, 0Eh
        INT     10h
       
        CMP     AL, '-'
        JE      set_minus
        
        CMP     AL, 0Dh  
        JNE     nocr
        JMP     stop_input
nocr:
        CMP     AL, 8                   
        JNE     back
        MOV     DX, 0                   
        MOV     AX, CX                  
        DIV     CS:ten                  
        MOV     CX, AX
        PUTC    ' '                    
        PUTC    8                       
        JMP     siguiente
back:
        CMP     AL, '0'
        JAE     ok_AE_0
        JMP     removernodigito
ok_AE_0:        
        CMP     AL, '9'
        JBE     ok_digito
removernodigito:       
        PUTC    8      
        PUTC    ' '     
        PUTC    8              
        JMP     siguiente      
ok_digito:
        PUSH    AX
        MOV     AX, CX
        MUL     CS:ten                  
        MOV     CX, AX
        POP     AX

        CMP     DX, 0
        JNE     too_big

        ;convertir del ASCII:
        SUB     AL, 30h

        MOV     AH, 0
        MOV     DX, CX      
        ADD     CX, AX
        JC      too_big2   

        JMP     siguiente

set_minus:
        MOV     CS:menos, 1
        JMP     siguiente

too_big2:
        MOV     CX, DX      
        MOV     DX, 0       
too_big:
        MOV     AX, CX
        DIV     CS:ten 
        MOV     CX, AX
        PUTC    8       
        PUTC    ' '    
        PUTC    8              
        JMP     siguiente 
        
        
stop_input:
        CMP     CS:menos, 0
        JE      not_minus
        NEG     CX
not_minus:

        POP     SI
        POP     AX
        POP     DX
        RET
menos      DB      ?      
ESCANEAR        ENDP

ten DW 10

END