/*
# 데이터 무결성 제약조건의 개념
	1. 데이터의 정확성과 일관성을 보장
	2. 데이터의 정확성을 유지하여 다양한 종류의 업무규칙을 고려
		1) student 테이블에서 학년 데이터는 1, 2, 3, 4 중 하나만 입력 가능
		2) 모든 학번은 유일하게 처리
		3) student 테이블의 지도교수 번호는 professor 테이블의 교수번호 중의 하나와 반드시 일치
	3. 데이터 무결성 제약조건의 장점
		1) 테이블 생성시 무결성 제약 조건 정의 가능 - 생성 후에도 설정 가능 함
		2) 테이블에 대해 정의, 데이터 딕셔너리에 저장되므로, 응용프로그램에서 입력된 모든 데이터에 대해 동일하게 적용
		3) 제약조건의 활성화, 비활성화 변화의 융통성이 있음
	4. 무결점 제약조건의 종류
		1) not null : 데이터가 null상태로 남아 있을 수 없음, 무조건 입력되어야 함
		2) unique key : 테이블의 모든 행에서 고유한 값을 갖는 열 또는 열조합을 지정
						ex) 학번, 주민번호, 사원번호
		3) primary key : 해당 컬럼 값은 반드시 존재해야 하고, 중복이 있어선 안됨 (not null + unique key)
		4) foreign key : 한 열과 참조된 테이블의 열간에 외래 키 관계를 설정하소 시행
						ex) 각 사원의 부서번호는 부서번호 테이블의 있는 데이터 중 하나와 반드시 일치
						(foreign key로 연결된 칼럼이 포함된 테이블에 등록되지 않은 데이터는 있을 수 없음
	5. 설정 형식
		1) 컬럼명 데이터 타입 constraint 제약조건명 제약 조건
		2) primary key 지정
						ex)	CREATE TABLE student(
					stuno NUMBER CONSTRAINT student_stuno_pk primary key
				);
				
		


 */

CREATE TABLE student_exp1(
	stuno NUMBER CONSTRAINT student_studno_pk PRIMARY KEY
);

SELECT * FROM student_exp1;
INSERT INTO student_exp1 values(1);
/* 
INSERT INTO student_exp1 values(null);
*/

/*
	3) NOT NULL 지정
		CONSTRAINT 이름 명명규칙 - 테이블_컬럼명_제약약자		ex) student_exp2_name_nn
*/

CREATE TABLE student_exp2(
	name varchar2(50) CONSTRAINT student_exp2_name_nn NOT null
);
INSERT INTO student_exp2 values('안녕맨');
INSERT INTO student_exp2 values('안녕맨');
INSERT INTO student_exp2 values('안녕맨');
INSERT INTO student_exp2 values('NULL');
SELECT * FROM student_exp2;

/*
	4) check 
 */

CREATE TABLE student_exp3(
	gender varchar2(1) CONSTRAINT student_exp3_gender_ck CHECK (gender IN('F','M'))
);
INSERT INTO student_exp3 values('F');
INSERT INTO student_exp3 values('M');
INSERT INTO student_exp3 values('F');
INSERT INTO student_exp3 values('F');
SELECT * FROM student_exp3;

CREATE TABLE student_exp4(
	score NUMBER CONSTRAINT student_exp4_score_ck CHECK (score BETWEEN 0 AND 100)
);

DROP TABLE student_exp4;
SELECT * FROM tab;

INSERT INTO student_exp4 values(100);
INSERT INTO student_exp4 values(95);
INSERT INTO student_exp4 values(80);
INSERT INTO student_exp4 values(1000000000);
SELECT * FROM student_exp4;

/*
# 제약 조건 추가
	1. 컬럼 추가와 제약조건 추가
	ALTER TABLE 테이블 add 컬럼명 데이터타입
	ALTER TABLE 테이블 add CONSTRAINT 제약조건명 primary key(컬럼명);
 */

DELETE FROM student_exp4;
ALTER TABLE student_exp4 ADD CONSTRAINT student_exp4_score_pk PRIMARY KEY(score);

/*
# 외래키 관계 설정
	컬럼명 데이터유형 constraint 제약키_fk references 테이블명(컬럼명)
 */
CREATE TABLE regsubject(
	regno NUMBER PRIMARY KEY,
	stud_no NUMBER CONSTRAINT stud_no_fk REFERENCES student_exp4(score)
);

SELECT * FROM STUDENT_EXP4;