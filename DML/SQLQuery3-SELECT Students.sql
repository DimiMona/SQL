--SQLQuery3-SELECT Students.sql
USE PV_522_Import;

PRINT	CAST(DATEDIFF (DAY,N'2003-03-08', GETDATE())/365.25 AS TINYINT)

--SELECT
--		[Студент]			=	FORMATMESSAGE(N'%s %s %s', last_name, first_name,middle_name),
--		[Дата рождения]		=	birth_date,
--		[Возраст]			=	CAST(DATEDIFF (DAY,[birth_date], GETDATE())/365.25 AS TINYINT),
--		[Группа]			=	group_name,
--		[Спппециальность]	=	direction_name
--FROM	 Students,Groups,Directions
--WHERE	[group]		=	group_id
--AND		direction	=	direction_id
--ORDER BY [Возраст]	DESC
--					-- ASC по возрастанию
--					-- DESC по убыванию







--SELECT 
--    [Преподаватель]		= FORMATMESSAGE(N'%s %s %s', last_name, first_name,middle_name),
--    [Дисциплина]			= discipline_name
--FROM Teachers, TeachersDisciplinesRelation, Disciplines
--WHERE teacher_id			= teacher 
--    AND discipline		= discipline_id
--    AND teacher_id		= 1;


--SELECT 
--    [Преподаватель]		= FORMATMESSAGE(N'%s %s %s', last_name, first_name,middle_name),
--    [Дисциплина]			= discipline_name
--FROM Teachers, TeachersDisciplinesRelation, Disciplines
--WHERE   discipline		= discipline_id
--    AND  teacher 			= teacher_id
--    AND discipline_id		= 1;


--SELECT * FROM Teachers
--SELECT * FROM TeachersDisciplinesRelation
--WHERE teacher				=8

--SELECT 
--[Количество]				= COUNT(*)
--FROM TeachersDisciplinesRelation
--WHERE teacher				= 8

--SELECT * FROM Disciplines
--SELECT * FROM TeachersDisciplinesRelation
--WHERE discipline				=8

SELECT 
	[Дисциплина]			= discipline_name,
	[Преподаватели]			=  STRING_AGG(FORMATMESSAGE(N'%s %s %s', last_name, first_name,middle_name),','),
	[Количество]			= COUNT(*)-- подсчет строк 
	
FROM Disciplines
JOIN TeachersDisciplinesRelation ON discipline_id = discipline
JOIN Teachers ON teacher = teacher_id --JOIN -это способ соединить данные из разных таблиц в один результат
WHERE  		discipline_id		= 1
GROUP BY discipline_name -- GROUP BY это способ сгруппировать строки с одинаковыми значениями в одну группу
;

