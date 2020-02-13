/*

# subquery로 테이블 생성
	1. create table 명령문에서 sql을 실행하는 구분을 사용하여
		테이블의 구조와 데이터를 복사하여 새로운 테이블을 생성할 수 있다
	2. 기존에 있는 테이블의 구조와 데이터를 한꺼번에 생성 가능
	3. 무결성 제약 조건은 not null만 복사 됨

 */

DROP TABLE emp3;
DROP TABLE emp4;
DROP TABLE emp5;

CREATE TABLE emp3
AS
SELECT * FROM emp;

CREATE TABLE emp4
AS
SELECT empno NO, ename||'          ' name, to_char(hiredate, 'YYYY/MM/DD') hirestr, sal, sal+nvl(comm,0) tot
FROM emp;

SELECT * FROM emp4;

/*
	ex) 사원번호, 사원명, 직책, 관리자번호, 급여로 새로운 테이블
 */

SELECT * FROM emp;

CREATE TABLE emp5
AS
SELECT empno "사원번호", ename "사원명", job "직책", mgr "관리자번호", sal "급여"
FROM emp;

SELECT * FROM emp5;

CREATE TABLE emp6
AS
SELECT deptno, count(*) cnt, max(sal) mxsal, min(sal) mnsal, avg(sal) avgsal
FROM EMP
GROUP BY deptno;
SELECT * FROM emp6;

CREATE TABLE emp7
AS
SELECT * FROM emp
WHERE 1 = 0;	-- 조건이 FALSE이기에 데이터는 로딩 되지 않음 => 데이터는 복사 되지 않고, 구조만 복사하는거
SELECT * FROM emp7;

SELECT * FROM emp;