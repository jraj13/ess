step1:create master emp details:
===================================


create table Emp_master_bio(empid varchar2(20),
fullid varchar2(30),
name varchar2(50),
date_of_join date,
dummy1 varchar2(20),
dummy2 varchar2(20));


insert some data

59	Amar				CSSE150059
45	yogesh				CSSE150045



step2:create biometric table for storing
=========================================

create table NCSS_TEMP_BKP_DUMP2(
s_no varchar2(10),
db_date date,
db_weekday varchar2(15),
DATE_TIME	DATE,
EMPID	VARCHAR2(20),
fullid  varchar2(30),
IN_TIME	VARCHAR2(20),
in_date date,
OUT_TIME	VARCHAR2(20),
out_date date,
DIFFERENCE varchar2(30),
status varchar2(75),
remarks varchar2(50));




step3:execute the procedure required for calculating the days in a month
==========================================================================


create or replace procedure daysinmonth(in_empid in varchar2,in_fullid varchar2 ) is
a number(5);
b number(5);
r_emp varchar2(10);
d_date date;
end_date date;
       cursor c_emp is SELECT TO_CHAR(LAST_DAY(SYSDATE), 'dd') as count FROM dual;
       cursor d_emp is select to_char(sysdate, 'dd-mon-yyyy') from dual;
       
    begin
        open c_emp;
        open d_emp;
          fetch c_emp into r_emp;
          fetch d_emp into d_date;
          b:=TO_NUMBER(r_emp);
        
          FOR  a in 1..b LOOP
          
         dbms_output.put_line(a);
        dbms_output.put_line(d_date);
       dbms_output.put_line('passing date is'||d_date);
        insert into NCSS_TEMP_BKP_DUMP2(s_no,db_date,empid,fullid ) values(a,d_date,in_empid,in_fullid );
        commit;
         d_date:=d_date+1;
end loop;
       close c_emp;
       close d_emp;
   end;



step4:execute the procedure for preparing the chart(it need to execute every month)
======================================================

create or replace procedure getempid is
       cursor c_emp is select empid,fullid  from emp_master_bio order by EMPID;
        r_emp c_emp%ROWTYPE;
    begin
        open c_emp;
        loop
          fetch c_emp into r_emp;
         exit when c_emp%NOTFOUND;
         dbms_output.put_line('id of the employee is'||r_emp.empid);
         daysinmonth(r_emp.empid,r_emp.fullid );
       end loop;
       close c_emp;
   end;


step5:calculating status and difference of the employee
=====================================================

create or replace procedure wish(date_in IN NCSS_TEMP_BKP_DUMP2.DATE_TIME%TYPE,id_in NCSS_TEMP_BKP_DUMP2.EMPID%TYPE)
is
status1 varchar2(50);
status2 varchar2(50);
status3 varchar2(50);
status4 varchar2(50);
status5 VARCHAR2(50);
main_in number(15);
cursor c1 is
select empid,date_time,in_time,out_time,to_char(to_date('00:00','HH24:MI') +(out_date - in_date), 'HH24:MI') timediff from
NCSS_TEMP_BKP_DUMP2 where to_date(date_time,'DD-MON-RR')=date_in and empid=id_in;

r_emp c1%ROWTYPE;
begin 
  open c1;
  loop
  fetch c1 into r_emp;
  exit when c1%NOTFOUND;
   status1:='timings is good maintained 9 hours';
  status2:='coming late but maitained 9 hours';
  status3:='early coming and early going';
  status4:='late coming and late going not maintained 9 hours';
  status5:='late coming and early going';
  
  dbms_output.put_line('hours is'|| r_emp.timediff);
  dbms_output.put_line('in time is'|| r_emp.in_time);
  dbms_output.put_line('out time is'|| r_emp.out_time);
  if(r_emp.in_time<='10:00:00' and r_emp.out_time>'19:00:00' and r_emp.timediff>='09:00') then
  update NCSS_TEMP_BKP_DUMP2 set DIFFERENCE=r_emp.timediff,status=status1 where empid=r_emp.empid and to_char(date_time,'DD-MON-YY')=r_emp.date_time;
  commit;
   dbms_output.put_line(' timings is good ');
   
   elsif(r_emp.in_time>'10:00:00' and r_emp.out_time>'19:00:00' and r_emp.timediff>='09:00') then
              dbms_output.put_line(' coming late but maitained 9 hours');
              update NCSS_TEMP_BKP_DUMP2 set DIFFERENCE=r_emp.timediff,status=status2 where empid=r_emp.empid and to_char(date_time,'DD-MON-YY')=r_emp.date_time;
  commit;
                 
   elsif(r_emp.in_time<='10:00:00' and r_emp.out_time<'19:00:00' ) then
     dbms_output.put_line(' case1 early coming and early going');
     update NCSS_TEMP_BKP_DUMP2 set DIFFERENCE=r_emp.timediff,status=status3 where empid=r_emp.empid and to_char(date_time,'DD-MON-YY')=r_emp.date_time;
  commit;
     
      elsif(r_emp.in_time>'10:00:00' and r_emp.out_time>'19:00:00') then
           dbms_output.put_line(' case2 late coming and late going');
           update NCSS_TEMP_BKP_DUMP2 set DIFFERENCE=r_emp.timediff,status=status4 where empid=r_emp.empid and to_char(date_time,'DD-MON-YY')=r_emp.date_time;
  commit;
     
      elsif(r_emp.in_time>'10:00:00' and r_emp.out_time<'19:00:00') then
              dbms_output.put_line(' case3 late coming and early going');
      
     update NCSS_TEMP_BKP_DUMP2 set DIFFERENCE=r_emp.timediff,status=status5 where empid=r_emp.empid and to_char(date_time,'DD-MON-YY')=r_emp.date_time;
  commit;
     
     end if;
     
     end loop;
       close c1;
   end;


