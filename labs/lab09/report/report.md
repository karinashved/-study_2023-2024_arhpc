---
## Front matter
title: "Лабораторная работа №9."
subtitle: "Понятие подпрограммы.Отладчик GDB."
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

Приобретение навыков написания программ с использованием подпрограмм. Знакомство
с методами отладки при помощи GDB и его основными возможностями.

# Ход работы

Я создала каталог для выполнения лабораторной работы № 9, перейшла в него и со-
здала файл lab09-1.asm

В качестве примера рассмотрим программу вычисления арифметического выражения
𝑓(𝑥) = 2𝑥 + 7 с помощью подпрограммы _calcul. В данном примере 𝑥 вводится с
клавиатуры, а само выражение вычисляется в подпрограмме. Я внимательно изучила
текст программы (Листинг 9.1).Ввела в файл lab09-1.asm текст программы из листинга 9.1. Создала исполняемый файл (рис. [-@fig:001]) и проверила его работу (рис. [-@fig:002]).

![код программы lab09-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image.png){#fig:001 width=70%}

![работа программы lab09-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (2).png){#fig:002 width=70%}

Я изменила текст программы, добавив подпрограмму _subcalcul в подпрограмму _calcul,
для вычисления выражения 𝑓(𝑔(𝑥)), где 𝑥 вводится с клавиатуры, 𝑓(𝑥) = 2𝑥 + 7, 𝑔(𝑥) =
3𝑥 − 1. Т.е. 𝑥 передается в подпрограмму _calcul из нее в подпрограмму _subcalcul, где
вычисляется выражение 𝑔(𝑥), результат возвращается в _calcul и вычисляется выражение
𝑓(𝑔(𝑥)). Результат возвращается в основную программу для вывода результата на экран. Я создала исполняемый файл (рис. [-@fig:003]) и проверила его работу (рис. [-@fig:004])

![код программы lab09-1.asm](//home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (3).png){#fig:003 width=70%}

![работа программы lab09-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (4).png){#fig:004 width=70%}

Я создала файл lab09-2.asm с текстом программы из Листинга 9.2. (Программа печати сообщения Hello world!)

Получила исполняемый файл и добавила отладочную информацию с помощью ключа ‘-g’ для работы с GDB.(рис. [-@fig:005])

![запуск программы lab09-2.asm в отладчике](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (5).png){#fig:005 width=70%}

Для более подробного анализа программы, установила точку остановки на метке ‘start’, с которой начинается выполнение любой ассемблерной программы, и запустила ее. Затем просмотрела дизассемблированный код программы (рис. [-@fig:006]) (рис. [-@fig:007])

![Дизассемблированный код](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (6).png){#fig:006 width=70%}

![Дизассемблированный код в режиме intel](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (7).png){#fig:007 width=70%}

Включила режим псевдографики для более удобного анализа программы
Для проверки точки остановки по имени метки ’_start’, использовала команду ‘info breakpoints’ (сокращенно ‘i b’). Затем установила еще одну точку остановки по адресу инструкции, определив адрес предпоследней инструкции ‘mov ebx, 0x0’. (рис. [-@fig:007])

![точка останова](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (8).png){#fig:008 width=70%}

Установила еще одну точку останова по адресу инструкции mov ebx,0x0 (рис. [-@fig:009])

![точка останова](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (9).png){#fig:009 width=70%}

Посмотрите информацию о всех установленных точках останова (рис. [-@fig:010])

![все точки останова](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (10).png){#fig:010 width=70%}

Отладчик может показывать содержимое ячеек памяти и регистров, а при необходимости
позволяет вручную изменять значения регистров и переменных.Выполнила 5 инструкций с помощью команды stepi (или si) и проследила за изменением значений регистров (рис. [-@fig:011])

![изменение регистров](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (11).png){#fig:011 width=70%}

Просмотрела значение переменной msg1 по имени и получил нужные данные.
Просмотрела значение переменной msg1 по имени и получил нужные данные.
Для изменения значения регистра или ячейки памяти использовала команду set, указав имя регистра или адрес в качестве аргумента.Изменила первый символ переменной msg1 и первый символ переменной msg2 (рис. [-@fig:012])

![изменение значения переменной](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (12).png){#fig:012 width=70%}


Вывела в различных форматах (в шестнадцатеричном формате, в двоичном формате и
в символьном виде) значение регистра edx. (рис. [-@fig:013]) С помощью команды set изменила значение регистра ebx (рис. [-@fig:014])

![вывод значения регистра](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (13).png){#fig:013 width=70%}

![вывод значения регистра](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (14).png){#fig:014 width=70%}

Скопировала файл lab8-2.asm, созданный во время выполнения лабораторной работы №8, который содержит программу для вывода аргументов командной строки. Создала исполняемый файл из скопированного файла.
Для загрузки программы с аргументами в gdb использовала ключ –args и загрузил исполняемый файл в отладчик с указанными аргументами.
Установила точку останова перед первой инструкцией программы и запустила ее.
Адрес вершины стека, содержащий количество аргументов командной строки (включая имя программы), хранится в регистре esp. По этому адресу находится число, указывающее количество аргументов. В данном случае видно, что количество аргументов равно 5, включая имя программы lab9-3 и сами аргументы: аргумент1, аргумент2 и ‘аргумент 3’.
Просмотрела остальные позиции стека. По адресу [esp+4] находится адрес в памяти, где располагается имя программы. По адресу [esp+8] хранится адрес первого аргумента, по адресу [esp+12] - второго и так далее.  (рис. [-@fig:015])

![вывод значения регистра](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (15).png){#fig:015 width=70%}

Шаг изменения адреса равен 4, так как каждый следующий адрес на стеке находится на расстоянии 4 байт от предыдущего ([esp+4], [esp+8], [esp+12]).

# Самостоятельная работа
1)Преобразовала программу из лабораторной работы №8 (Задание №1 для самостоятельной работы), реализовав вычисление значения функции 𝑓(𝑥) как подпрограмму (рис. [-@fig:016])

![программа в файле task8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (16).png){#fig:016 width=70%}

Создала исполняемый файл и проверила его работу (рис. [-@fig:017])

![программа в файле task8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (17).png){#fig:017 width=70%}


2)В листинге приведена программа вычисления выражения (3+2)*4+5. При запуске данная программа дает неверный результат. Проверила это, анализируя изменения значений регистров с помощью отладчика GDB.
Определила ошибку - перепутан порядок аргументов у инструкции add. Также обнаружила, что по окончании работы в edi отправляется ebx вместо eax (рис. [-@fig:018])

![код с ошибкой](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (18).png){#fig:018 width=70%}

перепутан порядок аргументов у инструкции add и что по окончании работы в edi отправляется ebx вместо eax

(рис. [-@fig:019])

![код исправлен](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab09/report/image/Pasted image (19).png){#fig:019 width=70%}


# Выводы

Я приобрела навыки написания программ с использованием подпрограмм, а также познакомилась
с методами отладки при помощи GDB и его основными возможностями.



