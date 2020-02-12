SELECT * FROM EMP
WHERE deptno = 10 OR deptno = 20;
SELECT * FROM EMP
WHERE deptno IN (10, 20);
SELECT * FROM emp;

-- ex) 	job이 SALESMAN 이거나, MANAGER인 경우
--		사원번호, 이름, 직책 출력
SELECT * FROM emp
WHERE job IN ('SALESMAN', 'MANAGER');

SELECT EMPNO, ENMAE, DEPTNO, SAL
FROM EMP
WHERE (DEPTNO, SAL)
	IN(SELCT DEPTNO, MAX(SAL)
		FROM EMP GROUP BY DEPTNO);
SELECT DEPTNO, MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

/*
# KEYWORD 검색시, 활용하는 LIKE 연산자
1. LIKE 연산자 : 컬럼에 저장된 문자열중에서 문자 패턴과 부분적으로 일치하면 TRUE
2. 기본형식
	1) 컬럼명 LIKE '%검색할문자%'
	2) 컬럼명 LIKE '_검색할키워드_'
		"_(언더바)"를 이용하여 글자의 위치까지 제한하여 검색 가능
*/

SELECT * FROM emp;
-- JOB 컬럼의 내용이 MAN을 포함하면 출력
SELECT * FROM EMP
WHERE JOB LIKE '%MAN%';
-- EX) JOB 컬럼의 내용이 MAN으로 끝나면 출력
SELECT * FROM EMP
WHERE job LIKE '%MAN';
-- EX) ENAME에서 'A'로 시작하는 글자와 'A'를 포함하는 글자가 있는 데이터를 구분하여 출력
SELECT * FROM EMP
WHERE ename LIKE 'A%';
SELECT * FROM EMP
WHERE ENAME LIKE '%A%';
SELECT *
FROM EMP
WHERE job LIKE '_A%';	-- 특정한 위치의 특정한 문자까지 제한
-- EX) ename이나 job의 마지막에서 두번 째 글자가 E인 데이터 출력
SELECT * FROM EMP
WHERE job LIKE '%E_';

/*
# NULL
	1. 미확인 값이나 아직 값이 적용되지 않은 것
	2. 0이나 " (공백-스페이스)"와는 다름, 정의 되지 않은 값
	3. NULL과 다른 값의 연산 결과는 NULL
		SELECT NULL+SAL ==> NULL
	4. SELECT 숫자형 데이터일 때, NULL과 연산 결과는 NULL
		**** 0과 반드시 구분할 것
	5.	WHERE 컬럼명 IS NULL;
		WHERE 컬럼명 IS NOT NULL;
	6. NULL일 때, 지정된 값으로 처리 : NVL(param1, param2)
		1) param1 : 처리할 데이터
		2) param2 : param1에 있는 데이터가 null일 때 나타날 데이터
			**** param1과 param2의 데이터 type은 동일해야 함, 유형이 다를 땐 형변환!
**/

SELECT ename, sal, comm, sal+comm
FROM EMP;
SELECT ename, sal, comm, sal+nvl(comm,0) "총합"
FROM EMP;

-- ex) @@@님의 관리자 번호는 @@입니다. 관리자 번호가 없을 때 최고 관리자라고 표시

SELECT ename||'님의 관리자 번호는 '||NVL(''||MGR,'최고관리자')||'입니다.' show
FROM EMP;

-- nvl 함수는 형변환시, 두번 째 매개변수의 값과 일치하는 type으로 설정

SELECT ename||'님의 관리자 번호는 '||MGR||'입니다.' show01
FROM EMP
WHERE mgr IS NOT NULL

SELECT ename||'님은 최고 관리자입니다.' show02
FROM EMP
WHERE mgr IS NULL;

/*
# 집합연산자
	1. 테이블을 구성하는 행집합에 대해 테이블의 부분 집합을 결과로 반환하는 연산자
	2. 집합 연산의 대상이 되는 두 테이블의 컬럼수가 같고, 대응되는 컬럼끼리 데이터 타입이 동일할 때 활용 가능
	3. 기본 형식
		SELECT 명령문1
		UNION, UNION ALL, INTERSECT, MINUS
		SELECT 명령문2
	4. 집합 연산자 종류
		1) union 		: 두 집합에 대해 중복되는 행을 제외한 합집합
		2) UNION ALL 	: 두 집합에 대해 중복되는 행을 포함한 합집합
		3) MINUS 		: 두집합간의 차집합
		4) INTERSECT 	: 두집합간의 교집합
**/

CREATE TABLE emp2
AS SELECT * FROM emp
WHERE deptno=10;
SELECT * FROM emp2;
INSERT INTO emp2 values(7999,'홍길동','사원',7839,sysdate,3000,NULL,40);

SELECT * FROM emp
UNION
SELECT * FROM emp2;

SELECT * FROM emp
UNION ALL
SELECT * FROM emp2;

SELECT * FROM EMP
MINUS
SELECT * FROM emp2;

SELECT * FROM emp
INTERSECT
SELECT * FROM emp2;