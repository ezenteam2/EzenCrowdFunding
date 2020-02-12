/*
SELECT '오늘은 '||to_char(sysdate,'YYYY')||'년 '||to_char(sysdate,'MM')||'월 '||to_char(sysdate,' DD')||'일입니다. ' "오늘 날짜"
FROM dual;
*/

/*		********************************************
SELECT count(*)
FROM emp
WHERE to_char(hiredate,'Q')='4';

GROUP BY to_char(hiredate,'Q')
ORDER BY "분기";
**/

/* 비교	********************************************
SELECT to_char(hiredate,'Q') "분기", count(*) "인원"
FROM emp
GROUP BY to_char(hiredate,'Q')
ORDER BY "분기";
 */

/*
3. 테이블 생성
	회원 테이블
	id(primary), pass, 이름(not null), point(>0), grade(A~D)
 */
CREATE TABLE members(
memid varchar2(20) CONSTRAINT members_memid_pk PRIMARY KEY,
mempass varchar2(20),
memname varchar2(20) CONSTRAINT members_memname_nn NOT NULL,
mempoint NUMBER CONSTRAINT members_mempoint_chk CHECK (mempoint > 0),
memgrade varchar2(2) CONSTRAINT members_memgrade_chk CHECK (memgrade IN('A','B','C','D'))
);

DROP TABLE members;
