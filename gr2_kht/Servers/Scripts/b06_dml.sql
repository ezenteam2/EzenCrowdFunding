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

/*
# sequence
	1. 유일한 식별자 데이터를 만들기 위한 객체
	2. 기본 키 값을 자동으로 생성하기 위하여 일련번호 생성
		ex)	웹 게시판 key 글 번호를 순서대로 등록할 때, sequence를 활용
	3. 여러 테이블에서 공유 가능
	4. 기본 형식
		CREATE SEQUENCE 시퀀스명
			INCREMENT BY 증가단위
			START WITH 시작번호
			MAXVALUE 최대값	|| NOMAXVALUE 	(증가단위가 증가일 경우 무한대로 증가)
			MINVALUE 최소값	|| NOMINVALUE	(증가단위가 감소일 경우 무한대로 감소)
			CYCLE			|| NOCYCLE		(반복 여부 설정)
			CACHE N			|| NOCACHE		(속도 개선을 위해 메모리 캐쉬 시퀀스 수)
 */

SELECT * FROM emp16;
CREATE SEQUENCE seq_01
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 99999
	MINVALUE 1;
	
/*
	5. SEQUENCE 활용
		1) 시퀀스명.nextval : 다음 시퀀스번호 로딩
		2) 시퀀스명.currval : 현재 시퀀스번호 로딩
 */

SELECT seq_01.nextval
FROM dual;

CREATE TABLE emp17
AS SELECT * FROM emp;
SELECT max(empno)
FROM emp17;

CREATE SEQUENCE emp17_seq
	INCREMENT BY 1
	START WITH 7935
	MAXVALUE 9999
	MINVALUE 1000
	CYCLE;

INSERT INTO emp17(empno, ename)
values(emp17_seq.nextval,'멀린');

SELECT * FROM emp17
ORDER BY empno DESC;

-- ex) dept14에 맞는 sequence를 생성하고, 41부터, 데이터 입력
CREATE TABLE dept14
AS SELECT * FROM dept;
SELECT * FROM dept14;

CREATE SEQUENCE dept14_seq
	INCREMENT BY 10
	START WITH 50
	MAXVALUE 100
	MINVALUE 10;

SELECT dept14_seq.nextval
FROM dual;

DROP SEQUENCE dept14_seq;

INSERT INTO dept14(deptno) VALUES (dept14_seq.currval);

UPDATE dept14
SET dname='현태보좌', loc='영등포'
WHERE deptno=50;

/*
	6. SEQUENCE의 속성 변경
		1) currval 변경 불능
				=> 변경을 위해서는 시퀀스를 삭제한 후 다시 생성 (DROP SEQUENCE 시퀀스명;)
		2) 최대값이나 최소값 변경 가능
			ALTER SEQUENCE 시퀀스명 MAXVALUE 100;
 */

ALTER SEQUENCE dept14_seq MAXVALUE 300;