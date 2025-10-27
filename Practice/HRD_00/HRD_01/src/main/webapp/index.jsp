<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>INDEX</title>
		<style>
			* {
				margin: 0px;
				padding: 0px;
			}
			
			section {
				display: fixed;
				width: 100%;
				height: 100%;
				background-color: lightgray;
			}
			
			section > h2 {
				text-align: center;
			}
			
			section > p {
				padding-left: 10px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>편의점 매출 관리 프로그램</h2>
			<p>
				편의점 매출정보와 상품관리를 위한 데이터베이스를 구축하고 편의점 대출관리 프로그램을 작성하는 프로그램이다.<br>
				1. 상품정보테이블을 생성한다.<br>
				2. 매출정보테이블을 생성한다.<br>
				3. 점포정보테이블을 생성한다.<br>
				4. 매출정보테이블에서 제시한 문제지의 참조데이터를 추가 생성한다.<br>
				5. 상품정보프로그램을 작성한다.<br>
				6. 상품관리(등록,수정,삭제)프로그램을 작성한다.<br>
				7. 매출현황 조회 프로그램을 작성한다.
			</p>
		</section>
		<jsp:include page="footer.jsp" />
	</body>
</html>