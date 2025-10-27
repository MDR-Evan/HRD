<%@page import="java.sql.*"%>
<%@ page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>COUNT</title>
		<link rel="Stylesheet" href="style.css">
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>(부서별)주행통계</h2>
			<form name="frm">
				<table border = "1">
					<tr>
						<td>부서코드</td>
						<td>부서명</td>
						<td>총운행거리</td>
						<td>총주유금액</td>
					</tr>
<%
	try {
		Connection conn = Util.getConnetion();
		String sql = "select de.dept_code, de.dept_code, sum(dr.drv_end - dr.drv_start), sum(dr.drv_money) from tbl_dept de join tbl_drive dr on dr.dept_code = de.dept_code group by de.dept_code, de.dept_code order by de.dept_code asc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String dept = "";
			int money = rs.getInt(4);
			
			switch(rs.getString(2)){
				case "10":
					dept = "영업부";
					break;
				case "20":
					dept = "총무부";
					break;
				case "30":
					dept = "구매부";
					break;
				case "40":
					dept = "개발부";
					break;
			}
			
			String drv_money = String.format("(원)%,3d", money);
%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= dept %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= drv_money %></td>
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