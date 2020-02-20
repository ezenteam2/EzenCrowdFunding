CREATE SEQUENCE board_guide_qna_seq01
	INCREMENT BY 1
	START WITH 3100000;
CREATE SEQUENCE board_notice_seq01
	INCREMENT BY 1
	START WITH 3200000;
CREATE SEQUENCE board_qna_seq01
	INCREMENT BY 1
	START WITH 3300000;



CREATE SEQUENCE mem_balance_seq01
	INCREMENT BY 1
	START WITH 2100000;
CREATE SEQUENCE mem_report_seq01
	INCREMENT BY 1
	START WITH 2200000;


CREATE SEQUENCE projects_seq01
	INCREMENT BY 1
	START WITH 1100000;
CREATE SEQUENCE projects_details_seq01
	INCREMENT BY 1
	START WITH 1200000;
CREATE SEQUENCE projects_details_num_seq01
	INCREMENT BY 1
	START WITH 1;
CREATE SEQUENCE projects_qna_seq01
	INCREMENT BY 1
	START WITH 1500000;
CREATE SEQUENCE projects_rewards_seq01
	INCREMENT BY 1
	START WITH 1600000;
CREATE SEQUENCE projects_funding_seq01
	INCREMENT BY 1
	START WITH 1700000;



SELECT * FROM MEMBER;

INSERT INTO MEMBER VALUES ('ezenht', 'gusxo', 'SUPPORTER', '김현태', '01051519595', '서울시 영등포구', 'ezenht@gmail.com', '', '321585892323', '국민');
INSERT INTO MEMBER VALUES ('ezenhj', 'gudwns', 'MAKER', '이형준', '01025356869', '서울시 어디지?', 'ezenhj@gmail.com', '', '321589692311', '우리은행');
INSERT INTO MEMBER VALUES ('ezenys', 'dydtmd', 'MAKER', '김용승', '01074126869', '경기도 안산 멀다 멀어', 'ezenys@gmail.com', '', '7878969241', '하나은행');
INSERT INTO MEMBER VALUES ('ezensh', 'tjgml', 'SUPPORTER', '유서희', '010611126869', '서울시 어디지?2222', 'ezensh@gmail.com', '', '000678969241', '농협');


SELECT * FROM PROJECTS;

INSERT INTO PROJECTS VALUES (projects_seq01.nextval, 'ezenhj', '이젠정형외과', '신개념 무릎 보호대', '가전', '투자', sysdate, sysdate+15, 'http://www.naver.com/img00001', '무릎보호', 'http://www.youtube.com/xxxx0001', '프로젝트가 기한내에 완성되지 않는 경우, 투자 수익 분배일 기준 7일 이내 전액 반환 됩니다', 100000000, 0, 0);
INSERT INTO PROJECTS VALUES (projects_seq01.nextval, 'ezenys', '용이승천', '획기적 반려동물 먹이 배급기', '반려동물', '리워드', sysdate, sysdate+15, 'http://www.naver.com/img003333', '오고오내새꾸', 'http://www.youtube.com/xyyyy0001', '프로젝트가 기한내에 완성되지 않는 경우, 투자 수익 분배일 기준 15일 이내 전액 반환 됩니다', 3000000, 0, 0);


SELECT * FROM PROJECTS_DETAILS;



INSERT INTO PROJECTS_DETAILS VALUES (projects_details_seq01.nextval, 1100000, projects_details_num_seq01.nextval, 'detailimg', 'http://www.naver.com/img33333');
INSERT INTO PROJECTS_DETAILS VALUES (projects_details_seq01.nextval, 1100001, projects_details_num_seq01.nextval, 'detailimg', 'http://www.naver.com/img3676733');
INSERT INTO PROJECTS_DETAILS VALUES (projects_details_seq01.nextval, 1100001, projects_details_num_seq01.nextval, 'contentimg', 'http://www.naver.com/img444333');
INSERT INTO PROJECTS_DETAILS VALUES (projects_details_seq01.nextval, 1100000, projects_details_num_seq01.nextval, 'contenttext', '튼튼한 다리를 원하십니까앙?');
INSERT INTO PROJECTS_DETAILS VALUES (projects_details_seq01.nextval, 1100001, projects_details_num_seq01.nextval, 'contenttext', '집에 혼자 있는 우리 댕댕이가 배가고프면 어쩌쥐?');
INSERT INTO PROJECTS_DETAILS VALUES (projects_details_seq01.nextval, 1100000, projects_details_num_seq01.nextval, 'contentimg', 'http://www.naver.com/img33333');


SELECT * FROM PROJECTS_REWARDS;

INSERT INTO PROJECTS_REWARDS VALUES (projects_rewards_seq01.nextval, 1100000, 100000, '수익률의 0.5%를 3개월간 매월 지급');
INSERT INTO PROJECTS_REWARDS VALUES (projects_rewards_seq01.nextval, 1100000, 500000, '수익률의 0.55%를 3개월간 매월 지급');
INSERT INTO PROJECTS_REWARDS VALUES (projects_rewards_seq01.nextval, 1100000, 1000000, '수익률의 0.6%를 3개월간 매월 지급');
INSERT INTO PROJECTS_REWARDS VALUES (projects_rewards_seq01.nextval, 1100000, 1500000, '수익률의 0.65%를 3개월간 매월 지급');
INSERT INTO PROJECTS_REWARDS VALUES (projects_rewards_seq01.nextval, 1100001, 10000, '반려동물 먹이 배급기 1개 배송');
INSERT INTO PROJECTS_REWARDS VALUES (projects_rewards_seq01.nextval, 1100001, 50000, '반려동물 먹이 배급기 5개 배송');
INSERT INTO PROJECTS_REWARDS VALUES (projects_rewards_seq01.nextval, 1100001, 100000, '반려동물 먹이 배급기 5개 배송 + 개사료 10kg');



