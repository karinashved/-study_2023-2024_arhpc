
%include 'in_out.asm'

SECTION .data
    prompt: DB 'Введите значение x: ', 0  
    result_msg: DB 'Результат f(x) = (9x - 8) / 8: ', 0 
SECTION .bss
    x: RESB 4 
    result: RESB 4 

SECTION .text
    GLOBAL _start

_start:
    
    mov eax, prompt
    call sprintLF

    mov ecx, x       
    mov edx, 4      
    call sread
  
    mov eax, x       
    call atoi        

    mov ebx, 9       
    imul eax, ebx    

    sub eax, 8       

    xor edx, edx    
    mov ebx, 8       
    div ebx         

   mov [result], eax

  
   mov eax, result_msg  
   call sprint

   mov eax, eax         
   call iprintLF       


   call quit
