<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HEADER</title>
		<style>		
			header {
				display: fixed;
				width: 100%;
				height: 40px;
				background-color: blue;
				color: white;
				font-size: 30px;
				text-align: center;
				line-height: 40px;
			}
			
			nav {
				display: fixed;
				width: 100%;
				height: 30px;
				background-color: lightblue;
				line-height: 30px;
				padding-left: 20px;
			}
			
			nav > a {
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<header> 편의점 매출 관리 ver 1.0 </header>
		<nav>
			<a href="sale_insert.jsp"> 매출등록 </a> &nbsp;&nbsp;
			<a href="store_manager.jsp"> 상품관리 </a> &nbsp;&nbsp;
			<a href="sale_select"> 매출현황 </a> &nbsp;&nbsp;
			<a href="index.jsp"> 홈으로 </a>
		</nav>
	</body>
</html>