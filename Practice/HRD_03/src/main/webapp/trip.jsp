<%@page import="java.sql.*"%>
<%@ page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TRIP</title>
		<link rel="Stylesheet" href="style.css">
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>차량조회</h2>
			<form name="frm">
				<table border = "1">
					<tr>
						<td>주행일자</td>
						<td>차량번호</td>
						<td>모델</td>
						<td>출발km</td>
						<td>도착km</td>
						<td>부서명</td>
						<td>주유금액</td>
					</tr>
<%
	try {
		Connection conn = Util.getConnetion();
		String sql = "select d.drv_date, d.car_no, c.car_model, d.drv_start, d.drv_end, d.dept_code, d.drv_money from tbl_car c, tbl_drive d where c.car_no = d.car_no";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String date = rs.getString(1);
			int start = rs.getInt(4);
			int end = rs.getInt(5);
			String dept = "";
			int money = rs.getInt(7);
			
			String car_date = date.substring(0,4)  + "년" + date.substring(4,6) + "월" + date.substring(6,8) + "일";
			String drv_start = String.format("%,3d", start);
			String drv_end = String.format("%,3d", end);
			
			switch(rs.getString(6)){
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
						<td><%= car_date %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= drv_start %></td>
						<td><%= drv_end %></td>
						<td><%= dept %></td>
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