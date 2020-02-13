/*
# 데이터의 삭제
	1. DELETE
	2. WHERE를 생략하면 전체 행 삭제
	3. 사용법
		DELETE			-- 행 단위로 삭제 되므로, 컬럼 지정하지 않아도 됨
		FROM 테이블명
		WHERE 조건;
*/

SELECT * FROM EMP16;
DELETE FROM EMP16;