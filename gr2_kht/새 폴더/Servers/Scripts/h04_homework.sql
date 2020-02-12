--2. 학년은 1,2,3,4학년 데이터만 입력 가능, 학번으로 key를 잡는 테이블 student
CREATE TABLE student02 (
stu_no number CONSTRAINT student_stuno_pk PRIMARY KEY,
stu_name varchar2(20),
stu_grade number(1) CONSTRAINT student_stu_grade_ck CHECK (stu_grade IN(1,2,3,4))
);

SELECT * FROM student02;

--3. 부서번호가 30이고, 부서번호, 사원번호, 사원명, 급여로 된 테이블 emp13 생성
CREATE TABLE emp13
AS
SELECT deptno, empno, ename, sal
FROM emp
WHERE deptno=30;

SELECT * FROM emp13;
DROP TABLE emp13;

--4. emp13 테이블에 입사일 추가, 급여 삭제, 월급여 추가

ALTER TABLE emp13
ADD hiredate date;
ALTER TABLE emp13
DROP COLUMN sal;
ALTER TABLE emp13
ADD monthsal NUMBER;

--5. emp13에 제약조건으로 emp13_empno_pk 이름으로 primary key 생성

ALTER TABLE emp13
ADD CONSTRAINT emp13_empno_pk PRIMARY KEY(empno);

--6. dept를 이용하여 dept13 생성, dept13의 deptno를 참조하여 emp13의 foreign key 생성, deptno삭제시 null 처리

SELECT * FROM dept;

CREATE TABLE dept13
AS
SELECT *
FROM dept;
ALTER TABLE dept13
ADD CONSTRAINT dept13_deptno_pk PRIMARY KEY(deptno);

ALTER TABLE emp13
ADD CONSTRAINT emp13_deptno_fk FOREIGN key(deptno) REFERENCES dept13(deptno) ON DELETE SET NULL;

--7. emp13의 부서번호(deptno-숫자)를 부서명(dname-문자)로 변경, update emp13 set deptno=null; 사용하여 처리

UPDATE emp13 SET deptno=NULL;
ALTER TABLE emp13
RENAME COLUMN deptno TO dname;
ALTER TABLE emp13
DROP CONSTRAINT emp13_deptno_fk;
ALTER TABLE emp13
MODIFY dname varchar2(50);

SELECT * FROM emp13;




