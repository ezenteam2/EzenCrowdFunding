/*
	ex1)	emp12, dept12 dept12에 primary key 생성
			on delete 옵션을 null로 처리하여 결과 출력
*/


/*
	ex2)	emp13, dept13 dept13에 primary key 생성
			on update 옵션을 cascade시 변경하고 결과 출력
 */

UPDATE dept13
SET deptno=11
WHERE deptno=10; -- deptno 컬럼 수정 처리

-- on delete : oracle 적용
-- on update : mysql에서 적용, oracle - on update 옵션 지원하지 않음
