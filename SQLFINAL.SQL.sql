/*   ЗАДАНИЕ 1

1-1 Составьте запрос, который выведет имя вида с наименьшим id. 
Результат будет соответствовать букве «М».
МАЛЫШ*/

SELECT species_name
FROM species
WHERE species_id=(SELECT MIN(SPECIES_ID) FROM SPECIES);

/*1-2 Составьте запрос, который выведет имя вида с количеством 
представителей более 1800. Результат будет соответствовать букве «Б».
РОЗА*/

SELECT species_name
FROM species
WHERE species_amount>1800;

/*1-3 Составьте запрос, который выведет имя вида, 
начинающегося на «п» и относящегося к типу с type_id = 5. 
Результат будет соответствовать букве «О».
ПОДСОЛНУХ*/

SELECT species_name
FROM species
WHERE species_name LIKE 'п%' AND type_id=5;

/*1-4 Составьте запрос, который выведет имя вида, заканчивающегося 
на «са» или количество представителей которого равно 5. 
Результат будет соответствовать букве В.
ЛИСА*/

SELECT species_name
FROM species
WHERE species_name LIKE '%са' AND species_amount=5;

/* ЗАДАНИЕ 2

2-1 Составьте запрос, который выведет имя вида, появившегося 
на учете в 2023 году. Результат будет соответствовать букве «Ы».
ОБЕЗЬЯНА*/

SELECT species_name
FROM species
/*where date_start>'2023-01-01' AND date_start<'2023-12-31'; - можно и таким образом*/
WHERE to_char(date_start,'YYYY')='2023';

/*2-2 Составьте запрос, который выведет названия отсутствующего 
(status = absent) вида, расположенного вместе с place_id = 3. 
Результат будет соответствовать букве «С».
ЯБЛОКО*/

SELECT s.species_name from species as s
JOIN species_in_places AS sip
ON sip.species_id = s.species_id
JOIN places as pl
ON sip.place_id = pl.place_id
WHERE pl.place_id = 3 AND s.species_status='absent';

/*2-3 Составьте запрос, который выведет название вида, расположенного 
в доме и появившегося в мае, а также и количество представителей вида. 
Название вида будет соответствовать букве «П».
СОБАКА*/

SELECT 	s.species_name, 
		pl.place_name, 
		s.species_amount, 
		s.date_start from species as s
JOIN species_in_places AS sip
ON sip.species_id = s.species_id
JOIN places as pl
ON sip.place_id = pl.place_id
WHERE pl.place_id = 1 and to_char(date_start,'MM')='05';

/*2-4 Составьте запрос, который выведет название вида, состоящего из двух слов
(содержит пробел). Результат будет соответствовать знаку !.
ГОЛУБАЯ РЫБА*/

SELECT species_name
FROM species
WHERE species_name LIKE '% %';

/* ЗАДАНИЕ 3

3-1 Составьте запрос, который выведет имя вида, появившегося с малышом в один день. 
Результат будет соответствовать букве «Ч».
КОШКА*/

SELECT species_name, date_start
FROM species
WHERE date_start ='2022-10-04';

/*3-2 Составьте запрос, который выведет название вида, 
расположенного в здании с наибольшей площадью. 
Результат будет соответствовать букве «Ж».
ЛОШАДЬ*/


SELECT s.species_name as "вид", 
		pl.place_name as "здание",
		pl.place_size as "площадь"
from species as s
JOIN species_in_places AS sip
ON sip.species_id = s.species_id
JOIN places as pl
ON sip.place_id = pl.place_id
/*WHERE  pl.place_name = 'дом' OR pl.place_name= 'сарай' - можно так*/
WHERE pl.place_name IN ('дом', 'сарай') /* а можно и так*/
ORDER BY pl.place_size DESC
LIMIT 1;

/*3-3 Составьте запрос/запросы, которые найдут название вида, 
относящегося к 5-й по численности группе проживающей дома. 
Результат будет соответствовать букве «Ш».
ПОПУГАЙ*/

SELECT s.species_name as "вид",
		s.species_amount as "количество",
		pl.place_name as "здание"
from species as s
JOIN species_in_places AS sip
ON sip.species_id = s.species_id
JOIN places as pl
ON sip.place_id = pl.place_id
WHERE  pl.place_name = 'дом'
ORDER BY s.species_amount DESC
LIMIT 5;

/*3-4 Составьте запрос, который выведет сказочный вид (статус fairy), 
не расположенный ни в одном месте. Результат будет соответствовать букве «Т».
ЕДИНОРОГ*/


SELECT  species_name AS "имя",
		species_status AS "статус",
		pl.place_name AS "место_обитания"
from species as s
FULL JOIN species_in_places AS sip
ON s.species_id = sip.species_id
FULL JOIN places as pl
ON sip.place_id = pl.place_id
WHERE species_status = 'fairy';