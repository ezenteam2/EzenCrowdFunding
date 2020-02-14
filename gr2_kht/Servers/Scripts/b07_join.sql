/*
# JOIN
	1. 두개 이상의 테이블을 특정 컬럼을 기준으로 연결하여 처리
	2. 한번에 연관된 두개 테이블의 연관 컬럼을 기준으로 하여, 출력 처리
	3. 기본 형식
		select a.*, b.*					-- a.* emp테이블에 소속한 컬럼들 출력
		from emp a, dept b				-- 테이블 이름을 a, bfh 별칭 선언
		where a.deptno = b.deptno		-- 두개의 테이블에 연관된 column으로 조인처리
*/

SELECT * FROM emp;
SELECT * FROM dept;

-- 사원번호가 7369인 사람의 부서명 조회
SELECT * FROM EMP
WHERE empno = 7369;	--deptno=20 확인
SELECT * FROM DEPT
WHERE deptno=20;

SELECT a.*, b.*
FROM emp a, dept b
WHERE a.deptno = b.deptno;

-- 부서명, 사원명, 직책
SELECT b.deptno, b.dname, a.ename, a.job
FROM emp a, dept b
WHERE a.deptno = b.deptno;

-- ex) 	직급테이블을 구성, emp17에 특정 컬럼 추가
--		사원, 대리, 과장, 차장, 부장, 이사, 대표로 해당 직급으로 join관계를 만들어
--		사원명, 직급명, 직책(job) 출력

SELECT * FROM emp17;

CREATE TABLE posi(
	NO number PRIMARY KEY,
	grade varchar(10)
	);

DROP TABLE posi;

CREATE SEQUENCE posi_seq
	INCREMENT BY 100
	START WITH 100
	MAXVALUE 1000;
	
/*
# NON-EQUI JOIN
	** EQUI JOIN	- 특정한 데이터가 동일한 조건에 해당할 때 처리
	1. NON-EQUI JOIN- 특정한 범위에 해당할 때, JOIN관계 mapping
*/

SELECT *
FROM salgrade;

SELECT ename, sal, grade	-- 컬럼이 동일하지 않으면 테이블 alias 생략 가능
FROM emp a, salgrade b
WHERE sal BETWEEN losal AND hisal;

/*
# OUTER JOIN
	테이블 dept를 기준으로 할당된 인원을 확인하고자 할 때,
	할당되지 않은 부서도 출력하고자 할 때
	해당 테이블의 컬럼명에 (+) 처리
 */ 

SELECT * FROM dept;					-- dept 테이블에는 4개의 종류가 있으나
SELECT DISTINCT deptno FROM emp;	-- 실제 emp 테이블에는 3가지 밖에 사용되지 않음

SELECT emp.empno, emp.ename, dept.deptno, dept.dname
FROM emp, dept
WHERE emp.deptno(+)=dept.deptno;	-- 할당되지 않은 40도 함께 보여줌

