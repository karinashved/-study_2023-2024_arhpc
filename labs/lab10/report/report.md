---
## Front matter
title: "Лабораторная работа №10. "
subtitle: "Работа с файлами средствами Nasm"
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

Приобретение навыков написания программ для работы с файлами.

# Ход работы
Я создала каталог для программ лабораторной работы № 10, перешла в него и
создала файлы lab10-1.asm, readme-1.txt и readme-2.txt. Затем  вела в файл lab10-1.asm текст программы из листинга 10.1. Создала исполняемый файл и проверила его работу. (рис. [-@fig:001]).

![ работа программы lab10-1](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab10/report/image/Pasted image.png){#fig:001 width=70%}


Чтобы запретить выполнение исполняемого файла lab10-1, я использовала команду chmod для изменения прав доступа. Я сняла атрибут “x” во всех трех позициях. После этого я попыталась выполнить файл.Однако файл не запускается, потому что выполнение запрещено из-за отсутствия атрибута “x” во всех трех позициях. (рис. [-@fig:002]).

![ запуск запрещен](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab10/report/image/Pasted image (2).png){#fig:002 width=70%}

Я изменила права доступа к файлу lab10-1.asm, добавив права на выполнение с помощью команды chmod. Затем я попыталась выполнить файл (рис. [-@fig:003]).

В результате, файл запустился, и терминал попытался выполнить его содержимое как команды командной строки. Однако, так как это файл с кодом на языке ассемблера, а не команды терминала, возникли ошибки. Тем не менее, если в такой файл добавить команды командной строки, то можно будет выполнить эти команды, запустив файл.

![ файл с кодом с разрешением запуска](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab10/report/image/Pasted image (3).png){#fig:003 width=70%}

Далее, я установила права доступа к файлам readme в соответствии с указанными вариантом в таблице 10.4. Чтобы проверить правильность выполнения, я использовала команду ls -l. (рис. [-@fig:004]).
для варианта 5: --x -w- r-x 001 101 010

![ установка прав](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab10/report/image/Pasted image (4).png){#fig:004 width=70%}

# Самостоятельная работа

Я написала программу по заданному алгоритму. Для этого я создала файлы lab10-2.asm и  name.txt. Ввела код в файл lab10-2, (рис. [-@fig:005])скомпилировала его и проверила работу (рис. [-@fig:006]). Также проверила наличие файла и его содержимое с помощью команд ls и cat.

![ код программы lab10-2](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab10/report/image/Pasted image (5).png){#fig:005 width=70%}

![ работа программы lab10-2](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab10/report/image/Pasted image (6).png){#fig:006 width=70%}


# Выводы

Я приобрела навыки написания программ для работы с файлами.

