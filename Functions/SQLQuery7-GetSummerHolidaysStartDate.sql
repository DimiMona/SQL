--SQLQuery1-GetNextLearningDay - возращает день недели, в который должно пройти следующее занятие.
USE PV_522_Import;
SET DATEFIRST 1;

CREATE FUNCTION GetNextLearningDay (@group_name AS NCHAR(10), @last_learning_date AS DATE) RETURNS TINYINT
AS
BEGIN
	DECLARE @group_id			AS	INT		= (SELECT group_id FROM Groups WHERE group_name=@group_name);
	DECLARE @last_learning_day	AS	TINYINT	= DATEPART(WEEKDAY, @last_learning_date);
END