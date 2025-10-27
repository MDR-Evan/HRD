<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HEADER</title>
		<style>
		* {
			margin: 0px;
			padding: 0px;
		}
		
		header {
			position: fixed;
			top: 0px;
			width: 100%;
			height: 40px;
			line-height: 40px;
			background-color: blue;
			color: white;
			text-align: center;
			font-size: 30px;
		}
		
		nav {
			position: fixed;
			top: 40px;
			width: 100%;
			height: 30px;
			line-height: 30px;
			background-color: lightblue;
			padding-left: 20px;
		}
		
		nav > a {
			text-decoration: none;
		}
		</style>
	</head>
	<body>
		<header><b> 수강신청 도우미 사이트 </b></header>
		<nav>
			<a href="list.jsp">교과목목록 조회/수정</a>&nbsp;&nbsp;
			<a href="insert.jsp">교과목 추가</a>&nbsp;&nbsp;
			<a href="index.jsp">홈으로</a>
		</nav>
	</body>
</html>