CREATE TABLE animal_classes ( 
    id  INTEGER,
   	class  CHAR(6)
);

CREATE TABLE animal_info ( 
    	name  CHAR(6),
   		class  INTEGER,
		owner CHAR(4)
);

INSERT INTO animal_classes
(id, class)
VALUES
(1, 'Кошка'),
(2, 'Собака');


INSERT INTO animal_info
(name, class, owner)
VALUES
('Кити', 1, 'Ваня'),
('Мити', 2, 'Ваня'),
('Пити', 1, 'Петя');

select * FROM animal_classes; 
SELECT * FROM animal_info;

/*Сколько всего животных у Вани*/
SELECT owner, COUNT(*)
FROM animal_info
where owner='Ваня'
GROUP BY owner
;

/*Уникальные имена всех кошек отсортированные по алфавиту.*/

SELECT DISTINCT ai.name
FROM animal_info AS ai
JOIN animal_classes AS ac 
ON ai.class = ac.id
WHERE ac.id = 1
ORDER by ai.name;

/*Найти количество животных каждого класса. Вывести количество и имя класса.*/

SELECT ac.class, COUNT (ac.class)
FROM animal_info AS ai
JOIN animal_classes AS ac
ON ai.class=ac.id
GROUP by ac.class
;