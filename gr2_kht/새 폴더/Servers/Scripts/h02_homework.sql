/*
1. 함수의 유형 2가지형으로 분류하고, 예제
	- 단일행 함수 - 하나의 데이터에서 하나의 결과물을 출력하는 함수
					ex) nvl
	- 복수행 함수 - 여러 데이터 중에서 조건에 맞는 하나의 데이터를 출력하는 함수
					ex) max

*/
SELECT * FROM emp;
SELECT empno, ename, nvl(comm,0)
FROM emp;
SELECT max(sal)
FROM emp;


/*
2. 문자함수의 종류 3가지와 대표적인 함수 내용
	1) 대소문자 변환 함수 : initcap, lower, upper
	2) 문자조작함수 :concat, substr, instr, lpad, rpad, ltrim, rtrim
	3) 문자열 길이반환 함수: length, lengthb
*/

/*
3. length, lengthb 함수의 차이점 기술
	- length	: 데이터의 문자 갯수 출력
	- lengthb	: 데이터의 byte 용량 출력
*/

SELECT lengthb(ename), length(ename)
FROM emp;

/*
4. 다음과 같은 데이터를 출력하기 위해, 함수 적용하여
	- 조회 데이터 job의 er => 대소문자 구분 없이 조회
		Smith의 사번 7369, 직책은 Clerk
*/

SELECT ename||'의 사번 '||empno||', 직책은 '||job
FROM emp
WHERE UPPER(job) LIKE UPPER('%er%');

/*
5. 2월에 입사한 사람을 사원번호, 입사일, 이름으로 출력
*/

SELECT empno, hiredate, ename
FROM emp
WHERE substr(hiredate,4,2)='02';


/*
6. job에 MAN으로 끝나는 데이터
*/

SELECT ename, job, rtrim(job, 'MAN')
FROM emp
WHERE job LIKE '%MAN';

/*
7. 사원명과 급여 출력 - SAL을 5자리로 만들어, 모자라는 자릿수는 ##800 형식으로 출력
*/

SELECT ename, lpad(sal, 5, '#')
FROM EMP;

/*
8. 숫자 함수를 올림과 내림, 반올림 기능으로 분류, 자릿수 처리 여부 출력
*/



/*
9. 사번이 홀수인 사원을 검색하되, 급여인 10단위로 절삭하여 사원번호 사원명 급여 출력
*/

SELECT empno, ename, round(sal,-2)
FROM emp
WHERE mod(empno,2)='1';

/*
10. 오늘로부터 100일 후는 몇일인지 dual 테이블을 통하여 출력
*/

SELECT sysdate+100
FROM dual;