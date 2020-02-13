/*
# 데이터 타입의 변환
	1. 숫자나 날짜 타입을 문자와 함께 결합하거나 보고서 양식에 맞추기 위해 사용
	2. 묵시적 데이터 타입 변환
		- 정확한 연산을 위하여 오라클에서 데이터 타입을 내부적으로 변환
*/

SELECT * FROM EMP
WHERE sal= '800';
-- 위아래 두 문장은 같은거, 위 문장에서 묵시적 형변환이 일어남
SELECT * FROM emp
WHERE sal = to_number('800');	

/*
	3. 명시적 데이터 타입 변환
		- 사용자가 데이터 타입 변환 함수를 이용하여 직접 데이터 타입을 변환 처리
		- 명시적 데이터 변환함수
			1) to_char 		: 문자/날짜 타입을 문자로 변환
								to_char(number|date, 'format')
			2) to_number 	: 문자열을 숫자 타입으로 변환
			3) to_date 		: 문자열을 날짜 타입으로 변환
													***format
														- 'Q'		: 분기
														- 'MM'		: 월
														- 'MONTH'	: 월의 영문표기
														- 'WW'		: 년단위 주기표기 (@@년도의 XX번째주)
														- 'W'		: 월단위 주표기 (@@월의 XX번째주)
														- 'DD'		: 일 표기
														- 'DY'|'DAY': 요일 표기
*/

SELECT sysdate,
to_char(sysdate, 'CC'),		-- 세기
to_char(sysdate, 'YYYY'),	-- 4자리 연도
to_char(sysdate, 'YY')		-- 2자리 연도
FROM dual;

SELECT *
FROM EMP
WHERE to_char(hiredate, 'YYYY') = '1980';

SELECT ename, hiredate,
to_char(hiredate, 'Q') "분기",
to_char(hiredate, 'MM') "월",
to_char(hiredate, 'MONTH') "월",
to_char(hiredate, 'WW') "년단위 주수",
to_char(hiredate, 'W') "월단위 주수",
to_char(hiredate, 'DD') "일",
to_char(hiredate, 'DY') "요일",
to_char(hiredate, 'DAY') "요일"
FROM emp;

-- ex) 1981년 1/4분기에 입사한 사원의 이름, 입사년/월/분기 표시
SELECT ename, hiredate, to_char(hiredate, 'Q'), to_char(hiredate, 'YYYY"년도" MM"월" Q"분기"') "입사"
FROM EMP
WHERE to_char(hiredate,'YYYY')='1981' AND to_char(hiredate, 'Q')='1';