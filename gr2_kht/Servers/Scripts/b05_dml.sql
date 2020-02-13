/*
# 데이터 조작어 (DML:Data Manipulation Language)
	1.	테이블에데이터를 입력(INSERT), 수정(UPDATE) 또는 삭제(DELETE)하기 위한 명령어
	2.	종류
		1) INSERT	: 새로운 데이터 입력
		2) UPDATE	: 기존 데이터 수정
		3) DELETE	: 기존 데이터 삭제
		4) MERGE	: 두개의 테이블을 하나의 테이블로 병합
	3. 트랜잭션
		1) 여러 개의 명령문을 하나의 논리적이 작업단위로 처리
		1) 명령문
			COMMIT		: 트랜잭션의 정상적인 종료
			ROLLBACK	: 트랜잭션의 비정상적인 종료를 복구 - COMMIT 전에 처리 가능한 명령어

# 데이터 입력
	1.	INSERT 사용
	2.	데이터 입력 방법
		1)  단일 행 입력	: 한 번에 하나의 행을 테이블에 입력
		2)	다중 행 입력	: 서브쿼리를 이용하여 한 번에 여러행을 동시에 입력
	3.	단일행 입력 명령어
		1) 사용법
			INSERT INTO 테이블명(컬럼명1, 컬럼명2,....) VALUES (데이터1, 데이터2);
								***컬럼명은 optional			****컬럼명을 지정한경우, 지정한 컬럼에 데이터 입력
																지정하지 않으면, 테이블의 컬럼 순서대로 반드시 모든 데이터 입력해야 함
*/

CREATE TABLE emp14
AS SELECT * FROM emp;

SELECT * FROM emp14;
DROP TABLE emp14;

INSERT INTO emp14(empno, ename, sal, deptno) VALUES (7666, 'HYEONTAE', 8000, 40);
-- 지정된 컬럼에 데이터 입력시, 지정하지 않은 컬럼은 NULL로 할당

INSERT INTO emp14 VALUES (7321, 'GARI', 'MANAGER', 7777, '2010-08-11', 10000, 100, 20);

CREATE TABLE EXP_EMP15 (
	NO NUMBER,
	NAME VARCHAR(20),
	ROLE VARCHAR(20),
	HIREDATE DATE,
	SAL NUMBER
	);

INSERT INTO exp_emp15(NO, name, sal) VALUES(20720646, 'HYEONTAE', 10000);
INSERT INTO exp_emp15 VALUES (20720647, 'AMUGAE', 'JJOLEV', '2007-03-02', 5000);
INSERT INTO exp_emp15 VALUES (20720648, 'JOHN', NULL, NULL, NULL);

SELECT * FROM exp_emp15;

/*
# 날짜형 데이터 입력 방법
	1) sysdate - 현재 날짜와 시간 입력
	2) to_date('날짜문자열입력', '형식')		ex) to_date('20070302', 'YYYY-MM-DD')
*/
INSERT INTO exp_emp15(hiredate) VALUES(to_date('20060302', 'YYYY/MM/DD'));

/*
# 데이터 입력
	4. 다중행 입력
		1) INSERT 명령문에서 서브쿼리 절을 이용하여 자신 테이블이나 다른 테이블에 데이터를 복사하여 여러행을 동시에 입력
		2) INSERT 명령문에 VALUES 대신 서브쿼리에서 겁색된 집합을 한번에 입력
		3) 사용법
			INSERT INTO 입력할테이블
			subquery
*/

CREATE TABLE emp16
AS SELECT * FROM emp;
SELECT * FROM emp16;
DROP TABLE emp16;

/*
# 데이터 수정
	1. update 명령문은 테이블에 저장된 데이터 수정을 위한 조작어
	2. where를 생략하면 테이블의 모든 행을 수정
	3. 사용방법
		update 테이블명
		set	컬럼1이름 = 데이터,
			컬럼2이름 = 데이터,
			컬럼3이름 = 데이터
		where 조건;
*/

UPDATE exp_emp15
SET ROLE = 'MASTER'
WHERE NO=20720646;

SELECT * FROM exp_emp15;

-- 직책이 SALESMAN 인 사람의 급여를 10%인상
UPDATE emp16
SET sal = sal*1.1
WHERE job='SALESMAN';

-- 부서번호가 20인 사원의 입사일을 하루 늦추고, 보너스를 100으로 수정
UPDATE emp16
SET hiredate = hiredate+1,
	comm = 100
WHERE deptno=20;

SELECT * FROM emp16;

-- ex1) job이 CLERK이고 부서번호가 20인 사람의 SAL과 COMM을 각각 20% 인상
UPDATE emp16
SET sal = sal*1.2,
	comm = comm*1.2
WHERE job='CLERK';

UPDATE emp16
SET comm=97
WHERE ename='BLAKE';

-- ex2) comm이 null이거나 0인 데이터를 sal의 15%를 comm으로 지정, hiredate를 2000-01-01로 변경
UPDATE emp16
SET comm = sal*0.15,
	hiredate = to_date('2000-01-01','YYYY-MM-DD')
WHERE comm IS NULL OR comm = 0;