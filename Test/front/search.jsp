<%@ page import="java.sql.*"%>
<%@ page import="DBINOUT.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>SEARCH</title>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>원서 접수 조회</h2>	
			<form>
				<table border="1" style="text-align: center;">
					<tr>
						<td>이름</td>
						<td>주민번호</td>
						<td>학교</td>
						<td>학과</td>
						<td>수능점수</td>
						<td>내신점수</td>
						<td>총점</td>
						<td>순위</td>
					</tr>
					<tr>
<%
	try {
		Connection conn = Util.getConnection();
		String sql = "select name, regist_num, university_code, major_code, s_score, n_score, total_score from tbl_apply order by total_score desc, s_score desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String num = rs.getString(2);
			String regist_num = num.substring(0, 6) + "-" + num.substring(6, 13);
			String uni = "";
			String dept = "";
			
			switch(rs.getString(3)) {
				case "U001":
					uni = "서울대학교";
					break;
					
				case "U002":
					uni = "경기대학교";
					break;
			}
			
			switch(rs.getString(4)) {
				case "M001":
					dept = "법학과";
					break;
					
				case "M002":
					dept = "컴퓨터공학과";
					break;
			}
			int test = rs.getRow();
%>
						<td><%= rs.getString(1) %></td>
						<td><%= regist_num %></td>
						<td><%= uni %></td>
						<td><%= dept %></td>
						<td><%= rs.getInt(5) %></td>
						<td><%= rs.getInt(6) %></td>
						<td><%= rs.getInt(7) %></td>
						<td><%= test %></td>
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