<%@page import="java.sql.*"%>
<%@ page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	try {
		Connection conn = Util.getConnetion();
		String sql = "insert into TBL_DRIVE values(?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, request.getParameter("drv_date"));
		pstmt.setString(2, request.getParameter("car_no"));
		pstmt.setString(3, request.getParameter("drv_start"));
		pstmt.setString(4, request.getParameter("drv_end"));
		pstmt.setString(5, request.getParameter("dept"));
		pstmt.setString(6, request.getParameter("drv_money"));
		
		pstmt.executeUpdate();
%>
<jsp:include page="index.jsp" />
<%
	} catch(Exception e) {
		e.printStackTrace();
	}
%>