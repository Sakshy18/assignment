DECLARE   
VAR1 NUMBER;  
BEGIN   
VAR1:=10;  
FOR VAR2 IN REVERSE 1..10  
LOOP  
DBMS_OUTPUT.PUT_LINE (VAR1*VAR2);  
END LOOP;  
END;  
