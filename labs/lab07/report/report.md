---
## Front matter
title: "Лабораторная работа №7"
subtitle: "Команды безусловного и
условного переходов в Nasm. Программирование
ветвлений"
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

Изучение команд условного и безусловного переходов. Приобретение навыков написания
программ с использованием переходов. Знакомство с назначением и структурой файла
листинга


# Ход работы
Я создала каталог для программам лабораторной работы № 7, перешла в него и со-
здалафайл lab7-1.asm. Далее попробовала использование инструкции jmp и ввела в этот файл текст программы из листинга 7.1. (рис. [-@fig:001]).Создала исполняемый файл и запустила его.(рис. [-@fig:002]).

![Код в файле lab7-1.asm.](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image.png){#fig:001 width=70%}

![работа программы в файле lab7-1.asm.](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (2).png){#fig:002 width=70%}

Таким образом, использование инструкции jmp _label2 меняет порядок исполнения
инструкций и позволяет выполнить инструкции начиная с метки _label2, пропустив вывод первого сообщения.Инструкция jmp позволяет осуществлять переходы не только вперед но и назад. Я изменила программу таким образом, чтобы она выводила сначала ‘Сообщение № 2’, потом ‘Сообщение № 1’ и завершала работу. Для этого в текст программы после вывода сообщения № 2 я добавила инструкцию jmp с меткой _label1 (т.е. переход к инструкциям вывода сообщения № 1) и после вывода сообщения № 1 инструкцию jmp с меткой _end (т.е. переход к инструкции call quit). Так я изменила текст программы в соответствии с листингом 7.2. (рис. [-@fig:003]). Создала исполняемый файл и проверила его работу (рис. [-@fig:004])

![код программы в файле lab7-1.asm.](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (3).png){#fig:003 width=70%}

![работа программы в файле lab7-1.asm.](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (4).png){#fig:004 width=70%}

Далее я изменила текст программы, чтобы вывод был следующим:

user@dk4n31:~$ ./lab7-1
Сообщение № 3
Сообщение № 2
Сообщение № 1
user@dk4n31:~$

(рис. [-@fig:005])(рис. [-@fig:006])

![код программы в файле lab7-1.asm.](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (5).png){#fig:005 width=70%}

![работа программы в файле lab7-1.asm.](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (6).png){#fig:006 width=70%}

Использование инструкции jmp приводит к переходу в любом случае. Однако, часто при написании программ необходимо использовать условные переходы, т.е. переход должен происходить если выполнено какое-либо условие. В качестве примера рассмотрим программу, которая определяет и выводит на экран наибольшую из 3 целочисленных переменных: A,B и C. Значения для A и C задаются в программе, значение B вводиться с клавиатуры.

Создала файл lab7-2.asm в каталоге ~/work/arch-pc/lab07. Внимательно изучила текст программы из листинга 7.3 и ввела в lab7-2.asm (рис. [-@fig:007]) Создала исполняемый файл и проверила его работу для разных значений B. (рис. [-@fig:008])

![код программы в файле lab7-2.asm.](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (8).png){#fig:007 width=70%}

![работа программы в файле lab7-2.asm.](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (7).png){#fig:008 width=70%}

Обычно nasm создаёт в результате ассемблирования только объектный файл. Получить
файл листинга можно, указав ключ -l и задав имя файла листинга в командной строке. Я создала файл листинга для программы из файла lab7-2.asm и открыла его с помощью текстового редактора (рис. [-@fig:009])

![файл листинга lab7-2](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/5337267017796937979.jpg){#fig:009 width=70%}

Внимательно ознакомилась с его форматом и содержимым. Подробно объясню
содержимое трёх строк файла листинга по выбору

 1) строка 192:
 
  17 - номер строки в подпрограмме
  000000F2 - адрес
  B9[0A000000] - машинный код
  mov ecx,B - код программы, копирует значения из операнда B в регистр ecx.
  
 2) строка 168
 
  167 - номер строки в подпрограмме
  000000DB - адрес
  B9[0A000000] - машинный код
  mov ebx, 0   - код программы, Ппсле выполнения команды все 32 бита регистра ebx становятся равны 0
  
 3) строка 193
 
  18 - номер строки в подпрограмме
  000000F7 - адрес
  BA0A000000   - машинный код
  mov edx,10   - код программы, инструкция записывает значение 10 (в десятичной системе) в регистр edx
  
  Открыла файл с программой lab7-2.asm и в любой инструкции с двумя операндами
удалила один операнд. Выполнила трансляцию с получением файла листинга (рис. [-@fig:010]) (рис. [-@fig:011])

![ошибка трансляцииlab7-2](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (10).png){#fig:010 width=70%}

![файл листинга lab7-2 с ошибкой](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (11).png){#fig:011 width=70%}

Объектный файл не создался из-за ошибки.Получился листинг, где выделено место ошибки

# Задание для самостоятельной работы

1) Написать программу нахождения наименьшей из 3 целочисленных переменных a,b,c.
Значения переменных выбрать из табл. 7.5 в соответствии с вариантом, полученным
при выполнении лабораторной работы № 7. Создать исполняемый файл и проверить
его работу.

Для варианта 5: 54,62,87

Для выполнения задания я создала файл task7-1.asm, написала код (рис. [-@fig:012]) и создала исполняемый файл. Проверила правильность работы программы (рис. [-@fig:013])

![код программы task7-1](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (10).png){#fig:012 width=70%}

![работа программы task7-1](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (11).png){#fig:013 width=70%}

2)Написать программу, которая для введенных с клавиатуры значений  х и а вычисляет значение заданной функции f(x) и выводит результат вычислений. Вид функции f(x)выбрать из таблицы 7.6 вариантов заданий в соответствии с вариантом, полученным при выполнении лабораторной работы № 7. Создать исполняемый файл и проверить его работу для значений x и a из 7.6.

Для варианта 5:
⎧2(𝑥 − 𝑎), 𝑥 > 𝑎
⎨15, 𝑥 ≤ 𝑎
⎩

 Если подставить x=1 a=2 получается 15
 Если подставить x=2 a=1 получается 2(2-1)=2
 
 Для выполнения задания я создала task7-2 и ввела код. (рис. [-@fig:014]) Создала исполняемый файл и проверила его работу (рис. [-@fig:015])
 
 ![код программы task7-2](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/Pasted image (14).png){#fig:014 width=70%}

![работа программы task7-2](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab07/report/image/5337267017796937965.jpg){#fig:015 width=70%}

# Выводы

Я изучила команды условного и безусловного переходов, а также приобрела навыки написания программ с использованием переходов. Познакомилась с назначением и структурой файла листинга


