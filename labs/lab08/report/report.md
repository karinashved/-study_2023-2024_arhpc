---
## Front matter
title: "Лабораторная работа №8."
subtitle: "Программирование цикла.Обработка аргументов командной строки."
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

Приобретение навыков написания программ с использованием циклов и обработкой
аргументов командной строки.


# Ход работы
При реализации циклов в NASM с использованием инструкции loop необходимо помнить
о том, что эта инструкция использует регистр ecx в качестве счетчика и на каждом шаге уменьшает его значение на единицу. В качестве примера рассмотрим программу, которая выводит значение регистра ecx.

Создала каталог для программ лабораторной работы № 8, перешла в него и создала файл lab8-1.asm. Далее я внимательно изучила текст программы из листинга 8.1 и ввела в файл lab8-1.asm. (рис. [-@fig:001]). Создала исполняемый файл и проверила его работу.(рис. [-@fig:002]).

![Код программы в файле lab8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image.png){#fig:001 width=70%}

![Работа программы  lab8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (2).png){#fig:002 width=70%}

Данный пример показывает, что использование регистра ecx в теле цилка loop может
привести к некорректной работе программы. Я изменила текст программ, добавив изменение значение регистра ecx в цикле (рис. [-@fig:003]). Создала исполняемый файл и проверила его работу.

![Код программы в файле lab8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (3).png){#fig:003 width=70%}

При нечетном N программа запускает бесконечный цикл (рис. [-@fig:004]), а при четном N выводит только нечетные числа (рис. [-@fig:005])

![Запуск программы lab8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (4).png){#fig:004 width=70%}

![Запуск программы lab8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (5).png){#fig:005 width=70%}

Для использования регистра ecx в цикле и сохранения корректности работы программы можно использовать стек. Я добавила в программу команды push
и pop (добавления в стек и извлечения из стека) для сохранения значения счетчика цикла loop (рис. [-@fig:006]) Создала исполняемый файл и проверила его работу (рис. [-@fig:007])  Программа выводит числа от N-1 до 0, число проходов цикла соответствует N.

![Код программы lab8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (6).png){#fig:006 width=70%}

![Работа программы lab8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (7).png){#fig:007 width=70%}

При разработке программ иногда встает необходимость указывать аргументы, которые
будут использоваться в программе, непосредственно из командной строки при запуске программы. Для того чтобы использовать аргументы в программе, их просто нужно извлечь из стека. Обработку аргументов нужно проводить в цикле.В качестве примера рассмотрим программу, которая выводит на экран аргументы командной строки. Я внимательно изучила текст программы из Листинга 8.2. 

Создала файл lab8-2.asm в каталоге ~/work/arch-pc/lab08 и ввела в него текст программы из листинга 8.2.(рис. [-@fig:008]) Далее создала исполняемый файл и запустила его, указав аргументы (рис. [-@fig:009]). Было обработано 4 аргумента

![Код программы lab8-2.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (8).png){#fig:008 width=70%}

![Работа программы lab8-2.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (9).png){#fig:009 width=70%}

Рассмотрим еще один пример программы которая выводит сумму чисел, которые передаются в программу как аргументы. Я создала файл lab8-3.asm в каталоге ~/work/arch-pc/lab08 и ввела в него текст программы из листинга 8.3. (рис. [-@fig:010]) Создала исполняемый файл и запустите его, указав аргументы. (рис. [-@fig:011])

![Код программы lab8-3.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (10).png){#fig:010 width=70%}

![Работа программы lab8-3.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (11).png){#fig:011 width=70%}

Изменила текст программы из листинга 8.3 для вычисления произведения аргументов
командной строки.(рис. [-@fig:012]) (рис. [-@fig:013])

![Код программы lab8-3.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (12).png){#fig:012 width=70%}

![Работа программы lab8-3.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (13).png){#fig:013 width=70%}

# Задание для самостоятельной работы
Напишите программу, которая находит сумму значений функции 𝑓(𝑥) для
𝑥 = 𝑥1, 𝑥2, ..., 𝑥𝑛, т.е. программа должна выводить значение 𝑓(𝑥1) + 𝑓(𝑥2) + ... + 𝑓(𝑥𝑛).Значения 𝑥𝑖 передаются как аргументы. Вид функции 𝑓(𝑥) выбрать из таблицы
8.1 вариантов заданий в соответствии с вариантом, полученным при выполнении
лабораторной работы № 7. Создайте исполняемый файл и проверьте его работу на
нескольких наборах 𝑥 = 𝑥1, 𝑥2, ..., 𝑥𝑛.

Для варианта 5: 4𝑥 + 3

Сначала я создала файл task8-1.asm. Затем ввела соответствующий код. (рис. [-@fig:014])Создала исполняемый файл и проверила работу файла. Я ввела несколько аргументов и получила сумму значений (рис. [-@fig:015])

![Код программы task8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (14).png){#fig:014 width=70%}

![Работа программы task8-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab08/report/image/Pasted image (15).png){#fig:015 width=70%}


# Выводы

Я приобрела навыки написания программ с использованием циклов и обработкой
аргументов командной строки.


