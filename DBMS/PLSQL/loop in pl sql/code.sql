BEGIN  
FOR k IN 1..10 LOOP  
-- note that k was not declared  
DBMS_OUTPUT.PUT_LINE(k);  
END LOOP;  
END;  
/
