create table NCSS_TEMP_BKP_DUMP3(
S_NO	VARCHAR2(10),
DB_DATE	DATE,
DB_WEEKDAY	VARCHAR2(15),
DATE_TIME	DATE,
EMPID	VARCHAR2(20),
FULLID	VARCHAR2(30),
IN_TIME	VARCHAR2(20),
IN_DATE	DATE,
OUT_TIME	VARCHAR2(20),
OUT_DATE	DATE,
DIFFERENCE	VARCHAR2(30),
STATUS	VARCHAR2(50),
REMARKS	VARCHAR2(50));




CREATE OR REPLACE procedure ESS_DEV.getempid is
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
/




CREATE OR REPLACE procedure ESS_DEV.daysinmonth(in_empid in varchar2,in_fullid varchar2 ) is
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
        insert into NCSS_TEMP_BKP_DUMP3(s_no,db_date,empid,fullid ) values(a,d_date,in_empid,in_fullid );
        commit;
         d_date:=d_date+1;
end loop;
       close c_emp;
       close d_emp;
   end;
/




create or replace procedure addzero(date_in IN NCSS_TEMP_BKP_DUMP3.DATE_TIME%TYPE,id_in NCSS_TEMP_BKP_DUMP3.EMPID%TYPE)
is
s1 varchar2(5);
s2 number(5);
s3 number(5);
s4 varchar2(15);
man_time varchar2(15);
status1 varchar2(75);
status2 varchar2(75);
cursor c_emp is select IN_TIME from NCSS_TEMP_BKP_DUMP3 where empid=id_in and to_date(DB_DATE,'DD-MON-RR')=date_in;
 r_emp c_emp%ROWTYPE;
begin
open c_emp;
fetch c_emp into r_emp;
status1:='early coming';
status2:='late coming';
dbms_output.put_line(r_emp.in_time);
s3:=(INSTR (r_emp.IN_TIME, ':'));
if(s3=2) then 
dbms_output.put_line('0'||s3);
man_time:='0'||r_emp.in_time;
dbms_output.put_line(man_time);
update NCSS_TEMP_BKP_DUMP3 set in_time= man_time,STATUS= status1 where to_date(DB_DATE,'DD-MON-RR')=date_in and EMPID=id_in;
commit;
else 
dbms_output.put_line(r_emp.in_time);
update NCSS_TEMP_BKP_DUMP3 set STATUS= status2 where to_date(DB_DATE,'DD-MON-RR')=date_in and EMPID=id_in;
dbms_output.put_line('above is that the values ');
end if;
close c_emp;
end;





create or replace procedure wish(date_in IN NCSS_TEMP_BKP_DUMP3.DATE_TIME%TYPE,id_in NCSS_TEMP_BKP_DUMP3.EMPID%TYPE)
is
status1 varchar2(50);
status2 varchar2(50);
status3 varchar2(50);
status4 varchar2(50);
status5 VARCHAR2(50);
main_in number(15);
pro_status1 varchar2(75);
out_status1 varchar2(75);
out_status2 varchar2(75);
out_status3 varchar2(75);
cursor c1 is
select empid,date_time,in_time,out_time,status,to_char(to_date('00:00','HH24:MI') +(out_date - in_date), 'HH24:MI') timediff from
NCSS_TEMP_BKP_DUMP3 where to_date(date_time,'DD-MON-RR')=date_in and empid=id_in;
r_emp c1%ROWTYPE;
begin 
  open c1;
  loop
  fetch c1 into r_emp;
  exit when c1%NOTFOUND;
   status1:='timings is good';
  status2:='early going maitained 9 hours';
  status5:='and early going';
  dbms_output.put_line('result from table is'||r_emp.status);
  
  
  dbms_output.put_line('hours is'|| r_emp.timediff);
  dbms_output.put_line('in time is'|| r_emp.in_time);
  dbms_output.put_line('out time is'|| r_emp.out_time);
  if(r_emp.out_time>'19:00:00' and r_emp.timediff>='09:00') then
  out_status1:=status1;
  
  update NCSS_TEMP_BKP_DUMP3 set DIFFERENCE=r_emp.timediff,remarks=out_status1 where empid=r_emp.empid and to_char(date_time,'DD-MON-YY')=r_emp.date_time;
   dbms_output.put_line(out_status1);
  commit;
  
   
   elsif(r_emp.out_time<'19:00:00' and r_emp.timediff>='09:00') then
              out_status2:=status2;
              
              update NCSS_TEMP_BKP_DUMP3 set DIFFERENCE=r_emp.timediff,remarks=out_status2 where empid=r_emp.empid and to_char(date_time,'DD-MON-YY')=r_emp.date_time;
              dbms_output.put_line(out_status2);
  commit;
                 
   elsif(r_emp.out_time<'19:00:00' and r_emp.timediff<'09:00' ) then
   out_status3:=status5;
   
     dbms_output.put_line(out_status3);
     update NCSS_TEMP_BKP_DUMP3 set DIFFERENCE=r_emp.timediff,remarks=out_status3 where empid=r_emp.empid and to_char(date_time,'DD-MON-YY')=r_emp.date_time;
     
  commit;   
     end if;
     
     end loop;
       close c1;
   end;














