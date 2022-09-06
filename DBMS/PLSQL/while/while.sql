declare
	i number:=1;
	num1 number:=0;
begin
	while(i<99)loop
	
		num1:=num1+i;
		i:=i+1;
	
end loop;
dbms_output.put_line('sum is ');
dbms_output.put_line('sum is '||num1);
end;
/
