DECLARE
num1 number :=20;
num2 number :=40;

BEGIN
if(num1<30) THEN
dbms_output.put_line('number is less than 30');
elsif(num2>30) THEN
dbms_output.put_line('greater number is'||num2);
END IF;
END;
/
