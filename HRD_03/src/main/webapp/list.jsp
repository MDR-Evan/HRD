<%@page import="java.sql.*"%>
<%@ page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>LIST</title>
		<link rel="Stylesheet" href="style.css">
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>차량조회</h2>
			<form name="frm">
				<table border = "1">
					<tr>
						<td>차량번호</td>
						<td>모델</td>
						<td>제조사</td>
						<td>구매일</td>
					</tr>
<%
	try {
		Connection conn = Util.getConnetion();
		String sql = "select car_no, car_model, car_company, car_date from TBL_CAR";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String date = rs.getString(4);
			String car_date = date.substring(0,4)  + "년" + date.substring(4,6) + "월" + date.substring(6,8) + "일";
%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= car_date %></td>
					</tr>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
				</table>
			</form>
		</section>
		<jsp:include page="footer.jsp" />
	</body>
</html>