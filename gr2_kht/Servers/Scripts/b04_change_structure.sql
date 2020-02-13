/*

# 테이블 구조 변경
	1. alter table => 컬럼추가, 삭제, 타입이나 길이를 재정의
	2. 컬럼 추가
		- alter table ... add
		- 추가된 컬럼은 테이블의 마지막 컬럼 다음에 추가, 위치 지정 불가능
			=> 	위치 지정이 필요한 경우 테이블을 복사하는 형식으로 임시 테이블을 만들고,
				기존의 테이블을 drop
		- 추가된 컬럼에도 기본 값 지정 가능
		- 수정할 테이블에 기존 데이터가 존재하는 경우 컬럼 값은 null로 입력 가능
		- 기본 형식
		alter table 테이블명
		add 컬럼명 데이터type default 디폴트데이터

*/

SELECT * FROM emp2;
ALTER TABLE EMP2 ADD dname varchar2(30);

ALTER TABLE emp2
ADD comments varchar2(200) DEFAULT 'No comment';

/*
	3. 컬럼삭제
		1) delete a specific column and its data from a table
		2) alter table 테이블명 drop column 컬럼명;
		3) 2개 이상의 컬럼이 존재하는 테이블에서만 삭제 가능
		4) 한 번에 하나의 컬럼만 삭제 가능
*/

ALTER TABLE emp2
DROP COLUMN dname;

/*

	ex) emp6 테이블 생성, dname, loc 컬럼 추가, deptno 컬럼 삭제
   
 */

DROP TABLE emp6;

CREATE TABLE emp6
AS
SELECT * FROM emp;
ALTER TABLE emp6
ADD dname varchar(20) DEFAULT '이게 뭐야?';
ALTER TABLE emp6
ADD loc varchar(20) DEFAULT '어디 사싐?';
ALTER TABLE emp6
DROP COLUMN empno;

SELECT * FROM emp6;

/*

	4. 테이블 컬럼 변경
		1) 테이블 컬럼의 타입, 크기, 기본값은 변경 가능
		2) alter table 테이블명 modify 컬럼명
		3) 기존 컬럼에 데이터가 없는 경우, 컬럼 타입이나 크기 변경이 자유로움
		4) 기존 데이터가 있는 경우
			- 타입 변경은 char와 varchar2만 허용
			- 변경한 컬럼의 크기가 저장된 데이터의 크기보다 같거나 클경우 변경 가능
			- 숫자 타입은 정밀도 증가 가능
		5) 기본 값의 변경은 변경 후에 입력되는 데이터부터 적용

*/

DROP TABLE emp9;

CREATE TABLE emp9
AS SELECT * FROM emp;
DELETE FROM emp9;
SELECT * FROM emp9;
ALTER TABLE emp9
MODIFY ename varchar2(50);

DROP TABLE emp10;

CREATE TABLE emp10
AS SELECT * FROM emp;
ALTER TABLE emp10
MODIFY empno varchar2(30);	-- 다른 유형의 데이터 type 변경(x)

/*

	5. 테이블명 변경
		1) rename 기존테이블명 to 변경할테이블명;
	6. 컬럼명 변경
		1)	alter table 테이블명
			rename column 기존컬럼명 to 변경할컬럼명;

 */

RENAME emp10 TO emp10_new;
SELECT * FROM emp10_new;

ALTER TABLE emp10_new
RENAME COLUMN deptno TO "부서번호";

/*

	7. 테이블 삭제
		1) drop table 테이블명;
	8. 컬럼 삭제
		2)	alter table 테이블명
			drop column 컬럼명;

*/

DROP TABLE emp10_new;
SELECT * FROM emp;
ALTER TABLE emp9
DROP COLUMN deptno;

SELECT * FROM emp9;

/*
	9. 제약조건의 추가와 삭제
		1) PRIMARY KEY
			- 키 추가		: ALTER TABLE 테이블명 ADD PRIMARY KEY (컬럼명)
			- 키 삭제		: ALTER TABLE 테이블명 DROP PRIMARY KEY;
		2) 그 외의 제약 조건
			- 키 추가		: ALTER TABLE 테이블명 ADD UNIQUE (컬럼명)						-> unique, foreign key, 
						  ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 UNIQUE (컬럼명)
						  	# 참조키 관련 내용 - references 참조테이블명(참조컬럼명)
						  	# 데이터가 삭제 수정되었을 때, 처리 내용	- on delete 옵션
						  									- on update 옵션
						  	# 옵션 내용	- no action 참조 테이블이 변화(수정/삭제)가 있어도 기본 테이블에 영향 없음
						  				- cascade : 참조테이블의 변화(수정/삭제)에 따라 기본 테이블도 수정/삭제
						  				- set null : 참조테이블의 변화로 기본테이블 데이터 null
						  				- set default : 
			- 키 삭제 		: ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명;
*/

/*
	ex) emp 복사테이블 emp11
		dept 복사테이블  dept11 생성
		둘다 empno, deptno PRIMARY KEY 설정
*/

CREATE TABLE emp11
AS
SELECT * FROM emp;
ALTER TABLE emp11
ADD PRIMARY KEY(empno);
ALTER TABLE emp11
ADD CONSTRAINT emp11_deptno_fk FOREIGN KEY(deptno)
REFERENCES dept11(deptno) ON DELETE CASCADE;

SELECT * FROM emp11;

CREATE TABLE dept11
AS
SELECT * FROM dept;
ALTER TABLE emp11
ADD PRIMARY key(deptno);

SELECT * FROM dept11;
DELETE FROM dept11
WHERE deptno=10;
