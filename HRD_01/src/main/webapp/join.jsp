<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JOIN</title>
		<style>
			*{
				margin: 0;
				padding: 0;
			}
			
			section{
				position: fixed;
				width: 100%;
				height: 100%;
				background-color: lightgray
			}
			
			section > h2{
				text-align: center;
			}
			
			section > form{
				display: flex;
				align-items: center;
				justify-content: center;
				text-align: center;
			}
		</style>
		<script>
			function joinCheck() {
				if(document.frm.custname.value.length == 0) {
					alert("회원성명이 입력되지 않았습니다.");
					frm.custname.focus();
					return false;
				} else if(document.frm.phone.value.length == 0) {
					alert("회원번호가 입력되지 않았습니다.");
					frm.custphone.focus();
					return false;
				} else if(document.frm.address.value.length == 0) {
					alert("회원주소가 입력되지 않았습니다.");
					frm.address.focus();
					return false;
				} else if(document.frm.joindate.value.length == 0) {
					alert("가입일자가 입력되지 않았습니다.");
					frm.joindate.focus();
					return false;
				} else if(document.frm.grade.value.length == 0) {
					alert("고객등급이 입력되지 않았습니다.");
					frm.grade.focus();
					return false;
				} else if(document.frm.city.value.length == 0) {
					alert("도시코드가 입력되지 않았습니다.");
					frm.city.focus();
					return false;
				} else {
					success();
					return true;
				}
			}
			
			function success() {
				alert("회원정보수정이 완료되었습니다.");
			}
			
			function search() {
				window.location = 'list.jsp';
			}
		</script>
	</head>
	<%
		Connection conn = null;
		Statement stmt = null;
		String custno = "";
		
		try {
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "Select max(custno) + 1 as custno from member_tbl_02";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			custno = rs.getString("custno");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
	<body>
		<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2><b>홈쇼핑 회원 등록</b></h2>
			<form name="frm" method="post" action="action.jsp">
				<input type="hidden" name="mode" value="insert">
				<table border="1">
					<tr>
						<td>회원번호(자동발생)</td>
						<td><input type="text" name="custno" value = "<%= custno %>" readonly></td>
					</tr>
					<tr>
						<td>회원성명</td>
						<td><input type="text" name="custname" value=""></td>
					</tr>
					<tr>
						<td>회원전화</td>
						<td><input type="text" name="phone" value=""></td>
					</tr>
					<tr>
						<td>회원주소</td>
						<td><input type="text" name="address" value=""></td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td><input type="text" name="joindate" value=""></td>
					</tr>
					<tr>
						<td>고객등급[A:VIP, B:일반, C:직원]</td>
						<td><input type="text" name="grade" value=""></td>
					</tr>
					<tr>
						<td>도시코드</td>
						<td><input type="text" name="city" value=""></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록" onclick="success()">
							<input type="button" value="조회" onclick="search()">
						</td>
					</tr>
				</table>
			</form>
		</section>
		<jsp:include page="footer.jsp" />
	</body>
	</body>
</html>