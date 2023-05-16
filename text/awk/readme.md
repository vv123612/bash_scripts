https://habr.com/ru/companies/ruvds/articles/665084/


Вывести все аналогично cat
awk '{print $0}' information.txt

Вывести все вместе с нумерацией
awk '{print NR,$0}' information.txt

Вывод первого столбца
awk '{print $1}' information.txt

Вывод второго столбца
awk '{print $2}' information.txt

Вывод первого и четвертого столбца
awk '{print $1, $4}' information.txt

Вывод последнего столбца
awk '{print $NF}' information.txt

Вывод первого столбца и первой строки
awk '{print $1}' information.txt | head -1

Вывод первого столбца и двух первых строк
awk '{print $1}' information.txt | head -2

Вывод строк начинающуюся с заданной буквы.
awk '/^O/' information.txt

Вывод строк заканчивающихся на определнную букву.
awk '/0$/' information.txt

Вывод строк незаканчивающихся на определнную букву.
awk '! /0$/' information.txt 

Вывод строк содержащих io.
awk ' /io/{print $0}' information.txt

Вывод строк содержащих IT.
awk '/IT/' information.txt

Вывод два столбца для строк содержащих IT.
awk '/IT/{print $1, $2}' information.txt

Вывод строк содержащих N/A - использование экранирующего символа.
awk '/N\/A$/' information.txt

Вывод строк у которых трейтий столбец менее 40.
awk '$3 <  40 { print $0 }' information.txt



gpt
строки которые содержат трейтий столбец более 40.
и первую строку с шапкай таблицы
awk 'NR == 1 || $3 > 40 { print $0 }' information.txt