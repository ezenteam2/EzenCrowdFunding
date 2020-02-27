ALTER TABLE member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_member;

/* 회원 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE member (
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	mem_password VARCHAR2(20) NOT NULL, /* 비밀번호 */
	mem_type VARCHAR2(20) NOT NULL CONSTRAINT CK_memeber_mem_type CHECK (mem_type IN('SUPPORTER','MAKER')), /* 회원 종류 */
	mem_name VARCHAR2(20) NOT NULL, /* 이름 */
	mem_telno VARCHAR2(12) NOT NULL CONSTRAINT UK_member_mem_telno UNIQUE, /* 전화번호 */
	mem_address VARCHAR2(100) NOT NULL, /* 주소 */
	mem_email VARCHAR2(100) NOT NULL CONSTRAINT UK_member_mem_email UNIQUE, /* 이메일 */
	mem_businessno NUMBER, /* 사업자 등록번호 */
	mem_accountinfo NUMBER, /* 계좌 정보 */
	mem_bankinfo VARCHAR2(50) /* 은행 정보 */
);

COMMENT ON TABLE member IS '회원';
COMMENT ON COLUMN member.mem_id IS '아이디';
COMMENT ON COLUMN member.mem_password IS '비밀번호';
COMMENT ON COLUMN member.mem_type IS '회원 종류';
COMMENT ON COLUMN member.mem_name IS '이름';
COMMENT ON COLUMN member.mem_telno IS '전화번호';
COMMENT ON COLUMN member.mem_address IS '주소';
COMMENT ON COLUMN member.mem_email IS '이메일';
COMMENT ON COLUMN member.mem_businessno IS '사업자 등록번호';
COMMENT ON COLUMN member.mem_accountinfo IS '계좌 정보';
COMMENT ON COLUMN member.mem_bankinfo IS '은행 정보';

CREATE UNIQUE INDEX PK_member
	ON member (
		mem_id ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			mem_id
		);

	
	
	
	
	
ALTER TABLE projects
	DROP
		CONSTRAINT FK_member_TO_projects
		CASCADE;

ALTER TABLE projects
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_projects;

/* 프로젝트 */
DROP TABLE projects 
	CASCADE CONSTRAINTS;

