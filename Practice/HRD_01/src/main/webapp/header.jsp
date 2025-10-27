<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HEADER</title>
		<style>			
			header{
				position: pixed;
				width: 100%;
				height: 40px;
				background-color: blue;
				color: white;
				text-align: center;
				line-height: 40px;
				font-size: 30px;
			}
			
			nav{
				position: pixed;
				width: 100%;
				height: 25px;
				background-color: lightblue;
				color: white;
				line-height: 25px;
				padding-left: 20px;
			}
			
			nav > a{
				text-decoration: none;
			}
		</style>
	</head>
	<body>
	<header> 쇼핑몰 회원관리 ver 1.0 </header>
	<nav> 
		<a href="join.jsp">회원등록</a> &nbsp; 
		<a href="list.jsp">회원목록조회/수정</a> &nbsp; 
		<a href="salary.jsp">회원매출조회</a> &nbsp; &nbsp; &nbsp; &nbsp; 
		<a href="index.jsp">홈으로</a> 
	</nav>
	</body>
</html>