step6: executing main procedure(biometric procedure)
================================

create or replace Procedure biometricprocedure3
   ( date_in IN NCSS_TEMP_BKP_DUMP2.DATE_TIME%TYPE,id_in NCSS_TEMP_BKP_DUMP2.EMPID%TYPE,time_in varchar2)  
IS
   cnumber varchar2(30);
   final_date varchar2(30);
   cursor c1 is
   SELECT empid FROM NCSS_TEMP_BKP_DUMP2 where DATE_TIME=date_in and empid=id_in;
BEGIN
   open c1;
   fetch c1 into cnumber;
   if c1%notfound then
   dbms_output.put_line(cnumber);
     dbms_output.put_line('not exist');
     dbms_output.put_line(date_in);
     dbms_output.put_line('in date and time is'||date_in||' '||time_in);
     final_date:=date_in||' '||time_in;
     dbms_output.put_line(final_date);
     update NCSS_TEMP_BKP_DUMP2 set DATE_TIME=to_date(date_in,'DD/MM/YY'),IN_TIME=time_in,IN_DATE=TO_DATE(final_date, 'DD/MON/YY hh24:mi:ss') where to_date(DB_DATE,'DD-MON-RR')=date_in and EMPID=id_in;
     commit;
      DBMS_OUTPUT.PUT_LINE('successfully inserted');
      addzero(date_in,id_in);
     commit;
     else
     DBMS_OUTPUT.PUT_LINE('record exist');
     dbms_output.put_line(date_in);
     dbms_output.put_line('in date and time is'||date_in||' '||time_in);
     final_date:=date_in||' '||time_in;
     dbms_output.put_line(final_date);
     
     update NCSS_TEMP_BKP_DUMP2 set out_time=time_in, out_date=TO_DATE(final_date, 'DD/MON/YY hh24:mi:ss') where empid=id_in 

and to_date(date_time,'DD-MON-RR')=date_in;
     DBMS_OUTPUT.PUT_LINE('successfully updated');
     COMMIT;
     wish(date_in,id_in);
      end if;
   commit;
   close c1;
END;

adding zero
======

create or replace procedure addzero(date_in IN NCSS_TEMP_BKP_DUMP2.DATE_TIME%TYPE,id_in NCSS_TEMP_BKP_DUMP2.EMPID%TYPE)
is
s1 varchar2(5);
s2 number(5);
s3 number(5);
s4 varchar2(15);
cursor c_emp is select substr(in_time,1,1) s7,IN_TIME from NCSS_TEMP_BKP_DUMP2 where empid=id_in and to_date(DB_DATE,'DD-MON-RR')=date_in;
 r_emp c_emp%ROWTYPE;
begin
open c_emp;
fetch c_emp into r_emp;
dbms_output.put_line(r_emp.s7);
s2:=TO_NUMBER(r_emp.s7);
if(s2>0) then

s4:='0'||r_emp.in_time;
dbms_output.put_line('0'||s2);
dbms_output.put_line(s4);
update NCSS_TEMP_BKP_DUMP2 set IN_TIME=s4 where to_date(DB_DATE,'DD-MON-RR')=date_in and EMPID=id_in;
commit;
end if;
close c_emp;
end;