create or replace Procedure biometricprocedure5
   ( date_in IN NCSS_TEMP_BKP_DUMP3.DATE_TIME%TYPE,id_in NCSS_TEMP_BKP_DUMP3.EMPID%TYPE,time_in varchar2)  
IS
   cnumber varchar2(30);
   final_date varchar2(30);
   in_char varchar2(10);
   cursor c1 is
   SELECT empid FROM NCSS_TEMP_BKP_DUMP3 where DATE_TIME=date_in and empid=id_in;
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
     update NCSS_TEMP_BKP_DUMP3 set DATE_TIME=to_date(date_in,'DD/MM/YY'),IN_TIME=time_in,IN_DATE=TO_DATE(final_date, 'DD/MON/YY hh24:mi:ss') where to_date(DB_DATE,'DD-MON-RR')=date_in and EMPID=id_in;
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
     
     update NCSS_TEMP_BKP_DUMP3 set out_time=time_in, out_date=TO_DATE(final_date, 'DD/MON/YY hh24:mi:ss') where empid=id_in 

and to_date(date_time,'DD-MON-RR')=date_in;
     DBMS_OUTPUT.PUT_LINE('successfully updated');
     COMMIT;
     wish(date_in,id_in);
      end if;
      DBMS_OUTPUT.PUT_LINE('finally');
   commit;
   close c1;
END;






create or replace Procedure biometricprocedure5
   ( date_in IN NCSS_TEMP_BKP_DUMP3.DATE_TIME%TYPE,id_in NCSS_TEMP_BKP_DUMP3.EMPID%TYPE,time_in varchar2)  
IS
   cnumber varchar2(30);
   final_date varchar2(30);
   in_char varchar2(10);
   cursor c1 is
   SELECT empid FROM NCSS_TEMP_BKP_DUMP3 where DATE_TIME=date_in and empid=id_in;
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
     update NCSS_TEMP_BKP_DUMP3 set DATE_TIME=to_date(date_in,'DD-MON-YY'),IN_TIME=time_in,IN_DATE=TO_DATE(final_date, 'DD-MON-YY hh24:mi:ss') where to_date(DB_DATE,'DD-MON-RR')=date_in and EMPID=id_in;
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
     
     update NCSS_TEMP_BKP_DUMP3 set out_time=time_in, out_date=TO_DATE(final_date, 'DD-MON-YY hh24:mi:ss') where empid=id_in 

and to_date(date_time,'DD-MON-RR')=date_in;
     DBMS_OUTPUT.PUT_LINE('successfully updated');
     COMMIT;
     wish(date_in,id_in);
      end if;
      DBMS_OUTPUT.PUT_LINE('finally');
   commit;
   close c1;
END;






