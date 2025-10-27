<%@page import="java.sql.*"%>
<%@ page import="DBINOUT.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>COUNT</title>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>학교별 통계</h2>	
			<form>
				<table border="1" style="text-align: center;">
					<tr>
						<td>대학 코드</td>
						<td>학교명</td>
						<td>지원 인원</td>
						<td>총점 평균</td>
					</tr>
					<tr>
<%
	try {
		Connection conn = Util.getConnection();
		String sql = "select u.university_code, u.university_name, count(a.university_code), sum(a.total_score) / count(a.university_code) from tbl_university u join tbl_apply a on u.university_code = a.university_code group by u.university_code, u.university_name order by university_code";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			float score = rs.getFloat(4);
			String t_score = String.format("%.1f", score);
%>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= t_score %></td>
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