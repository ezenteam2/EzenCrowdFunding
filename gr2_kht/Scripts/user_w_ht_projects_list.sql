
/* 진행중 프로젝트 - 진행중 프로젝트 전체 */
SELECT PRO_MAIN_IMAGE "대표이미지", PRO_TITLE "프로젝트제목", PRO_GET_FUND "현재모금액",
		trunc(PRO_GET_FUND/PRO_TARGET_FUND, 2)*100||'%' "달성률",
		trunc(PRO_FINISH_DATE-sysdate) "남은날짜", PRO_HITS "조회수"
FROM PROJECTS p
WHERE 	CATE_NAME = 'IT'
		AND PRO_START_DATE <= sysdate 
		AND sysdate <= PRO_FINISH_DATE
ORDER BY PRO_START_DATE DESC;


/* 진행중 프로젝트 - 현재 투자금 인기 진행중 프로젝트 */
SELECT PRO_MAIN_IMAGE "대표이미지", PRO_TITLE "프로젝트제목", PRO_GET_FUND "현재모금액",
		trunc(PRO_GET_FUND/PRO_TARGET_FUND, 2)*100||'%' "달성률",
		trunc(PRO_FINISH_DATE-sysdate) "남은날짜", PRO_HITS "조회수"
FROM PROJECTS p
WHERE 	CATE_NAME = 'IT'
		AND PRO_START_DATE <= sysdate 
		AND sysdate <= PRO_FINISH_DATE
ORDER BY PRO_GET_FUND DESC;

/* 베스트 프로젝트 - 조회수순 */
SELECT PRO_MAIN_IMAGE "대표이미지", PRO_TITLE "프로젝트제목", PRO_GET_FUND "현재모금액",
		trunc(PRO_GET_FUND/PRO_TARGET_FUND, 2)*100||'%' "달성률",
		trunc(PRO_FINISH_DATE-sysdate) "남은날짜", PRO_HITS "조회수"
FROM PROJECTS p
WHERE 	CATE_NAME = 'IT'
		AND PRO_START_DATE <= sysdate 
		AND sysdate <= PRO_FINISH_DATE
ORDER BY PRO_HITS DESC;

/* 베스트 프로젝트 - 투자 금액순 */
SELECT PRO_MAIN_IMAGE "대표이미지", PRO_TITLE "프로젝트제목", PRO_GET_FUND "현재모금액",
		trunc(PRO_GET_FUND/PRO_TARGET_FUND, 2)*100||'%' "달성률",
		trunc(PRO_FINISH_DATE-sysdate) "남은날짜", PRO_HITS "조회수"
FROM PROJECTS p
WHERE 	CATE_NAME = 'IT'
		AND PRO_START_DATE <= sysdate 
		AND sysdate <= PRO_FINISH_DATE
ORDER BY PRO_GET_FUND DESC;

/* 다가올 프로젝트 - 다가올 프로젝트 전체 */
SELECT PRO_MAIN_IMAGE "대표이미지", PRO_TITLE "프로젝트제목", PRO_GET_FUND "현재모금액",
		trunc(PRO_GET_FUND/PRO_TARGET_FUND, 2)*100||'%' "달성률",
		trunc(PRO_FINISH_DATE-sysdate) "남은날짜", PRO_HITS "조회수"
FROM PROJECTS p
WHERE 	CATE_NAME = 'IT'
		AND PRO_START_DATE >= sysdate 
ORDER BY PRO_START_DATE ASC;


/* 다가올 프로젝트 - 유망 프로젝트 */
SELECT PRO_MAIN_IMAGE "대표이미지", PRO_TITLE "프로젝트제목", PRO_GET_FUND "현재모금액",
		trunc(PRO_GET_FUND/PRO_TARGET_FUND, 2)*100||'%' "달성률",
		trunc(PRO_FINISH_DATE-sysdate) "남은날짜", PRO_HITS "조회수"
FROM PROJECTS p
WHERE 	CATE_NAME = 'IT'
		AND PRO_START_DATE >= sysdate 
ORDER BY PRO_TARGET_FUND DESC;


/* 지나간 프로젝트 - 지나간 프로젝트 전체 */
SELECT PRO_MAIN_IMAGE "대표이미지", PRO_TITLE "프로젝트제목", PRO_GET_FUND "현재모금액",
		trunc(PRO_GET_FUND/PRO_TARGET_FUND, 2)*100||'%' "달성률",
		trunc(PRO_FINISH_DATE-sysdate) "남은날짜", PRO_HITS "조회수"
FROM PROJECTS p
WHERE 	CATE_NAME = 'IT'
		AND PRO_FINISH_DATE <= sysdate 
ORDER BY PRO_FINISH_DATE DESC;


/* 지나간 프로젝트 - 아까운 프로젝트 */

SELECT PRO_MAIN_IMAGE "대표이미지", PRO_TITLE "프로젝트제목", PRO_GET_FUND "현재모금액",
		trunc(PRO_GET_FUND/PRO_TARGET_FUND, 2)*100||'%' "달성률",
		trunc(PRO_FINISH_DATE-sysdate) "남은날짜", PRO_HITS "조회수"
FROM PROJECTS p
WHERE 	CATE_NAME = 'IT'
		AND PRO_FINISH_DATE <= sysdate
		AND 1 > (PRO_GET_FUND/PRO_TARGET_FUND)
		AND (PRO_GET_FUND/PRO_TARGET_FUND) >=0.95
ORDER BY PRO_FINISH_DATE DESC;
