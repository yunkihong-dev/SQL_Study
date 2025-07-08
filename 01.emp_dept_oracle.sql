/*
 * 1. 정교한 데이터 저장 및 관리하는 솔루션
 * 2. 소통 언어 : sql
 * 3. 용어
 * 		컬럼(속성) : 데이터(하나 하나의 데이터 의미)
 * 		row  : 가로 행의 구조를 의미
 * 				사원 table의 경우 한 사원의 모든 정보를 하나의 row
 * 		레코드 : row 또는 속성값 하나  자체를 레코드라고도 함
 * 
 */

-- dept table 생성
-- 한부서 표현 속성 : 부서번호(중복불허)/ 부서명 / 지역 
CREATE TABLE dept (
    deptno               number(4)  NOT NULL,
    dname                varchar2(20),
    loc                  varchar2(20),
    CONSTRAINT pk_dept PRIMARY KEY (deptno)
);
 

-- mysql에선 정상 실행, DBeaver에서만 oracle db에 실행시 에러
-- 해결책 : 다른 툴 쓰면 정상 실행
DESC dept;



/*
 * 사본 중복불허, 검색 기준 데이터
 * - 기본 데이터(기본 키값)Primary Key
 * 
 * numebr(7,2) : 숫자 전체 7자리, 단 정수 최대 5자리, 소수점이하 2자리
 * number(4) : 전체 숫자 4자리
 * 
 * deptno
 */
CREATE TABLE emp (
    empno                number(4),
    ename                varchar2(20),
    job                  varchar2(20),
    mgr                  number(4),
    hiredate             date,
    sal                  number(7,2),
    comm                 number(7,2),
    deptno               number(4),
    CONSTRAINT pk_emp PRIMARY KEY (empno)
 );

/* emp의 deptno컬럼은 dept table의 deptno에 종속성 부여
 * 부서번호가 없는 부서에 속한 지구언은 존재 불가(제약으로설정)
 * 
 * - Data 정의 언어(DDL)
 * alter : 이미 존재하는 table의 구조 변경 명령어
 * create : table 생성
 * drop table : 이미 존재하는 table 영구 삭제
 * 
 * 주종관계(부모관계) : 주 - dept / 종 - emp
 * 결론 : dept에 존재하는 deptno값에 한해서만 emp의 deptno에 저장 가능
 * 
 */
SELECT * FROM emp;




-- 존재하는 table에 데이터 저장
insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
  
-- db는 자체적으로 데이터를 쉽게 가공가능하게 다양한 내장 함수들 제공
-- STR_TO_DATE() : 단순 문자열을 날짜 형식의 타입으로 변환하는 함수
-- mysql도 함수 내장 
INSERT INTO emp VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('17-11-1981','DD-MM-YYYY'), 5000, NULL, 10);
INSERT INTO emp VALUES (7698, 'BLAKE', 'MANAGER', 7839, TO_DATE('1-5-1981','DD-MM-YYYY'), 2850, NULL, 30);
INSERT INTO emp VALUES (7782, 'CLARK', 'MANAGER', 7839, TO_DATE('9-6-1981','DD-MM-YYYY'), 2450, NULL, 10);
INSERT INTO emp VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('2-4-1981','DD-MM-YYYY'), 2975, NULL, 20);
INSERT INTO emp VALUES (7788, 'SCOTT', 'ANALYST', 7566, TO_DATE('13-7-1987','DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO emp VALUES (7902, 'FORD', 'ANALYST', 7566, TO_DATE('3-12-1981','DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO emp VALUES (7369, 'SMITH', 'CLERK', 7902, TO_DATE('17-12-1980','DD-MM-YYYY'), 800, NULL, 20);
INSERT INTO emp VALUES (7499, 'ALLEN', 'SALESMAN', 7698, TO_DATE('20-2-1981','DD-MM-YYYY'), 1600, 300, 30);
INSERT INTO emp VALUES (7521, 'WARD', 'SALESMAN', 7698, TO_DATE('22-2-1981','DD-MM-YYYY'), 1250, 500, 30);
INSERT INTO emp VALUES (7654, 'MARTIN', 'SALESMAN', 7698, TO_DATE('28-09-1981','DD-MM-YYYY'), 1250, 1400, 30);
INSERT INTO emp VALUES (7844, 'TURNER', 'SALESMAN', 7698, TO_DATE('8-9-1981','DD-MM-YYYY'), 1500, 0, 30);
INSERT INTO emp VALUES (7876, 'ADAMS', 'CLERK', 7788, TO_DATE('13-7-1987','DD-MM-YYYY'), 1100, NULL, 20);
INSERT INTO emp VALUES (7900, 'JAMES', 'CLERK', 7698, TO_DATE('3-12-1981','DD-MM-YYYY'), 950, NULL, 30);
INSERT INTO emp VALUES (7934, 'MILLER', 'CLERK', 7782, TO_DATE('23-1-1982','DD-MM-YYYY'), 1300, NULL, 10);

   
commit;

SELECT * from emp;

select * from dept;
