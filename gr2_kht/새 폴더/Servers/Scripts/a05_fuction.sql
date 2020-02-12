SELECT * FROM emp;

/*

# 함수 개념
	1. 데이터의 컬럼 값이나 데이터 타입을 변경해야 하는 경우에 사용
		ex) comm을 nvl을 이용할 때, 데이터 타입이 동일해야 함
			comm은 실수형이고, null일 때 출력할 내용은 '데이터가 없음'을 출력할 때,
			형변환 함수를 이용
	2. 숫자 또는 날짜 데이터의 출력 형식을 변경해야 하는 경우에 사용
		ex) 1980-12-17 00:00:00	-> 1980년 12월 17일 00시 00분 00초
	3. 하나 이상의 행에 대한 집계(최대값, 최소값, 평균값, 분산)을 처리해야 하는 경우에 사용
		ex) sal의 전체 평균이나 합산을 출력할 때 avg(sal)
		
# 함수의 유형 분류 (단일행/복수행)
	1. 단일행 함수 : 함수를 통해 1개의 데이터에 1개의 결과값을 처리하는 함수
					ex) nvl - nvl(comm, 0) 	=> comm이 null일 때 0으로 처리
	2. 복수행 함수 : 함수를 통해 여러개의 데티러를 1개의 결과값으로 처리하는 함수
					ex) max - max(sal) 		=> 전체 sal 데이터를 확인하여 하나의 결과값만을 도출
					
# 단일행 함수
	1. 주로 데이터 값을 조작하기 위해 사용
		숫자형 		=> 문자형
		소숫점 이하 실수 => 반올림 정수
		날짜형 		=> 월하는 형식의 날짜형태
	2. 형별로 함수를 적용하여 하나의 결과를 반환
		ex) SELECT ename, nvl(comm, 0) "보너스"
	3. 단일 행 함수의 종류
		1) 문자함수
		2) 숫자함수
		3) 날짜함수
		4) 변환함수
			- 묵시적 데이터형 변환
			- 명시적 데이터형 변환
		5) 일반함수
	4. 단일행 함수의 사용법
		1) 기본형식
			함수명(컬럼명|데이터, param1, param2, ...)
			ex) nvl(comm, 0)

# 문자함수
	1. 문자 데이터를 입력하여 문자나 숫자를 결과로 반환하는 함수
	2. 종류
		1) 대소문자 변환 함수 : initcap, lower, upper
		2) 문자 조작 함수 : concat, substr, instr, lpad, rpad, ltrim, rtrim
		3) 문자열 길이반환 함수 : length, legnthb

# 대소문자 변환함수
	1. initcap : 인수로 입력되는 컬럼이나 표현식의 문자열에서 첫 번째 영문자를 대문자로 변환
	2. lower : 소문자로 변환, upper : 대문자로 변환

# 문자열 길이 반환 함수
	1. length	: 인수로 입력되는 컬럼이나 표현식의 문자열의 길이를 반환 (문자의 갯수)
	2. lengthb	: 문자열의 바이트 수를 반환
		영문은 1자 => 1byte로 동일
		한글/특수문자 1자 => 2byte/3byte (오라클 버전에 따라 상이)
		cf) dual : 가상테이블로 처리
			select '홍길동' name from dual;

*/

SELECT '홍길동' name, 25 FROM dual;
SELECT length('홍길동'), lengthb('홍길동')

SELECT ename, nvl(comm, 0) "보너스"
FROM emp;
SELECT ename, initcap(ename)
FROM emp;

-- ex) 함수를 이용하여 다음과 같이 출력하세요
-- The job of Smith is Clerk!

SELECT 'The job of '||initcap(ename)||' is '||initcap(job)
FROM emp;

/*

	ex) ename으로 사원정보 검색
		대소문자와 관계없이 한자만 입력하더라도 검색 되는 sql문

*/

SELECT initcap(ename), lower(job), a.*
FROM emp
WHERE ename LIKE '%'|| upper('s') || '%';

SELECT
substr('921214-2801715',1,2) "년도",
substr('921214-2801715',3,2) "월",
substr('921214-2801715',5,2) "일",
substr('921214-2801715',8,1) "성별"
FROM dual;

/*
	ex) empno와 ename의 앞에서 5자를 추출, job은 3자를 추출하여 조합된 코드 출력
*/
SELECT empno||'_'||substr(ename,1,5)||'_'||substr(job,1,3)
FROM emp;

/*
	3. instr : 특정 문자가 출현하는 첫 번째 위치를 반환 처리
		ex) instr('sql*plus','*') ==> 4
	4. lpad/rpad : 오른쪽/왼쪽 정렬 후 왼쪽/오른쪽으로 해당 크기보다 짧은 데이터일 때 지정 문자 추가
		ex) lpad('sql',5,'*') ==> **sql
		ex) rpad('sql',5,'*') ==> sql**
		
*/

SELECT max(LENGTH(ename))
FROM emp;
-- 함수 혼합 시 가장 안 쪽에 위치한 괄호의 함수부터 처리
-- ename - 길이 - 최대값

SELECT
lpad(ename, 6, '#') ename,
rpad(ename, 6, '#') ename
FROM emp;

-- ex) job을 앞에서부터 5개를 추출, 전체 최대 크기 확인 후 나머지 부분을 *로 표기하여 출력
SELECT max(LENGTH(job))
FROM emp;

SELECT rpad(substr(job,1,5), 9, '*') job
FROM emp;

/*

	5. ltrim/rtrim 왼쪽/오른쪽 지정 문자 삭제 처리
		ex) ltrim('*sql', '*') ==> sql

 */

-- ex) job의 앞, 뒤 MAN을 삭제하여 출력

SELECT ltrim(job, 'MAN'),
rtrim(job, 'MAN')
FROM emp;
