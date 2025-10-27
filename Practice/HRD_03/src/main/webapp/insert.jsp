<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>INSERT</title>
		<link rel="Stylesheet" href="style.css">
		<script>
			function addCheck() {
				if(document.frm.drv_date.value.length == 0) {
					alert("주행일자가 입력되지 않았습니다!");
					document.frm.drv_date.focus();
					return false;
				} else if(document.frm.car_no.value.length == 0) {
					alert("차량번호가 입력되지 않았습니다!");
					document.frm.car_no.focus();
					return false;
				} else if(document.frm.drv_start.value.length == 0) {
					alert("출발Km가 입력되지 않았습니다!");
					document.frm.drv_start.focus();
					return false;
				} else if(document.frm.drv_end.value.length == 0) {
					alert("도착km가 입력되지 않았습니다!");
					document.frm.drv_end.focus();
					return false;
				} else if(document.frm.dept.value == 0) {
					alert("부서코드가 선택되지 않았습니다!");
					document.frm.drv_date.focus();
					return false;
				} else if(document.frm.drv_money.value.length == 0) {
					alert("주유금액이 입력되지 않았습니다!");
					document.frm.drv_money.focus();
					return false;
				} else {
					alert("주행내역이 정상적으로 등록 되었습니다!");
					document.frm.submit();
					return true;
				}
			}
			
			function reset() {
				alert("정보를 지우고 처음부터 다시 입력 합니다!");
				document.frm.reset();
			}
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>주행내역등록</h2>
			<form name="frm" method="post" action="insert_act.jsp">
				<table border = "1">
					<tr>
						<td>주행일자</td>
						<td><input type="text" name=drv_date>2023년01월01일 예)20230101</td>
					</tr>
					<tr>
						<td>차량번호</td>
						<td><input type="text" name=car_no>예)10가0001</td>
					</tr>
					<tr>
						<td>출발Km</td>
						<td><input type="text" name=drv_start>Km</td>
					</tr>
					<tr>
						<td>도착Km</td>
						<td><input type="text" name=drv_end>Km</td>
					</tr>
					<tr>
						<td>부서코드</td>
						<td>
							<select name="dept">
								<option value="0">부서</option>
								<option value="10">[10]영업부</option>
								<option value="20">[20]총무부</option>
								<option value="30">[30]구매부</option>
								<option value="40">[40]개발부</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>주유금액</td>
						<td><input type="text" name=drv_money>원</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="주행내역등록" onclick="addCheck()">
							<input type="button" value="다시쓰기" onclick="reset()">
						</td>
					</tr>
				</table>
			</form>
		</section>
		<jsp:include page="footer.jsp" />
	</body>
</html>