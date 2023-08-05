/*Найдите id (поле user_id) пользователя с почтой houston42@gmail.com (таблица users).*/
SELECT user_id, user_email FROM users
        WHERE user_email = 'houston42@gmail.com';
		
/*Найдите уровень (поле level) студента с user_id = 44133 (таблица student).*/
SELECT user_id, level FROM student
        WHERE user_id = 44133;
		
/*Найдите предмет (поле subject_title) с id = 8 (таблица subject).*/
SELECT subject_id, subject_title FROM subject
        WHERE subject_id = 8;
		
/*Найдите email учителя группы с group_id = 80 (таблица teacher).*/
SELECT email, group_id FROM teacher
        WHERE group_id=80;
		
/*Выведите уникальные форматы обучения (education_form) для студента с user_id = 12203
 (таблица student).*/
SELECT DISTINCT education_form, user_id FROM student        
        WHERE user_id = 12203;
 
/*Составьте запрос и создайте таблицу rooms (кабинеты). 
Поля таблицы и их тип можно найти на схеме БД.*/
CREATE TABLE rooms (
        room_id INTEGER,
        teacher_id INTEGER,
        floor_noom INTEGER
);

/*Составьте запрос и заполните таблицу rooms следующими данными:*/
INSERT INTO rooms (room_id, teacher_id, floor_num)
VALUES
(1, 965, 1),
(2, 29091, 1),
(3, 29410, 1),
(10, 33576, 2),
(11, 33902, 2);

/*Выведите id учителей с кабинетами на втором этаже.*/
SELECT teacher_id, floor_num FROM rooms
        WHERE floor_num=2
		
/*Выведите id учителей, которые получают зарплату в евро.*/
SELECT teacher_id, salary_val FROM salary
        WHERE salary_val = 'EUR'