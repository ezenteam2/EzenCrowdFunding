/*
#SQL 연습 과제
1. 	부서 10과 30에 속하는 모든 사원의
	이름과 부서번호를
	이름과 알파벳 순으로 정렬
*/

SELECT ename, deptno
FROM emp
ORDER BY ename ASC;


/*
2. 	1982년도에 입사한 모든 사원의
	이름과 입사일 출력
*/

SELECT ename, hiredate
FROM emp
WHERE hiredate LIKE '1982%';

/*
3. 	보너스를 받는 모든 사원의
	이름, 급여, 보너스 출력
	급여와 보너스는 내림차순 정렬
*/

SELECT ename, sal, nvl(comm,0)
FROM emp
ORDER BY sal DESC, comm DESC;

/*
4. 	보너스가 급여의 20% 이상이고, 부서번호가 30인 모든 사원의
	이름, 급여, 보너스 출력
*/

SELECT ename, sal, nvl(comm,0)
FROM EMP
WHERE (comm>=(sal*0.2)) AND (deptno=30);

/*
5. select 문을 이용해서  사원의 급여와 10%보너스를 합산해서
	사원번호, 사원명, 급여를 출력할려고 한다. 
	sql를 작성하세요.
*/

SELECT empno, ename, (sal*1.1) 급여
FROM emp;

/*
7. emp 테이블에 있는 직책(job)의 종류를 리스트할려고 한다.
sql문을 작성하세요.
*/
SELECT DISTINCT(job)
FROM emp;

/*
9. sql을 이용하여 
 @@번 부서의  사원 @@@(사원번호)의 현재 연봉은 @@ 만원입니다.
 를 한 라인으로 출력하되, 연봉이 3000이상인 사원만 출력되게 하세요.
*/
SELECT deptno||'번 부서의 사원 '||empno||'의 현재 연봉은 '||sal||'만원입니다.'
FROM emp
WHERE sal>=3000;

/*
10. 연봉이 1000에서 2000사이가 아닌 사원 모두를 사원번호
사원명, 연봉으로 출력하세요. 
*/ 

SELECT ename, sal
FROM EMP
WHERE not(sal>=1000 AND sal<=2000);


CREATE TABLE emp3
AS SELECT * FROM emp
WHERE deptno=10;
SELECT * FROM emp3;
