<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3> Data base 연동 </h3>
		<%	/* 자바 DB 연동 프로그램 */
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				
				Statement stmt = con.createStatement();
				String sql = "select sysdate from dual" ;
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					out.print("출력: " + rs.getString(1));
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>