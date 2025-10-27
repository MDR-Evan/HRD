<%@page import="java.sql.*"%>
<%@ page import="DBINOUT.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>LIST</title>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>대학 조회</h2>	
			<form>
				<table border="1" style="text-align: center;">
					<tr>
						<td>대학 코드</td>
						<td>학교명</td>
						<td>전화번호</td>
					</tr>
					<tr>
<%
	try {
		Connection conn = Util.getConnection();
		String sql = "select university_code, university_name, phone_num from tbl_university";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String num = rs.getString(3);
			String phone_num = num.substring(0, 3) + "-" + num.substring(3, 7) + "-" + num.substring(7, 11);
%>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= phone_num %></td>
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