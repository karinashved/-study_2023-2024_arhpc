section .data
    promptX db "Input x: ", 0
    promptA db "Input a: ", 0
    resultMsg db "f(x) = ", 0
    newline db 0xA, 0
    buffer db 32, 0

section .bss
    x resd 1
    a resd 1
    result resd 1

section .text
    global _start

_start:
    ; Ввод x
    mov eax, 4            ; syscall: write
    mov ebx, 1            ; stdout
    mov ecx, promptX      ; "Input x: "
    mov edx, 9            ; Длина строки
    int 0x80

    mov eax, 3            ; syscall: read
    mov ebx, 0            ; stdin
    mov ecx, buffer       ; Буфер для ввода
    mov edx, 32           ; Длина ввода
    int 0x80
    call parse_input      ; Преобразуем ввод в число
    mov [x], eax          ; Сохраняем x

    ; Ввод a
    mov eax, 4            ; syscall: write
    mov ebx, 1            ; stdout
    mov ecx, promptA      ; "Input a: "
    mov edx, 9            ; Длина строки
    int 0x80

    mov eax, 3            ; syscall: read
    mov ebx, 0            ; stdin
    mov ecx, buffer       ; Буфер для ввода
    mov edx, 32           ; Длина ввода
    int 0x80
    call parse_input      ; Преобразуем ввод в число
    mov [a], eax          ; Сохраняем a

    ; Выводим x
    mov eax, 4            ; syscall: write
    mov ebx, 1            ; stdout
    mov ecx, resultMsg    ; "f(x) = "
    mov edx, 8            ; Длина строки
    int 0x80

    ; Выводим результат
    mov eax, [x]          ; Загружаем x
    mov ebx, [a]          ; Загружаем a
    cmp eax, ebx          ; Сравниваем x и a
    jg .greater           ; Если x > a, перейти к .greater

    ; x <= a
    mov eax, 15           ; Результат 15
    mov [result], eax     ; Сохраняем результат
    jmp .output_result    ; Переход к выводу

.greater:
    sub eax, ebx          ; x - a
    shl eax, 1            ; 2 * (x - a)
    mov [result], eax     ; Сохраняем результат

.output_result:
    ; Вывод результата
    mov eax, [result]     ; Загружаем результат
    call print_int        ; Выводим результат

    ; Перенос строки
    mov eax, 4            ; syscall: write
    mov ebx, 1            ; stdout
    mov ecx, newline      ; "\n"
    mov edx, 1            ; Длина строки
    int 0x80

    ; Завершение программы
    mov eax, 1            ; syscall: exit
    xor ebx, ebx          ; Код возврата 0
    int 0x80

; Функция преобразования строки в число
parse_input:
    xor eax, eax          ; Очищаем результат
    xor edx, edx          ; Обнуляем временный регистр

.next_char:
    mov al, [ecx]         ; Загружаем текущий символ
    inc ecx               ; Указатель на следующий символ
    cmp al, 0xA           ; Проверяем символ новой строки
    je .done              ; Если новая строка, выходим
    sub al, '0'           ; Преобразуем ASCII в цифру
    imul eax, eax, 10     ; Умножаем текущий результат на 10
    add eax, edx          ; Добавляем текущую цифру
    xor edx, edx          ; Сбрасываем edx для следующей итерации
    jmp .next_char

.done:
    ret

; Функция вывода числа
print_int:
    push eax              ; Сохраняем eax
    mov ecx, buffer       ; Указатель на конец буфера
    add ecx, 30
    mov byte [ecx], 0     ; Конец строки

.reverse:
    dec ecx               ; Двигаемся назад
    xor edx, edx          ; Обнуляем edx
    mov ebx, 10           ; Основа системы счисления
    div ebx               ; Делим eax на 10
    add dl, '0'           ; Преобразуем остаток в ASCII
    mov [ecx], dl         ; Сохраняем символ
    test eax, eax         ; Проверяем, закончился ли результат
    jnz .reverse          ; Если нет, продолжаем

    mov eax, 4            ; syscall: write
    mov ebx, 1            ; stdout
    mov edx, buffer       ; Длина строки
    sub edx, ecx          ; Длина строки
    mov ecx, ecx          ; Указатель на начало строки
    int 0x80
    pop eax               ; Восстанавливаем eax
    ret

