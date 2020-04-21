/* This funtion will spell a given Integer between 0 and ±5373484 */
CREATE OR REPLACE FUNCTION spell_number(n NUMBER)
RETURN VARCHAR2
IS
	spell VARCHAR2(200):='null';
BEGIN
	IF n = 0
	THEN
		spell:='Zero';
	ELSIF n BETWEEN 1 AND 5373484
	THEN
		SELECT TO_CHAR(TO_DATE(n,'j'),'jsp') INTO spell FROM dual;
	ELSIF n BETWEEN -5373484 AND -1
	THEN
		SELECT 'Minus '|| TO_CHAR(TO_DATE(ABS(n),'j'),'jsp') INTO spell FROM dual;
	END IF;
	RETURN spell;
END;
/
