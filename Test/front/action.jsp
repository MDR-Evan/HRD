<%@page import="java.sql.*"%>
<%@ page import="DBINOUT.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	try {
		Connection conn = Util.getConnection();
		String sql = "INSERT INTO tbl_apply VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		String 	regist_num = request.getParameter("regist_num");
		String	university_code = request.getParameter("university_name");
		String	major_code = request.getParameter("major_name");
		String	name = request.getParameter("name");
				
		int s_score = Integer.parseInt(request.getParameter("s_score"));
		int n_score = Integer.parseInt(request.getParameter("n_score"));
		
		int total_score = (int) s_score + (int) n_score;
		
		pstmt.setString(1, regist_num);
		pstmt.setString(2, university_code);
		pstmt.setString(3, major_code);
		pstmt.setString(4, name);
		pstmt.setInt(5, s_score);
		pstmt.setInt(6, n_score);
		pstmt.setInt(7, total_score);
		
		pstmt.executeUpdate();
%>
<jsp:forward page="index.jsp" />
<%		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>