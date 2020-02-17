CREATE TABLE member (
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	mem_password VARCHAR2(20) NOT NULL, /* 비밀번호 */
	mem_name VARCHAR2(20) NOT NULL, /* 이름 */
	mem_telno NUMBER NOT NULL, /* 전화번호 */
	mem_address VARCHAR2(100) NOT NULL, /* 주소 */
	mem_email VARCHAR2(100) NOT NULL, /* 이메일 */
	mem_businessno NUMBER, /* 사업자 등록번호 */
	mem_accountinfo NUMBER, /* 계좌 정보 */
	mem_bankinfo VARCHAR2(50) /* 은행 정보 */
);

CREATE TABLE projects (
	pro_num NUMBER NOT NULL, /* 프로젝트 번호 */
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	mem_company VARCHAR2(50) NOT NULL, /* 업체명 */
	cate_code VARCHAR2(10) NOT NULL, /* 카테고리 코드 */
	pro_title VARCHAR2(100) NOT NULL, /* 프로젝트 이름 */
	pro_type VARCHAR2(10) NOT NULL, /* 프로젝트 종류 */
	pro_start_date DATE NOT NULL, /* 프로젝트 시작날짜 */
	pro_finish_date DATE NOT NULL, /* 프로젝트 종료날짜 */
	pro_main_image VARCHAR2(100) NOT NULL, /* 프로젝트 대표 이미지 */
	pro_keyword VARCHAR2(20) NOT NULL, /* 프로젝트 키워드 */
	pro_movie_address VARCHAR2(200) NOT NULL, /* 프로젝트 동영상 주소 */
	pro_refund VARCHAR2(2000) NOT NULL, /* 환불 정책 */
	pro_target_fund NUMBER NOT NULL, /* 목표 금액 */
	pro_get_fund NUMBER NOT NULL, /* 현재 투자 받은 금액 */
	pro_hits NUMBER NOT NULL /* 조회수 */
);

CREATE TABLE projects_qna (
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	pro_num NUMBER NOT NULL, /* 프로젝트 번호 */
	pro_qna_question VARCHAR2(2000), /* 문의 내용 */
	pro_qna_answer VARCHAR2(2000) /* 답변 내용 */
);

CREATE TABLE projects_details (
	pro_detail_code NUMBER NOT NULL, /* 세부 내용 번호 */
	pro_num NUMBER, /* 프로젝트 번호 */
	pro_detail_num NUMBER, /* 순서 */
	pro_detail_type VARCHAR2(10), /* 구분 */
	pro_detail_content VARCHAR2(2000) /* 내용 */
);

CREATE TABLE projects_rewards (
	reward_code NUMBER NOT NULL, /* 보상 옵션 번호 */
	pro_num NUMBER, /* 프로젝트 번호 */
	reward_fund NUMBER, /* 투자 금액 */
	reward_content VARCHAR2(2000) /* 보상 내용 */
);

CREATE TABLE project_funding (
	funding_code NUMBER NOT NULL, /* 투자 번호 */
	mem_id VARCHAR2(20), /* 아이디 */
	reward_code NUMBER, /* 보상 옵션 번호 */
	pro_num NUMBER /* 프로젝트 번호 */
);

CREATE TABLE projects_favorite (
	mem_id VARCHAR2(20), /* 아이디 */
	pro_num NUMBER /* 프로젝트 번호 */
);

CREATE TABLE mem_report (
	report_code NUMBER NOT NULL, /* 신고 번호 */
	mem_id VARCHAR2(20), /* 아이디 */
	pro_num NUMBER, /* 프로젝트 번호 */
	report_type VARCHAR2(10), /* 신고 분류 */
	report_title VARCHAR2(50), /* 신고 제목 */
	report_content VARCHAR2(2000), /* 신고 내용 */
	report_img VARCHAR2(100) /* 신고 이미지 파일 */
);

CREATE TABLE mem_balance (
	balrefill_code NUMBER NOT NULL, /* 예치금 충전 번호 */
	mem_id VARCHAR2(20), /* 아이디 */
	balrefill_date DATE, /* 충전 날짜 */
	balrefill_amount NUMBER /* 충전 금액 */
);

CREATE TABLE admin (
	admin_id VARCHAR2(20) NOT NULL, /* 관리자아이디 */
	admin_pass VARCHAR2(20) /* 비밀번호 */
);

CREATE TABLE board_qna (
	qna_num NUMBER NOT NULL, /* 글번호 */
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	qna_date DATE, /* 등록날짜 */
	qna_title VARCHAR2(100), /* 제목 */
	qna_content VARCHAR2(2000), /* 내용 */
	admin_id VARCHAR2(20), /* 관리자아이디 */
	qna_answer VARCHAR2(2000) /* 답변내용 */
);

CREATE TABLE board_guide_qna (
	faq_num NUMBER NOT NULL, /* 글번호 */
	admin_id VARCHAR2(20), /* 관리자아이디 */
	faq_title VARCHAR2(100), /* 제목 */
	faq_content VARCHAR2(2000) /* 내용 */
);

CREATE TABLE board_notice (
	notice_num NUMBER NOT NULL, /* 글번호 */
	admin_id VARCHAR2(20), /* 관리자아이디 */
	notice_date DATE, /* 날짜 */
	notice_title VARCHAR2(100), /* 제목 */
	notice_hits NUMBER, /* 조회수 */
	notice_contents VARCHAR2(2000) /* 내용 */
);