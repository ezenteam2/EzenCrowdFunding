/*
# subquery
	1. query에서 다른 query를 만들어 그 결과값을 기준으로 한번 더 조히하여 수정, 삭제, 입력 조건을 만드는 것
*/

/*
	ex) 급여가 가장 많은 사람의 정보 출력
		순서 : 	1. 최고 급여 출력
						SELECT max(sal) FROM emp;
				2. 최고 급여에 해당하는 사원의 정보 출력
						SELECT * FROM emp WHERE sal = 5000;

					==> 두개의 query를 subquery를 이용하여 출력
							SELECT *
							FROM EMP
							WHERE sal =(
								SELECT max(sal)
								FROM emp
							);

**/

SELECT * FROM emp;
SELECT *
FROM EMP
WHERE sal =(
	SELECT max(sal)
	FROM emp
);

-- ex1) 가장 최근에 입사한 사람의 사원 정보를 출력
SELECT *
FROM emp
WHERE hiredate =(
	SELECT max(HIREDATE)
	FROM emp
);


-- ex2) 평균 급여보다 많은 사원 정보 출력
SELECT *
FROM emp
WHERE sal >= (
	SELECT avg(sal)
	FROM emp
);


-- ex3) 부서별로 최고 급여자의 정보를 출력
SELECT *
FROM emp
WHERE (deptno, sal) IN (
	SELECT deptno, max(sal)
	FROM emp
	GROUP BY deptno
)
ORDER BY deptno ASC;		-- 부서에 대한 데이터도 뽑아내고, 급여에 대한 데이터도 뽑아 내서 (2개 칼럼), 두개 써야 함 (deptno, sal)
							-- 전체 칼럼을 출력해야 하므로
							-- 결과가 다중일 때는 IN을 설정한 subquery를 사용하고, 컬럼에 2개 이상 mapping 할 때는 (컬럼1, 컬럼2)
