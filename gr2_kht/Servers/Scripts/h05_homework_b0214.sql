CREATE TABLE emp18
AS
SELECT * FROM emp;

SELECT * FROM emp;

UPDATE emp18
SET sal=sal*1.2
WHERE deptno=30;

SELECT * FROM emp18
ORDER BY sal DESC;

UPDATE emp18
SET sal=5000
WHERE sal=min(sal);

/*
1. DML이란 무엇인지, 대표적인 명령어 3개와 예제

	- 데이터를 입력, 수정, 삭제를 하기 위한 명령어
	- INSERT - INSERT INTO exp_emp15(NO, name, sal) VALUES(20720646, 'HYEONTAE', 10000);
	- UPDATE - UPDATE exp_emp15 SET empno=20720000 WHERE ename='HYEONTAE';
	- DELETE - DELETE exp_emp15 WHERE ename='HYEONTAE';
------------------------------------------------------------------------------------------
2. DML을 통해 처리되는 트랜잭션 commit, rollback의 사용 시점

	- 수정한 내용을 commit을 통해 데이터베이스에 등록
	- commit을 하기 전에는 수정 내용이 데이터베이스에 등록이 되지 않음
	- commit 하기 전까지 rollback을 통해 이 전에 저장된 내용으로 되돌릴 수 있음
------------------------------------------------------------------------------------------
3. 테이블을 입력시 단일행 입력과 다중행 입력의 차이점과 예제

	- 단일행 입력은 한 번에 하나의 행을 입력
		- 	INSERT INTO exp_emp15 VALUES(20720646, 'HYEONTAE', 10000);
	- 다중행 입력을 subquery를 이용하여 테이블에 여러행을 동시에 입력
		- 	INSERT INTO exp_emp15
			SELECT empno, ename, sal FROM emp WHERE depno=10;

------------------------------------------------------------------------------------------
4. 테이블 복사시, where 1=0;은 어떤 의미를 가지는가

	- TRUE가 존재할 수 없는 조건으로 TRUE 값을 찾고 있으므로, 무조건 FALSE
	- 테이블의 구조만 복사하고, 데이터는 가져오지 않는다
------------------------------------------------------------------------------------------
5. emp18 테이블 복사, 부서번호가 30인 사원의 급여를 20% 인상 처리

	- UPDATE emp18 SET sal=sal*1.2 WHERE deptno=30;
------------------------------------------------------------------------------------------
6. emp18 테이블에서 가장 낮은 sal를 가장 높은 sal로 변경


7. 1000으로 시작하여 10단위로 증가하는 sequence 생성하고, emp18의 현재 최저 연봉을 수정
8. emp 테이블에 empno(사원번호)와 mgr(관리자번호)이 연계가 되어 있음
	emp 테이블을 이용하여 @@@의 관리자는 @@@(관리자명)을 출력
9. job별 최저 연봉자의 정보 출력
10. salgrade를 이용하여 급여 등급이 1등급인 사원을 출력
*/