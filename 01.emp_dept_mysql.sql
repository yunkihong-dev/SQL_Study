show databases;

-- 사용자 정의로 database 생성
-- DROP database fisa;
-- CREATE database fisa;

-- mysql 용 문장
-- fisa 라는 이름의 database 내부에 진입해 CRUD + DDL
-- CRUD(DML) : 존재하는 table에서 작업
-- DDL : table 생성, 삭제 ,구조 변경
-- fisa database에 접속 필수 
USE fisa;

-- 해당 database 내에 존재하는 table들 검색
show tables;


-- emp와 dept라는 table이 혹여 존재할 경우 삭제하는 명령어
drop table IF EXISTs emp; -- fisa 내부에서만 허용
drop table IF EXISTs dept; -- fisa database외부에서도 	변경 

-- dept table 생성
-- 한부서 표현 속성 : 부서번호(중복불허)/ 부서명 / 지역 
CREATE TABLE dept (
    deptno               int  NOT NULL,
    dname                varchar(20),
    loc                  varchar(20),
    CONSTRAINT pk_dept PRIMARY KEY (deptno)
);
 
CREATE TABLE emp (
    empno                int  NOT NULL  AUTO_INCREMENT,
    ename                varchar(20),
    job                  varchar(20),
    mgr                  int,
    hiredate             date,
    sal                  numeric(7,2),
    comm                 numeric(7,2),
    deptno               int,
    CONSTRAINT pk_emp PRIMARY KEY (empno)
 );

select * from emp;
 

ALTER TABLE emp 
ADD CONSTRAINT fk_emp_dept FOREIGN KEY (deptno) REFERENCES dept(deptno) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table emp change ename ename varchar(20) binary;


-- 존재하는 table에 데이터 저장
insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
  
-- db는 자체적으로 데이터를 쉽게 가공가능하게 다양한 내장 함수들 제공
-- STR_TO_DATE() : 단순 문자열을 날짜 형식의 타입으로 변환하는 함수
-- mysql도 함수 내장 
insert into emp values(7839, 'KING', 'PRESIDENT', null, 
                        STR_TO_DATE('17-11-1981','%d-%m-%Y'), 5000, null, 10);
insert into emp values(7698, 'BLAKE', 'MANAGER', 7839, STR_TO_DATE('1-5-1981','%d-%m-%Y'), 2850, null, 30);
insert into emp values(7782, 'CLARK', 'MANAGER', 7839, STR_TO_DATE('9-6-1981','%d-%m-%Y'), 2450, null, 10);
insert into emp values(7566, 'JONES', 'MANAGER', 7839, STR_TO_DATE('2-4-1981','%d-%m-%Y'), 2975, null, 20);
insert into emp values(7788, 'SCOTT', 'ANALYST', 7566, DATE_ADD(STR_TO_DATE('13-7-1987','%d-%m-%Y'), INTERVAL -85 DAY)  , 3000, null, 20);
insert into emp values(7902, 'FORD', 'ANALYST', 7566, STR_TO_DATE('3-12-1981','%d-%m-%Y'), 3000, null, 20);
insert into emp values(7369, 'SMITH', 'CLERK', 7902, STR_TO_DATE('17-12-1980','%d-%m-%Y'), 800, null, 20);
insert into emp values(7499, 'ALLEN', 'SALESMAN', 7698, STR_TO_DATE('20-2-1981','%d-%m-%Y'), 1600, 300, 30);
insert into emp values( 7521, 'WARD', 'SALESMAN', 7698, STR_TO_DATE('22-2-1981','%d-%m-%Y'), 1250, 500, 30);
insert into emp values( 7654, 'MARTIN', 'SALESMAN', 7698, STR_TO_DATE('28-09-1981','%d-%m-%Y'), 1250, 1400, 30);
insert into emp values( 7844, 'TURNER', 'SALESMAN', 7698, STR_TO_DATE('8-9-1981','%d-%m-%Y'), 1500, 0, 30);
insert into emp values( 7876, 'ADAMS', 'CLERK', 7788, DATE_ADD(STR_TO_DATE('13-7-1987', '%d-%m-%Y'),INTERVAL -51 DAY), 1100, null, 20);
insert into emp values( 7900, 'JAMES', 'CLERK', 7698, STR_TO_DATE('3-12-1981','%d-%m-%Y'), 950, null, 30);
insert into emp values( 7934, 'MILLER', 'CLERK', 7782, STR_TO_DATE('23-1-1982','%d-%m-%Y'), 1300, null, 10);
   
commit;

SELECT * from emp;

select * from dept;
