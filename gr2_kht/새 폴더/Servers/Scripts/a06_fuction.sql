/*
1. 숫자 데이터를 처리하기 위한 함수
2. 종류
	1) round : 지정한 소숫점 자리로 반올림 처리
		round(데이터, 자릿수)
		자릿수가 +값은 소숫점 이하 자리 수
		자리수가 -값은 소숫점 윗 자리 수
	2)
	3) mod : 나머지 처리 (데이터베이스에는 "%" 연산자가 음슴)
		mod(데이터m, n) : 데이터m을 n으로 나눈 나머지
		ex) mod(10, 3) => 1
	4) ceil : 지정한 값보다 큰 수 중에서 가장 작은 정수
		소수점 이하의 내용에 대하여 올림처리 정수
		ex) ceil(123.17) =>124
	5) floor : 지정한 값보다 작은 수 중에서 가장 큰 정수
		ex) floor(123.9) =>123
*/

SELECT round(222425.7552,2) FROM dual;
SELECT round(222425.7552) FROM dual;
SELECT round(222425.7552,-2) FROM dual;

/*
	ex) 부서 번호를 % 처리 하여, 보너스 지급 범위로 설정
		sal기준으로 원금+보너스 합산 출력, 10자리 단위로 반올림
		사원명, 급여, 보너스(%), 보너스, 총계
*/

SELECT ename 사원명, sal 급여, deptno "보너스(%)", round(sal*(deptno/100),-1) 보너스, round(sal+sal*(deptno/100),-1) 지급액
FROM emp;

-- ex) 사번이 짝수인 사원의 사번과 이름과 급여를 출력, 급여는 100자리 수로 절삭하여 처리

SELECT empno, mod(empno,2) 구분, ename, TRUNC(sal,-2) 급여
FROM emp
WHERE mod(empno,2)=0;

/*

# 날짜 함수
	1. 날짜 데이터 타입에 사용하는 함수
	2. 날짜 계산은 더하기, 빼기 연산 가능
		날짜 + 숫자 : 해당 일자에 일수를 가산
		날짜 + 1/24 : 시간단위 처리
			단위 처리 : 1/24/60/60 시간/분/초 단위
			해당 날짜 데이터 추가 변경
	cf) sysdate : 현재 날짜와 시간을 지칭
	

*/

SELECT sysdate "오늘", sysdate+1 "내일", sysdate-1 "어제"
FROM dual;

SELECT ename, hiredate, sysdate "현재날짜", hiredate+1 "입사 1일 후", hiredate+(1/24) "입사 1시간 후", sysdate - hiredate "입사 후 현재까지 날짜"
FROM emp;

/*
	ex) 사원, 이름과 입사 후 90일 날짜, 지금까지 근무년도(365)
*/

SELECT empno, ename, hiredate+90, (sysdate-hiredate)/365
FROM emp;

/*
# 날짜 함수의 종류
	1. sysdate : 시스템의 현재 날짜
	2. months_between(날짜1,날짜2) : 날짜와 날짜 사이의 개월 계산 (1=30일 단위로 날짜, 시간, 분, 초 등을 소숫점으로 계산)
	3. add_months(날짜, 추가개월) : 날짜에 개월을 더한 날짜 계산
	4. next_day : 해당 일을 기준으로 명시된 요일의 다음 날짜
	5. last_day : 해당 날짜가 속한 달의 마지막 날짜
*/

SELECT ename, hiredate, MONTHS_BETWEEN(sysdate, hiredate) "근무 개월"
FROM emp;

SELECT ename, hiredate, add_months(sysdate, 3) "인턴 종료일"
FROM emp;

SELECT next_day(sysdate, '일') "돌아오는 일요일"
FROM dual;

SELECT last_day(sysdate) "이번달 마지막 날짜"
FROM dual;

/*
	ex1) 사원들이 입사하고 처음 토요일에 데이트 하기로 함
		 사원의 이름과 해당 사원의 데이트날 출력
*/
SELECT ename, next_day(hiredate, '토')
FROM emp;

/*
	ex2)
*/


/*
# 날짜 데이터의 round, trunc 함수
	1. 날짜에 함수를 적용하는 경우 소숫점이하가 나타날때가 많기에 반올림과, 절삭함수를 사용하여 처리
	2. round - 반올림, trunc 절삭처리
 */

-- ex) 오늘로부터 3달 이후, 첫번째 월요일 계산하여 출력, 몇일 이후인지 출력
SELECT sysdate, next_day(add_months(sysdate,3), '월'), next_day(add_months(sysdate,3), '월')-sysdate
FROM dual;