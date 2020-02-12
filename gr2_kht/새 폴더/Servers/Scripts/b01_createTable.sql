/*

# 테이블 만들기
	1) 데이터 타입
	2) 테이블의 제약조건 만들기
		primary key
		foreign key
		not null

# 테이블의 관계 만들기
		foreign key
# 데이터 등록 / 수정 / 삭제
# 테이블 간의 join 구문

	1) 데이터 타입
		- 데이터 베이스에 저장되는 데이터는 문자, 숫자, 날짜, 이미지 등과 같이 다양한 형식
		- 실무에서 컬럼의 데이터 타입이나 길이의 결정은 DB 설계 단계에서 아주 중요!
		- 설계 단계에서 잘못 설정된 데이터 타입은 응용 프로그램 개발을 어렵게 하고 성능을 저하시키는 요인
	2) 종류
		- char(size) 	: size의 고정길이 문자 데이터 타입 (1byte ~ 2000byte 사이)
							ex) 선언된 크기보다 작은 데이터를 넣어도 선언된 크기에 할당
								주로 코드성 데이터 (ex) 학번, 사번, 주민번호)
		- varchar2(size): size 가변 길이 문자 데이터 타입 (1byte ~ 4000byte 사이)
							ex) 선언된 크기보다 작은 데이터를 입력하면 입력된 용량만큼만 할당
		- number(p, s) 	: p, s가 들어가지 않으면 정수형 데이터 
							(p - 정밀도, 1~38, s - 스케일, -84 ~ 127 : 실수형으로 나타낼 때)
		- date			: 날짜 형식을 저장하기 위한 데이터 타입
		- blob			: 대용량의 바이너리 데이터를 저장하기 위한 데이터 타입 (최대 4Gbyte)
							ex) 파일, 이미지 데이터
		- clob			: 대용량의 텍스트 데이터를 저장하기 위한 데이터 타입 (최대 4Gbyte, 4000byte 이상의 데이터) 
		- timestamp(n)	: date 데이터 타입의 확장된 형태 (n - milli second 자리수, 최대 9자리까지)
	3) 테이블 생성시 형식
		create table 테이블명(
			컬럼명1 데이터타입,
			컬럼명2 데이터타입,
			...
		);

*/

-- ex1) 문제은행 테이블 - 번호, 문제구분(객관식/주관식), 문제내용, 정답

CREATE TABLE questionBank (
	quesNo NUMBER,
	quesType CHAR(6)
);

SELECT *
FROM questionBank;

-- ex2) 게시판 테이블 - 게시판 번호, 게시판 title, 게시판 내용, 등록일, 작성자, 조회수

CREATE TABLE board (
	boardNo NUMBER,
	boardTitle varchar2(100),
	boardDetail varchar2(2000),
	boardDate DATE,
	boardUser varchar(10),
	boardClick NUMBER
);

SELECT * FROM board;

-- ex3) 물품 테이블 - 물품 KEY, 물건명, 단가, 보유수량, 변경일

CREATE TABLE products(
	proKeyNo NUMBER,
	proName varchar2(30),
	proPrice NUMBER,
	proLeft NUMBER,
	proChgDate DATE
);

SELECT * FROM products;