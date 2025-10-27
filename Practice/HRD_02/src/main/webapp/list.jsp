<%@page import="java.sql.*"%>
<%@ page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>LIST</title>
		<style>
			* {
				margin: 0px;
				padding: 0px;
			}
			
			section {
				position: fixed;
				top:70px;
				width: 100%;
				height: 100%;
				background-color: lightgray;
			}
			
			section > h2 {
				text-align: center;
			}
			
			section > form {
				display: flex;
				align-items: center;
				justify-content: center;
				text-align: center;
			}
		</style>
		<script>
			
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2> 교과목 목록 조회/수정 </h2>
			<form>
				<table border="1">
					<tr>
						<td> 과목코드 </td>
						<td> 과목명 </td>
						<td> 학점 </td>
						<td> 담당강사 </td>
						<td> 요일 </td>
						<td> 시작시간 </td>
						<td> 종료시간 </td>
						<td> 삭제 </td>
					</tr>
<%
	request.setCharacterEncoding("UTF-8");
	try{
		Connection conn = Util.getConnection();
		String sql = "select id, co.name cname, credit, le.name lname, week, start_hour, end_hour from course_tbl co, lecturer_tbl le where co.lecturer = le.idx order by co.id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String week = rs.getString(5);
			switch(week) {
				case "1" : 
					week = "월요일"; 
					break;
				case "2" : 
					week = "화요일"; 
					break;
				case "3" : 
					week = "수요일"; 
					break;
				case "4" : 
					week = "목요일"; 
					break;
				case "5" : 
					week = "금요일"; 
					break;
			}
			
			String startHour = rs.getString(6);
			while(startHour.length() < 4) {
				startHour = "0" + startHour;
			}
			String start = startHour.substring(0,2) + "시" + startHour.substring(2,4) + "분";
			
			String endHour = rs.getString(7);
			while(endHour.length() < 4) {
				endHour = "0" + endHour;
			}
			String end = endHour.substring(0,2) + "시" + endHour.substring(2,4) + "분";
%>
					<tr>
						<td><a href="modify.jsp?id=<%= rs.getString(1) %>"> <%= rs.getString(1) %> </a></td>
						<td> <%= rs.getString(2) %> </td>
						<td> <%= rs.getString(3) %> </td>
						<td> <%= rs.getString(4) %> </td>
						<td> <%= week %> </td>
						<td> <%= start %> </td>
						<td> <%= end %> </td>
						<td> <a href="action.jsp?id=<%= rs.getString(1) %>&mode=delete">삭제 </td>
					</tr>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
					<tr>
					</tr>
				</table>
			</form>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>