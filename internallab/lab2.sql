create database storedproc;
use storedproc;
create table proc_student(id int,stud_name varchar(20),mark int,category varchar(20));
drop table proc_student;
call proc_grade(1,"sanal",1000);
call proc_grade(2,"shibili",995);
call proc_grade(3,"arjun",990);
call proc_grade(4,"arun",895);
call proc_grade(5,"adharsh",890);
select * from proc_student;

//stored procedure

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_grade`(id int,stud_name varchar(20),mark int)
BEGIN
if(mark<=1500 and mark>=900)
then
insert into proc_student values(id,stud_name,mark,"distinction");
end if;
if(mark<=989 and mark>=990)
then
insert into proc_student values(id,stud_name,mark,"first calss");
end if;
if(mark<=899 and mark>=825)
then
insert into proc_student values(id,stud_name,mark,"second class");
end if;
END