SELECT * FROM emp;

/*
# 정렬 (sorting)
	1. SQL 명령문에서 검색된 결과는 테이블에 데이터가 입력된 순서로 출력
		ex) 사원번호 오름차순/내림차순을 정렬해서 출력
		ex) 급여순서로 오름차순/내림차순 정렬해서 출력
	2. 형식
		order by 정렬할 컬럼 desc/asc
*/

SELECT empno, ename
FROM emp
ORDER BY empno DESC;

SELECT empno, ename
FROM emp
ORDER BY empno ASC;

-- ex) 입사일을 기준으로 최근 입사한 사람부터 출력
SELECT ename, hiredate
FROM emp
ORDER BY hiredate DESC;

-- ex) ename 기준 오름차순, job 기준 내림차순
SELECT deptno, ename, job
FROM emp
ORDER BY deptno ASC, job DESC;
