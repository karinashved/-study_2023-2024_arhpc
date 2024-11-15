---
## Front matter
title: "Арифметические операции  NASM"
subtitle: "Дисциплина: Архитектура компьютера"
author: "Швед Карина Дмитриевна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Освоение арифметических инструкций языка ассемблера NASM

# Ход лабораторной
Я создала каталог для программ лабораторной работы № 6, перешла в него и
создала файл lab6-1.asm:
mkdir ~/work/arch-pc/lab06
cd ~/work/arch-pc/lab06
touch lab6-1.asm
 (рис. [-@fig:001]).

![Создание каталога для лабораторной 6 и файла asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image.png){#fig:001 width=70%}

Далее я ввела в файл lab6-1.asm текст программы (рис. [-@fig:002])из листинга 6.1. Перед созданием исполнямого файла я создала копию файла in_out.asm в каталоге ~/work/arch-pc/lab06.Далее cоздала исполняемый файл и запустила его.(рис. [-@fig:003])

На экране я увидела символ j, так как код символа 6 равен 00110110 вдвоичном представлении, а код символа 4 –  . Команда add eax,ebx запишет в регистр eax сумму кодов – 01101010,что в свою очередь является кодом символа j согласно таблице ASCII.


![код программы lab6-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (2).png){#fig:002 width=70%}


![создание исполняемого файла lab6-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (3).png){#fig:003 width=70%}

Далее я изменила текст программы и вместо символов записала в регистры числа. Я заменила строки:

mov eax,'6'
mov ebx,'4'
на строки
mov eax,6
mov ebx,4

Создала исполняемый файл и запустила его (рис. [-@fig:004]). Как и в предыдущем случае, при выполнении программы я не получила число 10. Вместо этого выводится символ с кодом 10, который представляет собой символ конца строки (возврат каретки). Этот символ не отображается на экране, но он добавляет пустую строку.

![работа программы lab6-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (4).png){#fig:004 width=70%}

Как отмечалось выше, для работы с числами в файле in_out.asm реализованы подпрограммы для преобразования ASCII символов в числа и обратно. Я преобразовала текст программы из Листинга 6.1 с использованием этих функций.
Создала файл lab6-2.asm в каталоге ~/work/arch-pc/lab06 и ввела в него текст программы из листинга 6.2 (рис. [-@fig:005]), создала исполняемый файл и запустила его (рис. [-@fig:006]).

![код программы lab6-2.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (5).png){#fig:005 width=70%}



![запуск программы lab6-2.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (6).png){#fig:006 width=70%}

В результате работы программы я получила число 106. В данном случае, как и в первом,команда add складывает коды символов ‘6’ и ‘4’ (54+52=106). Однако, в отличии от программы из листинга 6.1, функция iprintLF позволяет вывести число, а не символ, кодом которого является это число.

Аналогично предыдущему примеру я изменила символы на числа. Я заменила строки (рис. [-@fig:007]).

mov eax,'6'
mov ebx,'4'
на строки
mov eax,6
mov ebx,4

Создала исполняемый файл и запустила его (рис. [-@fig:008]). Функция iprintLF позволяет вывести число и операндами были числа (а не коды символов). Поэтому получаем число 10.


![программа в файле lab6-2.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (8).png){#fig:007 width=70%}


![работа программы lab6-2.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (7).png){#fig:008 width=70%}

Я заменила функцию iprintLF на iprint. Создала исполняемый файл и запустила его (рис. [-@fig:009]). Вывод отличается тем, что нет переноса строки



![работа программы lab6-2.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (9).png){#fig:009 width=70%}

В качестве примера выполнения арифметических операций в NASM приведу программу вычисления арифметического выражения 𝑓(𝑥) = (5 ∗ 2 + 3)/3.
Я создала файл lab6-3.asm в каталоге ~/work/arch-pc/lab06:
touch ~/work/arch-pc/lab06/lab6-3.asm
Внимательно изучила текст программы из листинга 6.3 и ввела в lab6-3.asm. Создала исполняемый файл и запустила его. Результат работы программы получился следующим (рис. [-@fig:010]).

![работа программы lab6-3.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (10).png){#fig:010 width=70%}

Далее я изменила текст программы (рис. [-@fig:011])для вычисления выражения f (x)  = (4 ∗ 6 + 2)/5. Создала исполняемый файл и проверила его работу (
(рис. [-@fig:012])

![код программы lab6-3.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (11).png){#fig:011  width=70%} 


![работа программы lab6-3.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (12).png){#fig:012 width=70%}

В качестве другого примера рассмотрим программу вычисления варианта задания по
номеру студенческого билета.В данном случае число, над которым необходимо проводить арифметические операции,вводится с клавиатуры. Ввод с клавиатуры осуществляется в символьном виде и для корректной работы арифметических операций в NASM символы необходимо преобразовать в числа. Для этого может быть использована функция atoi из файла in_out.asm.
 
 Я создала файл variant.asm в каталоге ~/work/arch-pc/lab06:
touch ~/work/arch-pc/lab06/variant.asm
Внимательно изучила текст программы из листинга 6.4 и ввела в файл variant.asm. (рис. [-@fig:013]). Создала исполняемый файл и запустила его. Проверила результат работы программы вычислив номер варианта аналитически (рис. [-@fig:014])

![код программы variant.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (13).png){#fig:013 width=70%} 

![работа программы variant.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (14).png){#fig:014 width=70%}

# Ответы на вопросы
1. Какие строки листинга 6.4 отвечают за вывод на экран сообщения ‘Ваш вариант:’?
Строка “mov eax, rem” перекладывает в регистр значение переменной с фразой “Ваш вариант:”
Строка “call sprint” вызывает подпрограмму вывода строки

2.  Для чего используются следующие инструкции?
mov ecx, x
Загружает адрес переменной x в регистр ECX.
mov edx, 80
Загружает значение 80 в регистр EDX.
call sread 
Вызывает подпрограмму для считывания значения студенческого билета из консоли

3.  Для чего используется инструкция “call atoi”?
Инструкция “call atoi” используется для преобразования введенных символов в числовой формат

4.  Какие строки листинга 6.4 отвечают за вычисления варианта?
Строка “xor edx, edx” обнуляет регистр edx
Строка “mov ebx, 20” записывает значение 20 в регистр ebx
Строка “div ebx” выполняет деление номера студенческого билета на 20
Строка “inc edx” увеличивает значение регистра edx на 1

5.  В какой регистр записывается остаток от деления при выполнении инструкции “div ebx”?
Остаток от деления записывается в регистр edx

6.  Для чего используется инструкция “inc edx”?
Инструкция “inc edx” используется для увеличения значения в регистре edx на 1, в соответствии с формулой вычисления варианта

7.  Какие строки листинга отвечают за вывод на экран результата вычислений?
Строка “mov eax, edx” перекладывает результат вычислений в регистр eax
Строка “call iprintLF” вызывает подпрограмму для вывода значения на экран


# Задание для самостоятельной работы

Формулировка задания: Написать программу вычисления выражения y=f(x). Программа должна выводить выражение для вычисления, выводить запрос на ввод значения x, вычислять заданное выражение в зависимости от введенного 𝑥, выводить результат вычислений. Вид функции f(x) выбрать из таблицы 6.3 вариантов заданий в соответствии с номером полученным при выполнении лабораторной работы. Создайте исполняемый файл и проверьте его работу для значений x1 и x2 из 6.3

Я получила вариант 5:

(9𝑥 − 8)/8

для х1=8  х2=64

Сначала я создала отдельный файл task.asm и ввела код программы (рис. [-@fig:015]), затем получила исполняемый файл и проверила работу программы,введя значения x1 и x2 (рис. [-@fig:016])


![код программы task.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (15).png){#fig:015 width=70%}

![работа программы task.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab06/report/image/Pasted image (16).png){#fig:016 width=70%}

# Выводы

Я освоила арифметические инструкции языка ассемблера NASM