/* 프로젝트 */
CREATE TABLE projects (
	pro_num NUMBER NOT NULL, /* 프로젝트 번호 */
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	mem_company VARCHAR2(50) NOT NULL, /* 업체명 */
	pro_title VARCHAR2(100) NOT NULL CONSTRAINT UK_projects_pro_title UNIQUE, /* 프로젝트 이름 */
	cate_name VARCHAR2(50) NOT NULL CONSTRAINT  CK_projects_cate_name CHECK (cate_name IN('IT','가전', '가구', '패션', '뷰티', '음식', '여행', '레저', '반려동물', '음반', '영화')) , /* 카테고리 이름 */
	pro_type VARCHAR2(20) NOT NULL, /* 프로젝트 종류 */
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

COMMENT ON TABLE projects IS '프로젝트';
COMMENT ON COLUMN projects.pro_num IS '프로젝트 번호';
COMMENT ON COLUMN projects.mem_id IS '아이디';
COMMENT ON COLUMN projects.mem_company IS '업체명';
COMMENT ON COLUMN projects.pro_title IS '프로젝트 이름';
COMMENT ON COLUMN projects.cate_name IS '카테고리 이름';
COMMENT ON COLUMN projects.pro_type IS '프로젝트 종류';
COMMENT ON COLUMN projects.pro_start_date IS '프로젝트 시작날짜';
COMMENT ON COLUMN projects.pro_finish_date IS '프로젝트 종료날짜';
COMMENT ON COLUMN projects.pro_main_image IS '프로젝트 대표 이미지';
COMMENT ON COLUMN projects.pro_keyword IS '프로젝트 키워드';
COMMENT ON COLUMN projects.pro_movie_address IS '프로젝트 동영상 주소';
COMMENT ON COLUMN projects.pro_refund IS '환불 정책';
COMMENT ON COLUMN projects.pro_target_fund IS '목표 금액';
COMMENT ON COLUMN projects.pro_get_fund IS '현재 투자 받은 금액';
COMMENT ON COLUMN projects.pro_hits IS '조회수';

CREATE UNIQUE INDEX PK_projects
	ON projects (
		pro_num ASC
	);

ALTER TABLE projects
	ADD
		CONSTRAINT PK_projects
		PRIMARY KEY (
			pro_num
		);

ALTER TABLE projects
	ADD
		CONSTRAINT FK_member_TO_projects
		FOREIGN KEY (
			mem_id
		)
		REFERENCES member (
			mem_id
		);


ALTER TABLE projects_details
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;


	
	
	
	
	
DROP INDEX PK_projects_details;

/* 프로젝트 세부 내용 */
DROP TABLE projects_details 
	CASCADE CONSTRAINTS;

/* 프로젝트 세부 내용 */
CREATE TABLE projects_details (
	pro_detail_code NUMBER NOT NULL, /* 세부 내용 번호 */
	pro_num NUMBER NOT NULL, /* 프로젝트 번호 */
	pro_detail_num NUMBER NOT NULL, /* 순서 */
	pro_detail_type VARCHAR2(20) NOT NULL  CONSTRAINT CK_pro_detail_type CHECK (pro_detail_type IN('detailimg','contentimg', 'contenttext')), /* 구분 */
	pro_detail_content VARCHAR2(2000) NOT NULL/* 내용 */
);

COMMENT ON TABLE projects_details IS '프로젝트 세부 내용';
COMMENT ON COLUMN projects_details.pro_detail_code IS '세부 내용 번호';
COMMENT ON COLUMN projects_details.pro_num IS '프로젝트 번호';
COMMENT ON COLUMN projects_details.pro_detail_num IS '순서';
COMMENT ON COLUMN projects_details.pro_detail_type IS '구분';
COMMENT ON COLUMN projects_details.pro_detail_content IS '내용';

CREATE UNIQUE INDEX PK_projects_details
	ON projects_details (
		pro_detail_code ASC
	);

ALTER TABLE projects_details
	ADD
		CONSTRAINT PK_projects_details
		PRIMARY KEY (
			pro_detail_code
		);

ALTER TABLE projects_details
	ADD
		CONSTRAINT FK_projects_details
		FOREIGN KEY (
			pro_num
		)
		REFERENCES projects (
			pro_num
		);
		

	
	ALTER TABLE projects_rewards
	DROP
		CONSTRAINT FK_projects_rewards
		CASCADE;

ALTER TABLE projects_rewards
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_projects_rewards;

/* 보상 옵션 */
DROP TABLE projects_rewards 
	CASCADE CONSTRAINTS;

/* 보상 옵션 */
CREATE TABLE projects_rewards (
	reward_code NUMBER NOT NULL, /* 보상 옵션 번호 */
	pro_num NUMBER NOT NULL, /* 프로젝트 번호 */
	reward_fund NUMBER NOT NULL, /* 투자 금액 */
	reward_content VARCHAR2(2000) NOT NULL /* 보상 내용 */
);

COMMENT ON TABLE projects_rewards IS '보상 옵션';
COMMENT ON COLUMN projects_rewards.reward_code IS '보상 옵션 번호';
COMMENT ON COLUMN projects_rewards.pro_num IS '프로젝트 번호';
COMMENT ON COLUMN projects_rewards.reward_fund IS '투자 금액';
COMMENT ON COLUMN projects_rewards.reward_content IS '보상 내용';

CREATE UNIQUE INDEX PK_projects_rewards
	ON projects_rewards (
		reward_code ASC
	);

ALTER TABLE projects_rewards
	ADD
		CONSTRAINT PK_projects_rewards
		PRIMARY KEY (
			reward_code
		);

ALTER TABLE projects_rewards
	ADD
		CONSTRAINT FK_projects_rewards
		FOREIGN KEY (
			pro_num
		)
		REFERENCES projects (
			pro_num
		);
		
	

ALTER TABLE projects_qna
	DROP
		CONSTRAINT FK_projects_qna
		CASCADE;

ALTER TABLE projects_qna
	DROP
		CONSTRAINT FK_member_TO_projects_qna
		CASCADE;

ALTER TABLE projects_qna
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_projects_qna;

/* 프로젝트 문의사항 */
DROP TABLE projects_qna 
	CASCADE CONSTRAINTS;

/* 프로젝트 문의사항 */
CREATE TABLE projects_qna (
	pro_qna_number NUMBER NOT NULL, /* 프로젝트 문의 번호 */
	pro_num NUMBER NOT NULL, /* 프로젝트 번호 */
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	pro_qna_question VARCHAR2(2000) NOT NULL, /* 문의 내용 */
	pro_qna_answer VARCHAR2(2000) /* 답변 내용 */
);

COMMENT ON TABLE projects_qna IS '프로젝트 문의사항';
COMMENT ON COLUMN projects_qna.pro_qna_number IS '프로젝트 문의 번호';
COMMENT ON COLUMN projects_qna.pro_num IS '프로젝트 번호';
COMMENT ON COLUMN projects_qna.mem_id IS '아이디';
COMMENT ON COLUMN projects_qna.pro_qna_question IS '문의 내용';
COMMENT ON COLUMN projects_qna.pro_qna_answer IS '답변 내용';

CREATE UNIQUE INDEX PK_projects_qna
	ON projects_qna (
		pro_qna_number ASC,
		pro_num ASC,
		mem_id ASC
	);

ALTER TABLE projects_qna
	ADD
		CONSTRAINT PK_projects_qna
		PRIMARY KEY (
			pro_qna_number,
			pro_num,
			mem_id
		);

ALTER TABLE projects_qna
	ADD
		CONSTRAINT FK_projects_TO_projects_qna
		FOREIGN KEY (
			pro_num
		)
		REFERENCES projects (
			pro_num
		);

ALTER TABLE projects_qna
	ADD
		CONSTRAINT FK_member_TO_projects_qna
		FOREIGN KEY (
			mem_id
		)
		REFERENCES member (
			mem_id
		);

		

		
		
		
		
ALTER TABLE project_funding
	DROP
		CONSTRAINT FK_project_funding
		CASCADE;

ALTER TABLE project_funding
	DROP
		CONSTRAINT FK_member_TO_project_funding
		CASCADE;

ALTER TABLE project_funding
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_project_funding;

/* 프로젝트 투자 */
DROP TABLE project_funding 
	CASCADE CONSTRAINTS;

/* 프로젝트 투자 */
CREATE TABLE project_funding (
	funding_code NUMBER NOT NULL, /* 투자 번호 */
	pro_num NUMBER NOT NULL, /* 프로젝트 번호 */
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	reward_code NUMBER NOT NULL /* 보상 옵션 번호 */
);

COMMENT ON TABLE project_funding IS '프로젝트 투자';
COMMENT ON COLUMN project_funding.funding_code IS '투자 번호';
COMMENT ON COLUMN project_funding.pro_num IS '프로젝트 번호';
COMMENT ON COLUMN project_funding.mem_id IS '아이디';
COMMENT ON COLUMN project_funding.reward_code IS '보상 옵션 번호';

CREATE UNIQUE INDEX PK_project_funding
	ON project_funding (
		funding_code ASC
	);

ALTER TABLE project_funding
	ADD
		CONSTRAINT PK_project_funding
		PRIMARY KEY (
			funding_code
		);

ALTER TABLE project_funding
	ADD
		CONSTRAINT FK_project_funding
		FOREIGN KEY (
			reward_code
		)
		REFERENCES projects_rewards (
			reward_code
		);

ALTER TABLE project_funding
	ADD
		CONSTRAINT FK_member_TO_project_funding
		FOREIGN KEY (
			mem_id
		)
		REFERENCES member (
			mem_id
		);		

	
		
		
		
	
ALTER TABLE projects_favorite
	DROP
		CONSTRAINT FK_projects_favorite
		CASCADE;

ALTER TABLE projects_favorite
	DROP
		CONSTRAINT FK_projects_favorite
		CASCADE;

ALTER TABLE projects_favorite
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_projects_favorite;

/* 관심 프로젝트 */
DROP TABLE projects_favorite 
	CASCADE CONSTRAINTS;

/* 관심 프로젝트 */
CREATE TABLE projects_favorite (
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	pro_num NUMBER NOT NULL /* 프로젝트 번호 */
);

COMMENT ON TABLE projects_favorite IS '관심 프로젝트';
COMMENT ON COLUMN projects_favorite.mem_id IS '아이디';
COMMENT ON COLUMN projects_favorite.pro_num IS '프로젝트 번호';

CREATE UNIQUE INDEX PK_projects_favorite
	ON projects_favorite (
		mem_id ASC,
		pro_num ASC
	);

ALTER TABLE projects_favorite
	ADD
		CONSTRAINT PK_projects_favorite
		PRIMARY KEY (
			mem_id,
			pro_num
		);

ALTER TABLE projects_favorite
	ADD
		CONSTRAINT FK_member_TO_projects_favorite
		FOREIGN KEY (
			mem_id
		)
		REFERENCES member (
			mem_id
		);

ALTER TABLE projects_favorite
	ADD
		CONSTRAINT FK_projects_favorite
		FOREIGN KEY (
			pro_num
		)
		REFERENCES projects (
			pro_num
		);
		

	
	
	
ALTER TABLE mem_report
	DROP
		CONSTRAINT FK_member_TO_mem_report
		CASCADE;

ALTER TABLE mem_report
	DROP
		CONSTRAINT FK_projects_TO_mem_report
		CASCADE;

ALTER TABLE mem_report
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_mem_report;

/* 프로젝트 신고 */
DROP TABLE mem_report 
	CASCADE CONSTRAINTS;

/* 프로젝트 신고 */
CREATE TABLE mem_report (
	report_code NUMBER NOT NULL, /* 신고 번호 */
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	pro_num NUMBER NOT NULL, /* 프로젝트 번호 */
	report_date DATE NOT NULL, /*신고 날짜*/
	report_type VARCHAR2(30) NOT NULL CONSTRAINT CK_mem_report_report_type CHECK (report_type IN ('허위 프로젝트', '과대 광고 프로젝트', '실현 불가', '불순한 내용 포함')), /* 신고 분류 */
	report_title VARCHAR2(50) NOT NULL, /* 신고 제목 */
	report_content VARCHAR2(2000) NOT NULL, /* 신고 내용 */
	report_img VARCHAR2(100) /* 신고 이미지 파일 */
);

COMMENT ON TABLE mem_report IS '프로젝트 신고';
COMMENT ON COLUMN mem_report.report_code IS '신고 번호';
COMMENT ON COLUMN mem_report.mem_id IS '아이디';
COMMENT ON COLUMN mem_report.pro_num IS '프로젝트 번호';
COMMENT ON COLUMN mem_report.report_date IS '신고 날짜';
COMMENT ON COLUMN mem_report.report_type IS '신고 분류';
COMMENT ON COLUMN mem_report.report_title IS '신고 제목';
COMMENT ON COLUMN mem_report.report_content IS '신고 내용';
COMMENT ON COLUMN mem_report.report_img IS '신고 이미지 파일';

CREATE UNIQUE INDEX PK_mem_report
	ON mem_report (
		report_code ASC
	);

ALTER TABLE mem_report
	ADD
		CONSTRAINT PK_mem_report
		PRIMARY KEY (
			report_code
		);

ALTER TABLE mem_report
	ADD
		CONSTRAINT FK_member_TO_mem_report
		FOREIGN KEY (
			mem_id
		)
		REFERENCES member (
			mem_id
		);

ALTER TABLE mem_report
	ADD
		CONSTRAINT FK_projects_TO_mem_report
		FOREIGN KEY (
			pro_num
		)
		REFERENCES projects (
			pro_num
		);
		


	
	
ALTER TABLE mem_balance
	DROP
		CONSTRAINT FK_member_TO_mem_balance
		CASCADE;

ALTER TABLE mem_balance
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_mem_balance;

/* 예치금 충전 */
DROP TABLE mem_balance 
	CASCADE CONSTRAINTS;

/* 예치금 충전 */
CREATE TABLE mem_balance (
	balrefill_code NUMBER NOT NULL, /* 예치금 충전 번호 */
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	balrefill_date DATE NOT NULL, /* 충전 날짜 */
	balrefill_amount NUMBER NOT NULL /* 충전 금액 */
);

COMMENT ON TABLE mem_balance IS '예치금 충전';
COMMENT ON COLUMN mem_balance.balrefill_code IS '예치금 충전 번호';
COMMENT ON COLUMN mem_balance.mem_id IS '아이디';
COMMENT ON COLUMN mem_balance.balrefill_date IS '충전 날짜';
COMMENT ON COLUMN mem_balance.balrefill_amount IS '충전 금액';

CREATE UNIQUE INDEX PK_mem_balance
	ON mem_balance (
		balrefill_code ASC
	);

ALTER TABLE mem_balance
	ADD
		CONSTRAINT PK_mem_balance
		PRIMARY KEY (
			balrefill_code
		);

ALTER TABLE mem_balance
	ADD
		CONSTRAINT FK_member_TO_mem_balance
		FOREIGN KEY (
			mem_id
		)
		REFERENCES member (
			mem_id
		);
		



ALTER TABLE admin
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_admin;

/* 관리자 */
DROP TABLE admin 
	CASCADE CONSTRAINTS;

/* 관리자 */
CREATE TABLE admin (
	admin_id VARCHAR2(20) NOT NULL, /* 관리자아이디 */
	admin_pass VARCHAR2(20) NOT NULL, /* 비밀번호 */
	admin_empno VARCHAR2(20) NOT NULL /* 사번 */
);

COMMENT ON TABLE admin IS '관리자';
COMMENT ON COLUMN admin.admin_id IS '관리자아이디';
COMMENT ON COLUMN admin.admin_pass IS '비밀번호';
COMMENT ON COLUMN admin.admin_empno IS '사번';

CREATE UNIQUE INDEX PK_admin
	ON admin (
		admin_id ASC
	);

ALTER TABLE admin
	ADD
		CONSTRAINT PK_admin
		PRIMARY KEY (
			admin_id
		);	
	
	
	
	
	
ALTER TABLE board_qna
	DROP
		CONSTRAINT FK_admin_TO_board_qna
		CASCADE;

ALTER TABLE board_qna
	DROP
		CONSTRAINT FK_member_TO_board_qna
		CASCADE;

ALTER TABLE board_qna
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_board_qna;

/* Q&A */
DROP TABLE board_qna 
	CASCADE CONSTRAINTS;

/* Q&A */
CREATE TABLE board_qna (
	qna_num NUMBER NOT NULL, /* 글번호 */
	mem_id VARCHAR2(20) NOT NULL, /* 아이디 */
	qna_date DATE, /* 등록날짜 */
	qna_title VARCHAR2(100), /* 제목 */
	qna_content VARCHAR2(2000), /* 내용 */
	admin_id VARCHAR2(20), /* 관리자아이디 */
	qna_answer_date DATE, /* 답변날짜 */
	qna_answer VARCHAR2(2000) /* 답변내용 */
);

COMMENT ON TABLE board_qna IS 'Q&A';
COMMENT ON COLUMN board_qna.qna_num IS '글번호';
COMMENT ON COLUMN board_qna.mem_id IS '아이디';
COMMENT ON COLUMN board_qna.qna_date IS '등록날짜';
COMMENT ON COLUMN board_qna.qna_title IS '제목';
COMMENT ON COLUMN board_qna.qna_content IS '내용';
COMMENT ON COLUMN board_qna.admin_id IS '관리자아이디';
COMMENT ON COLUMN board_qna.qna_answer_date IS '답변날짜';
COMMENT ON COLUMN board_qna.qna_answer IS '답변내용';

CREATE UNIQUE INDEX PK_board_qna
	ON board_qna (
		qna_num ASC
	);

ALTER TABLE board_qna
	ADD
		CONSTRAINT PK_board_qna
		PRIMARY KEY (
			qna_num
		);

ALTER TABLE board_qna
	ADD
		CONSTRAINT FK_admin_TO_board_qna
		FOREIGN KEY (
			admin_id
		)
		REFERENCES admin (
			admin_id
		);

ALTER TABLE board_qna
	ADD
		CONSTRAINT FK_member_TO_board_qna
		FOREIGN KEY (
			mem_id
		)
		REFERENCES member (
			mem_id
		);
		

	
	
	
	
ALTER TABLE board_notice
	DROP
		CONSTRAINT FK_admin_TO_board_notice
		CASCADE;

ALTER TABLE board_notice
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_board_notice;

/* 공지사항 */
DROP TABLE board_notice 
	CASCADE CONSTRAINTS;

/* 공지사항 */
CREATE TABLE board_notice (
	notice_num NUMBER NOT NULL, /* 글번호 */
	admin_id VARCHAR2(20) NOT NULL, /* 관리자아이디 */
	notice_date DATE NOT NULL, /* 날짜 */
	notice_title VARCHAR2(100) NOT NULL, /* 제목 */
	notice_hits NUMBER NOT NULL, /* 조회수 */
	notice_contents VARCHAR2(2000) NOT NULL /* 내용 */
);

COMMENT ON TABLE board_notice IS '공지사항';
COMMENT ON COLUMN board_notice.notice_num IS '글번호';
COMMENT ON COLUMN board_notice.admin_id IS '관리자아이디';
COMMENT ON COLUMN board_notice.notice_date IS '날짜';
COMMENT ON COLUMN board_notice.notice_title IS '제목';
COMMENT ON COLUMN board_notice.notice_hits IS '조회수';
COMMENT ON COLUMN board_notice.notice_contents IS '내용';

CREATE UNIQUE INDEX PK_board_notice
	ON board_notice (
		notice_num ASC
	);

ALTER TABLE board_notice
	ADD
		CONSTRAINT PK_board_notice
		PRIMARY KEY (
			notice_num
		);

ALTER TABLE board_notice
	ADD
		CONSTRAINT FK_admin_TO_board_notice
		FOREIGN KEY (
			admin_id
		)
		REFERENCES admin (
			admin_id
		);
		
	

	
	
ALTER TABLE board_guide_qna
	DROP
		CONSTRAINT FK_admin_TO_board_guide_qna
		CASCADE;

ALTER TABLE board_guide_qna
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_board_guide_qna;

/* 이용가이드&FAQ */
DROP TABLE board_guide_qna 
	CASCADE CONSTRAINTS;

/* 이용가이드&FAQ */
CREATE TABLE board_guide_qna (
	faq_num NUMBER NOT NULL, /* 글번호 */
	admin_id VARCHAR2(20) NOT NULL, /* 관리자아이디 */
	faq_title VARCHAR2(100) NOT NULL, /* 제목 */
	faq_content VARCHAR2(2000) NOT NULL /* 내용 */
);

COMMENT ON TABLE board_guide_qna IS '이용가이드&FAQ';
COMMENT ON COLUMN board_guide_qna.faq_num IS '글번호';
COMMENT ON COLUMN board_guide_qna.admin_id IS '관리자아이디';
COMMENT ON COLUMN board_guide_qna.faq_title IS '제목';
COMMENT ON COLUMN board_guide_qna.faq_content IS '내용';

CREATE UNIQUE INDEX PK_board_guide_qna
	ON board_guide_qna (
		faq_num ASC
	);

ALTER TABLE board_guide_qna
	ADD
		CONSTRAINT PK_board_guide_qna
		PRIMARY KEY (
			faq_num
		);

ALTER TABLE board_guide_qna
	ADD
		CONSTRAINT FK_admin_TO_board_guide_qna
		FOREIGN KEY (
			admin_id
		)
		REFERENCES admin (
			admin_id
		);
		

	
	
	
	

	
ALTER TABLE recommend_pro
	DROP
		CONSTRAINT FK_projects_TO_recommend_pro
		CASCADE;

/* 추천 프로젝트 */
DROP TABLE recommend_pro 
	CASCADE CONSTRAINTS;

/* 추천 프로젝트 */
CREATE TABLE recommend_pro (
	pro_num NUMBER /* 프로젝트 번호 */
);

COMMENT ON TABLE recommend_pro IS '추천 프로젝트';
COMMENT ON COLUMN recommend_pro.pro_num IS '프로젝트 번호';

ALTER TABLE recommend_pro
	ADD
		CONSTRAINT FK_projects_TO_recommend_pro
		FOREIGN KEY (
			pro_num
		)
		REFERENCES projects (
			pro_num
		);	
	
	

	
	
	
	
ALTER TABLE slide_banner
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_slide_banner;

/* 슬라이드 배너 관리 */
DROP TABLE slide_banner 
	CASCADE CONSTRAINTS;

/* 슬라이드 배너 관리 */
CREATE TABLE slide_banner (
	slide_num NUMBER NOT NULL, /* 슬라이드 코드 */
	slide_title VARCHAR2(100), /* 슬라이드 타이틀 */
	slide_img VARCHAR2(100), /* 슬라이드 이미지 */
	slide_date DATE /* 등록일 */
);

COMMENT ON TABLE slide_banner IS '슬라이드 배너 관리';
COMMENT ON COLUMN slide_banner.slide_num IS '슬라이드 코드';
COMMENT ON COLUMN slide_banner.slide_title IS '슬라이드 타이틀';
COMMENT ON COLUMN slide_banner.slide_img IS '슬라이드 이미지';
COMMENT ON COLUMN slide_banner.slide_date IS '등록일';

CREATE UNIQUE INDEX PK_slide_banner
	ON slide_banner (
		slide_num ASC
	);

ALTER TABLE slide_banner
	ADD
		CONSTRAINT PK_slide_banner
		PRIMARY KEY (
			slide_num
		);	
	
	
	
	
	
	
	
	
	

ALTER TABLE popup_admin
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_popup_admin;

/* 팝업 관리 */
DROP TABLE popup_admin 
	CASCADE CONSTRAINTS;

/* 팝업 관리 */
CREATE TABLE popup_admin (
	popup_num NUMBER NOT NULL, /* 팝업 코드 */
	popup_title VARCHAR2(100), /* 팝업 타이틀 */
	popup_img VARCHAR2(100), /* 팝업 이미지 */
	popup_date DATE /* 등록일 */
);

COMMENT ON TABLE popup_admin IS '팝업 관리';
COMMENT ON COLUMN popup_admin.popup_num IS '팝업 코드';
COMMENT ON COLUMN popup_admin.popup_title IS '팝업 타이틀';
COMMENT ON COLUMN popup_admin.popup_img IS '팝업 이미지';
COMMENT ON COLUMN popup_admin.popup_date IS '등록일';

CREATE UNIQUE INDEX PK_popup_admin
	ON popup_admin (
		popup_num ASC
	);

ALTER TABLE popup_admin
	ADD
		CONSTRAINT PK_popup_admin
		PRIMARY KEY (
			popup_num
		);	
	
	
	
	
DROP SEQUENCE board_guide_qna_seq01;
DROP SEQUENCE board_notice_seq01;
DROP SEQUENCE board_qna_seq01;
DROP SEQUENCE mem_balance_seq01;
DROP SEQUENCE mem_report_seq01;
DROP SEQUENCE projects_seq01;
DROP SEQUENCE projects_details_seq01;
DROP SEQUENCE projects_details_num_seq01;
DROP SEQUENCE projects_qna_seq01;
DROP SEQUENCE projects_rewards_seq01;
DROP SEQUENCE projects_funding_seq01;
DROP SEQUENCE slide_banner_seq01;
DROP SEQUENCE popup_admin_seq01;


