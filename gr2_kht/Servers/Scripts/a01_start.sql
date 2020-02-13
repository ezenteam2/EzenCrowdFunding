/*
# Database 서버 구축
	1. 오라클 사이트 접속 - 필요로하는 서버 설치 파일 다운로드
		ex) 11g xe
	2. setup.exe
		1) 관리자 계정 비밀번호 설정 : ex) 1111, 아이디는 보통 system
		2) 설치 여부 확인
			cmd 창 -> sqlplus (오라클의 기본 DB CLIENT) -> system/1111로 접속
	3. 설치된 폴더에 주요 정보
		1) JDBC 드라이버
			C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ajdbc6.jar
		2) sample script 파일
			c:\oraclex\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
			=> 여습용 데이터베이스 접속 게정과 테이블 생성
	4. scott.sql 파일 변경
		계정명	: 대소문자 구별하지 않음
		비밀번호 	: 대소문자 구별 ==> tiger는 소문자로 변경
	5. sqlplus에서 관리자 계정으로 접속
		-> 해당 폴더 C:\Users\507-00에 scott.sql 이동
		-> @scott.sql 명령어 수행 (@ ==> run, @scott.sql == run scottl.sql)
		-> scott/tiger 계정 생성과 함께 사용할 연습테이블 emp, dept 생성
			(conn scott/tiger;로 접속, select * from emp; 명령어를 통해 실행
	6. eclip를 지원하는 database client plugin 설치
		1) help -> marketplace -> DBeaver 검색 -> DBeaver 6.3.3 install
	7. 서버와 client
		1)	client가 서버에 접속하려면, 고유의 툴을 이용하여 socket 통신을 통해 접속
		2)	서버에 접속할 socket 통신 모듈(driver-java에서는 @@.jar)을 만들어 접속
	8. driver를 이용하여 서버에 접속 가능
		1) 	oracle은 jdbc 드라이버를 사용하기 쉬운 경로에 설정하고, 해당 jdbc 드라이버를 plugin에 설정
		 	WebContent\WEB-INF\lib\ojdbc6.jar
	9. eclipse dbeaver 플러그인에서 설정방법
		1) 플러그인이 설정되면 2가지 메뉴가 추가 됨 (SQL 편집기, 데이터베이스)
		2) 데이터베이스 -> 드라이버 관리자 -> oracle -> edit
		3) add file을 통해 WebContent\WEB-INF\lib\ojdbc6.jar 드라이버 선택
		4) find class => oracle.jdbc.oracleJdbcDriver 선택
		5) 데이터베이스 -> 새 데이터베이스 연결 -> oracle
			host	: localhost
			port	: 1521
			sid		: XE
			계정		: scott/tiger
			test connection 확인 후, finish
	10. sql 편집기 -> 새 SQL 편집기를 통해 저장
		sql 작성 -> ctrl + enter 실행 꽝!
 */


-- ctrl + enter

/*
# 데이터 조회하기
	데이터는 SELECT 구문을 이용하여 지정된 데이터를 호출(query)할 수 있다
	1. 기본형식
		SELECT * || 컬럼명1, 컬럼명2
		FROM 테이블명
		WHERE 조건
**/

SELECT * FROM emp;
SELECT empno, ename, job, sal
FROM emp;

/*
	2. 컬럼명 별칭처리하기
		SELECT 컬럼명 AS 별칭명, 컬럼명 별칭명
		FROM 테이블
		해당 테이블 구조 안에 있는 컬럼명이, 별칭명으로 호출하여 출력할 수 있다
			- 한글과 특수문자를 사용할 때는 별칭을 ""으로 처리
**/

SELECT empno AS NO, ename name, sal "#급 여#"
FROM emp;

-- ex) 사원 테이블을 사원번호(empno), 사원명(ename), 관리자번호(mgr), 급여(sal)로 데이터 표현

SELECT empno "사원번호", ename "사원명", mgr "관리자번호", sal "급여"
FROM emp;

/*
데이터 산출 연산 처리와 concatnate(문자열연결)
	1. 데이터 컬럼간에는 연산처리 가능 (+, -, *, /)
	2. 문자열과 컬럼 간의 열결처리는 컬러명||컬럼명을 이용
**/

SELECT ename 이름, sal 급여, sal+10 "+급여(보너스)"
FROM emp;
SELECT '이름은 '||ename||'님 입니다' "자기 소개"
FROM emp;

-- ex1) 사원번호와 이름을 함께 출력하고, 연봉의 1/12를 출력하세요

SELECT empno 사원번호, ename 이름, sal 급여, sal/12
FROM emp;
SELECT empno||'번 '||ename||'님의 월급 : '||sal/12||'이네여' show01
FROM emp;

-- ex2) @@님의 사원번호는 @@이고, 올해 연말보너스는 연봉의 20%인 @@원 입니다

SELECT ename||'님의 사원번호 : '||empno||' 올해 연말보너스는 연봉의 20% : '||sal*0.2
FROM emp;

-- ex3) @@님의 이번달 보너스는 연봉의 deptno%기준으로 지급합니다
SELECT ename||'님의 이번달 보너스는 연봉의 '||deptno||'% 기준으로 '||sal*(deptno/100)||'만원' show
FROM emp;

-- round(컬럼명) - 반올림 처리 (sql 함수)
-- ex4) @@님의 입사일은 @@이고, 현재 연봉의 1/12인 월급여 @@만원 지급 됩ㄴ디ㅏ.

SELECT ename||'님의 입사일은 '||hiredate||'이고, 현재 연봉('||sal||') 연봉의 1/13은 '|| round(sal/13)||'입니다' show
FROM emp;
