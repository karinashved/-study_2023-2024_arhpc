---
## Front matter
title: "Лабораторная работа №5"
subtitle: "Дисциплина: Архитекура компьютера"
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

Приобретение практических навыков работы в Midnight Commander. Освоение инструкций
языка ассемблера mov и int.



# Ход работы

Сначала я скачала Midnight Commander, открыла его с поомщью команды mc и, пользуясь клавишами ↑ , ↓ и Enter перешла в каталог ~/work/arch-pc созданный мною 
при выполнении лабораторной работы №4 (рис. [-@fig:001]).

![Использования горячих клавиш в  MC](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5294496737030964589.jpg){#fig:001 width=70%}

С помощью функциональной клавиши F7 я создала папку lab05 и перешла
в созданный каталог. (рис. [-@fig:002]).

![Создание каталога lab05](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5294496737030964600.jpg){#fig:002 width=70%}
Пользуясь строкой ввода и командой touch я создала файл lab5-1.asm

 С помощью функциональной клавиши F4 я открыла файл lab5-1.asm для редактирования во встроенном редакторе. (рис. [-@fig:003]).

![открытие asm файла в nano](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5294496737030964626.jpg){#fig:003 width=70%}

Далее ввела текст программы из листинга 5.1, сохранила изме-
нения и закрыла файл. (рис. [-@fig:004]).
![копирование листинга в мою программу](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5294496737030964630.jpg){#fig:004 width=70%}

С помощью функциональной клавиши F3 я открыла файл lab5-1.asm для просмотра и 
убедилась, что файл содержит текст программы.(рис. [-@fig:005]).
![файл lab5-1.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644354.jpg){#fig:005 width=70%}

Далее я оттранслировала текст программы lab5-1.asm в объектный файл, выполнила компоновку объектного файла и запустила получившийся исполняемый файл.Программа вывела строку и на этот запрос я ввела свои ФИО (рис. [-@fig:006]).
![запуск исполнемого файла](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644379.jpg){#fig:006 width=70%}

Для подключения внешних файлов я скачала файл in_out.asm со страницы курса в ТУИС

Далее в одной из панелей mc я открыла каталог с файлом lab5-1.asm, а в другой панели - каталог
со скаченным файлом in_out.asm. Затем я скопировала файл in_out.asm в каталог с файлом lab5-1.asm с помощью функциональной клавиши F5 (рис. [-@fig:007]).
![копирование файла](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644413.jpg){#fig:007 width=70%}

(рис. [-@fig:008]).
![копирование файла 2](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644414.jpg){#fig:008 width=70%}

Далее с помощью функциональной клавиши F6 я создала копию файла lab5-1.asm с именем
lab5-2.asm 

 Далее я исправила текст программы в файле lab5-2.asm с использование подпрограмм из
внешнего файла in_out.asm  в соответствии с листингом 5.2. Создала исполняемый файл и проверила его работу.

(рис. [-@fig:010]).
![работа программы lab5-2.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644472.jpg){#fig:010 width=70%}

Далее в файле lab5-2.asm заменила подпрограмму sprintLF на sprin и создала исполняе-
мый файл, проверила его работу.Теперь после вывода строки она не завершается символом перехода на новую строку.

(рис. [-@fig:011]).
![запуск программы lab5-2.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644555.jpg){#fig:011 width=70%}


# Задание для самостоятельной работы

Я создала копию файла lab5-1.asm с именем lab5-3.asm и внесла изменения в программу (без использова-
ния внешнего файла in_out.asm), так чтобы она работала по следующему алгоритму:
• вывести приглашение типа “Введите строку:”;
• ввести строку с клавиатуры;
• вывести введённую строку на экран.

(рис. [-@fig:012]).
![программа в файле lab5-3.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644665.jpg){#fig:012 width=70%}

(рис. [-@fig:013]).
![ запуск программы lab5-3.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644671.jpg){#fig:013 width=70%}

Далее я создала копию файла lab5-2.asm с именем lab5-4 и исправила текст программы с использование под-
программ из внешнего файла in_out.asm, так чтобы она работала по следующему
алгоритму:
• вывести приглашение типа “Введите строку:”;
• ввести строку с клавиатуры;
• вывести введённую строку на экран.

(рис. [-@fig:014]).
![ программа в файле lab5-4.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644678.jpg){#fig:014 width=70%}

Я создала исполняемый файл и проверила работу программы.Отличие этих двух программ в том, что файл in_out.asm содержит уже готовые подпрограммы для обеспечения ввода/вывода. Таким образом, остается только разместить данные в нужных регистрах и вызвать желаемую подпрограмму с помощью инструкции call.

(рис. [-@fig:015]).
![ запуск программы lab5-4.asm](/home/vboxuser/work/study/2023-2024/Архитектура компьютера/arch-pc/labs/lab05/report/image/5296748536844644682.jpg){#fig:015 width=70%}

# Выводы


Я приобрела практические навыки работы в Midnight Commander и освоила инструкци
языка ассемблера mov и int.


# Список литературы{.unnumbered}

1. GDB: The GNU Project Debugger. — URL: https://www.gnu.org/software/gdb/.
2. GNU Bash Manual. — 2016. — URL: https://www.gnu.org/software/bash/manual/.
3. Midnight Commander Development Center. — 2021. — URL: https://midnight-commander.
org/.
4. NASM Assembly Language Tutorials. — 2021. — URL: https://asmtutor.com/.
5. Newham C. Learning the bash Shell: Unix Shell Programming. — O’Reilly Media, 2005. —
354 с. — (In a Nutshell). — ISBN 0596009658. — URL: http://www.amazon.com/Learning-
bash-Shell-Programming-Nutshell/dp/0596009658.
6. Robbins A. Bash Pocket Reference. — O’Reilly Media, 2016. — 156 с. — ISBN 978-1491941591.
7. The NASM documentation. — 2021. — URL: https://www.nasm.us/docs.php.
8. Zarrelli G. Mastering Bash. — Packt Publishing, 2017. — 502 с. — ISBN 9781784396879.
9. Колдаев В. Д., Лупин С. А. Архитектура ЭВМ. — М. : Форум, 2018.
10. Куляс О. Л., Никитин К. А. Курс программирования на ASSEMBLER. — М. : Солон-Пресс,
2017.
11. Новожилов О. П. Архитектура ЭВМ и систем. — М. : Юрайт, 2016.
12. Расширенный ассемблер: NASM. — 2021. — URL: https://www.opennet.ru/docs/RUS/nasm/.
13. Робачевский А., Немнюгин С., Стесик О. Операционная система UNIX. — 2-е изд. — БХВ-
Петербург, 2010. — 656 с. — ISBN 978-5-94157-538-1.
14. Столяров А. Программирование на языке ассемблера NASM для ОС Unix. — 2-е изд. —
М. : МАКС Пресс, 2011. — URL: http://www.stolyarov.info/books/asm_unix.
15. Таненбаум Э. Архитектура компьютера. — 6-е изд. — СПб. : Питер, 2013. — 874 с. —
(Классика Computer Science).
16. Таненбаум Э., Бос Х. Современные операционные системы. — 4-е изд. — СПб. : Питер,
2015. — 1120 с. — (Классика Computer Science).
