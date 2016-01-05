NCSS_TEMP_BKP_DUMP1

step 1:create master table for getting employee id 


create table Emp_master_bio(empid varchar2(20),
fullid varchar2(30),
name varchar2(50),
date_of_join date,
dummy1 varchar2(20),
dummy2 varchar2(20));

step 2:create table for biometric data storing

create table NCSS_TEMP_BKP_DUMP1(
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
status varchar2(50),
remarks varchar2(50));






step3:taking employee id and passing daysinamonth procedures

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

step4:getting empid and performing for loop for monthly sheet



create or replace procedure daysinmonth(in_empid in varchar2,in_fullid ) is
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
        insert into NCSS_TEMP_BKP_DUMP1(s_no,db_date,empid,fullid ) values(a,d_date,in_empid,in_fullid );
        commit;
         d_date:=d_date+1;
end loop;
       close c_emp;
       close d_emp;
   end;


step 5:develop original biometric procedure

create or replace Procedure biometricprocedure
   ( date_in IN NCSS_TEMP_BKP_DUMP1.DATE_TIME%TYPE,id_in NCSS_TEMP_BKP_DUMP1.EMPID%TYPE,time_in varchar2)  
IS
   cnumber varchar2(30);
   final_date varchar2(30);
   cursor c1 is
   SELECT empid FROM NCSS_TEMP_BKP_DUMP1 where DATE_TIME=date_in and empid=id_in;
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
     update NCSS_TEMP_BKP_DUMP1 set DATE_TIME=to_date(date_in,'DD/MM/YY'),IN_TIME=time_in,IN_DATE=TO_DATE(final_date, 

'DD/MON/YY hh24:mi:ss') where to_date(DB_DATE,'DD-MON-RR')=date_in and EMPID=id_in;
      DBMS_OUTPUT.PUT_LINE('successfully inserted');
     commit;
     else
     DBMS_OUTPUT.PUT_LINE('record exist');
     dbms_output.put_line(date_in);
     dbms_output.put_line('in date and time is'||date_in||' '||time_in);
     final_date:=date_in||' '||time_in;
     dbms_output.put_line(final_date);
     
     update NCSS_TEMP_BKP_DUMP1 set out_time=time_in, out_date=TO_DATE(final_date, 'DD/MON/YY hh24:mi:ss') where empid=id_in 

and to_date(date_time,'DD-MON-RR')=date_in;
     DBMS_OUTPUT.PUT_LINE('successfully updated');
     COMMIT;
     dump_night(date_in,id_in);
      end if;
   commit;
   close c1;
END;



step 6: develop the dump_night procedure for calculating status


create or replace procedure dump_night(date_in IN NCSS_TEMP_BKP_DUMP1.DATE_TIME%TYPE,id_in 

NCSS_TEMP_BKP_DUMP1.EMPID%TYPE)
is
status1 varchar2(50);
status2 varchar2(50);
cursor c1 is
select empid,date_time,in_time,out_time, to_char(to_date('00:00','HH24:MI') +(out_date - in_date), 'HH24:MI') timediff from
NCSS_TEMP_BKP_DUMP1 where to_date(date_time,'DD-MON-RR')=date_in;

r_emp c1%ROWTYPE;
begin 
  open c1;
  loop
  fetch c1 into r_emp;
  exit when c1%NOTFOUND;
  status1:='early going';
  status2:='fine';
  dbms_output.put_line('calling dumb_night');
  dbms_output.put_line('hours is'|| r_emp.timediff);
  if r_emp.timediff < '09:00' then
     update NCSS_TEMP_BKP_DUMP1 set DIFFERENCE=r_emp.timediff,status=status1 where empid=r_emp.empid and to_char

(date_time,'DD-MON-YY')=r_emp.date_time;
     dbms_output.put_line('updated in dumb_night');
     commit;
     else
      update NCSS_TEMP_BKP_DUMP1 set DIFFERENCE=r_emp.timediff,status=status2 where empid=r_emp.empid and to_char

(date_time,'DD-MON-YY')=r_emp.date_time;
     dbms_output.put_line('updated in dumb_night');
     commit;
     end if;
     
     end loop;
       close c1;
   end;

