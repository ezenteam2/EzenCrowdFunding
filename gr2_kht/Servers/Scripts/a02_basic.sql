SELECT deptno FROM emp;
-- distict

SELECT DISTINCT deptno FROM emp;
/*
# 기본적인 sql 질의어 구조
	SELECT	- 출력할 컬럼
	FROM	- 테이블
	WHERE 컬럼 = 데이터
		AND	컬럼 = 데이터
		OR	컬럼 = 데이터
	GROUP BY 그룹할 컬럼
		HAVING	그룹컬럼에 조건
	ORDER BY 정렬할 컬럼1, 컬럼2

1. SELECT 절
	1) 질의 결과를 포함하려는 속성(컬럼) 들의 리스트 열거
	2) DISTINCT 절을 사용해서 중복 제거
2. FROM 절
	1) 질의에서 필요로하는 릴레이션들의 리스트 열거
3. WHERE 절
	1) 관계 대수(=, >=, <=, >, <)의 SELECT 연산의 조건에 해당
	2) 중첩질의의 AND, OR, SUBQUERY(중첩질의)를 통해 조건을 FILTERING 처리