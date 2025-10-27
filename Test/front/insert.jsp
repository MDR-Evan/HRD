<%@page import="java.sql.*"%>
<%@ page import="DBINOUT.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>INSERT</title>
		<script>
			function addCheck() {
				if(document.frm.regist_num.value.length == 0) {
					alert("주민번호가 입력되지 않았습니다!");
					document.frm.regist_num.focus();
					return false;
				} else if(document.frm.name.value.length == 0) {
					alert("이름이 입력되지 않았습니다!");
					document.frm.name.focus();
					return false;
				} else if(document.frm.university_name.value == 0) {
					alert("학교가 선택되지 않았습니다!");
					document.frm.university_name.focus();
					return false;
				}  else if(document.frm.major_name.value == 0) {
					alert("학과가 선택되지 않았습니다!");
					document.frm.major_name.focus();
					return false;
				}  else if(document.frm.s_score.value.length == 0) {
					alert("수능 점수가 입력되지 않았습니다!");
					document.frm.s_score.focus();
					return false;
				}  else if(document.frm.n_score.value.length == 0) {
					alert("내신 점수가 입력되지 않았습니다!");
					document.frm.n_score.focus();
					return false;
				}  else {
					alert("지원 내역이 정상적으로 등록 되었습니다.");
					document.frm.submit();
					window.location("index.jsp");
					return true;
				}
			}
			
			function wh() {
				alert("정보를 지우고 처음부터 다시 입력 합니다!");
				document.frm.regist_num.focus();
				frm.reset();
			}
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>원서 등록</h2>	
			<form name="frm" method="post" action="action.jsp">
				<table border="1">
					<tr>
						<td>주민 번호</td>
						<td><input type="text" name="regist_num">예)0211113000011</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>학교</td>
						<td>
							<select name=university_name>
								<option value="">학교</option>
								<option value="U001">[U001]서울대학교</option>
								<option value="U002">[U002]경기대학교</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>학과</td>
						<td>
							<select name=major_name>
								<option value="">학과</option>
								<option value="M001">[M001]법학과</option>
								<option value="M002">[M002]컴퓨터공학과</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>수능 점수</td>
						<td><input type="text" name="s_score">0~100</td>
					</tr>
					<tr>
						<td>내신 점수</td>
						<td><input type="text" name="n_score">0~100</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="button" value="등록" onclick="addCheck()">
							<input type="button" value="다시쓰기" onclick="wh()">
						</td>
					</tr>
				</table>
			</form>
		</section>
		<jsp:include page="footer.jsp" />
	</body>
</html>