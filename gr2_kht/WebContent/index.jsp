<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "javaexp.a01_start.A02_Person"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>처음 만들어 보는 페이지캬캬캬컄캬컄ㅋ캬캬컄캬캬</title>
</head>
<body>



<%
//ctrl + F11 서버로 실행

/*
#web과 안드로이드 프로그래밍
	1. 무엇을 할 것인가?
		- 이러이러한 것을 만들어 주세요 (from 호갱님)
		- RFP(Request For Proposal) - 제안 요청서
		- RFQ(Request for Quality) - 견적 품질표
		- PM - RFP와 RFQ를 바탕으로 게약을 완료한 상황에서 구축하고자 하는 시스템의 개발자 입장에서 진행할 요구사항을 작성하여 고객과 협의
		- 요구사항 정의서 (최상위 항목)
		- use case 다이어그램 - 시스템의 흐름도 (ex 쇼핑몰 - 화면 진입, 회원 가입, 장바구니, 결제, 등등등등 어떻게 흘러가게 만들것인가)
	2. 어떤 화면을 구현할 것인가
		- 화면 설계서
	3. 구현 front end
		- css, html
		- javascript
		- 안드로이드 화면
	4. 구현 back end
		- DB 설계화 sql 작성
		- jsp 처리 (화면 + DB 연동 처리)
		- 안드로이드와 DB 연동데이터 처리
*/

String name = "바보야";
A02_Person x = new A02_Person();
%>


<h1><%= name %>님 하이</h1>
<h2>이름:<%= x.abc %></h2>
<h2>나이:<%= x.agee %></h2>
</body>
</html>