SELECT * FROM PROJECTS_QNA;

INSERT INTO PROJECTS_QNA VALUES (projects_qna_seq01.nextval, 1100001, 'ezenht', '이거 혹시 본인이 필요해서 만드려고 하는건가여???', '아니거등여');
INSERT INTO PROJECTS_QNA VALUES (projects_qna_seq01.nextval, 1100000, 'ezenhj', '이거 진짜로 작동 하는거 마즘??????', '백퍼');


SELECT * FROM PROJECT_FUNDING;

INSERT INTO PROJECT_FUNDING VALUES (projects_funding_seq01.nextval, 1100000, 'ezenys', 1600001);
INSERT INTO PROJECT_FUNDING VALUES (projects_funding_seq01.nextval, 1100000, 'ezenys', 1600001);
INSERT INTO PROJECT_FUNDING VALUES (projects_funding_seq01.nextval, 1100000, 'ezenys', 1600001);
INSERT INTO PROJECT_FUNDING VALUES (projects_funding_seq01.nextval, 1100001, 'ezenys', 1600005);
INSERT INTO PROJECT_FUNDING VALUES (projects_funding_seq01.nextval, 1100001, 'ezenht', 1600004);
INSERT INTO PROJECT_FUNDING VALUES (projects_funding_seq01.nextval, 1100001, 'ezenhj', 1600006);


SELECT * FROM PROJECTS_FAVORITE;

INSERT INTO PROJECTS_FAVORITE VALUES ('ezenht', 1100000);
INSERT INTO PROJECTS_FAVORITE VALUES ('ezenht', 1100001);
INSERT INTO PROJECTS_FAVORITE VALUES ('ezenys', 1100000);
INSERT INTO PROJECTS_FAVORITE VALUES ('ezenhj', 1100001);
INSERT INTO PROJECTS_FAVORITE VALUES ('ezenhj', 1100000);



SELECT * FROM MEM_REPORT;

INSERT INTO MEM_REPORT  VALUES (mem_report_seq01.nextval, 'ezensh', 1100000, '허위 프로젝트', '허위 프로젝트 신고합니다', '제가 지인한테 알아봤는데, 이 회사 유령회사라고 합니다. 사기당한사람 많아여', '');



SELECT * FROM MEM_BALANCE;

INSERT INTO MEM_BALANCE  VALUES (mem_balance_seq01.nextval, 'ezenys', sysdate, 100000000);
INSERT INTO MEM_BALANCE  VALUES (mem_balance_seq01.nextval, 'ezenys', sysdate, 50000000);
INSERT INTO MEM_BALANCE  VALUES (mem_balance_seq01.nextval, 'ezensh', sysdate, 27000000);
INSERT INTO MEM_BALANCE  VALUES (mem_balance_seq01.nextval, 'ezenhj', sysdate, 500000);


SELECT * FROM ADMIN;

INSERT INTO ADMIN VALUES ('admin01', 111111, 'x20070909');
INSERT INTO ADMIN VALUES ('admin02', 222222, 'x20110129');




SELECT * FROM BOARD_QNA;

INSERT INTO BOARD_QNA VALUES (board_qna_seq01.nextval, 'ezensh', sysdate, '협박 받고 있습니다', '허위 프로젝트로 신고했는데, 협박 받고 있어요. 손해 배상 청구 가능한가요?', 'admin01', '신고창에서 이미 경고드린 바와 같이, 신고로 인한 피해에는 저희 회사에서 책임지지 않습니다.');
INSERT INTO BOARD_QNA VALUES (board_qna_seq01.nextval, 'ezenys', sysdate, '저는 억울합니다', '억울합니다 판사님', 'admin02', '뭐가여?');




SELECT * FROM BOARD_NOTICE;

INSERT INTO board_notice VALUES (board_notice_seq01.nextval, 'admin01', sysdate, 'EZEN FUNDING 시작합니다', 0, '오늘 부터 EZEN FUNDING 서비스를 시작합니다 많은 이용 부탁드립니다.');
INSERT INTO board_notice VALUES (board_notice_seq01.nextval, 'admin01', sysdate, '불량 프로젝트 신고', 0, '불량 프로젝트에 대한 신고 기능이 있습니다. 많은 이용 부탁드립니다.');



SELECT * FROM BOARD_GUIDE_QNA;

INSERT INTO board_guide_qna VALUES (board_guide_qna_seq01.nextval, 'admin01', 'FUNDING 방법', '일단 펀딩을 하려면');
INSERT INTO board_guide_qna VALUES (board_guide_qna_seq01.nextval, 'admin01', '프로젝트 만드는 방법', '일단 프로젝트를 등록 하려면');
