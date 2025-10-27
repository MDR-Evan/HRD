<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSERT</title>
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
			function addCheck() {
				if(document.frm.id.value.length == 0){
					alert("교과목 코드가 입력되지 않았습니다.");
					frm.id.focus();
					return false;
				} else if(frm.name.value.length == 0) {
					alert("과목명이 입력되지 않았습니다.");
					frm.name.focus();
					return false;
				} else if(frm.credit.value.length == 0) {
					alert("학점이 입력되지 않았습니다.");
					frm.credit.focus();
					return false;
				} else if(frm.lecturer.value == 0) {
					alert("담당강사가 선택되지 않았습니다.");
					frm.id.focus();
					return false;
				} else if(frm.week[0].checked == false && frm.week[1].checked == false && frm.week[2].checked == false && frm.week[3].checked == false && frm.week[4].checked == false) {
					alert("요일이 선택되지 않았습니다.");
					frm.week.focus();
					return false;
				} else if(frm.start_hour.value.length == 0) {
					alert("시작시간이 입력되지 않았습니다.");
					frm.start_hour.focus();
					return false;
				} else if(frm.end_hour.value.length == 0) {
					alert("종료시간이 입력되지 않았습니다.");
					frm.end_hour.focus();
					return false;
				} else {
					alert("교과목 등록이 완료되었습니다.");
					document.frm.submit();
				}
				return true;
			}
			
			function search() {
				window.location = 'list.jsp'
			}
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2> 교과목 추가 </h2>
			<form method="post" action="action.jsp" name="frm">
				<input type="hidden" name="mode" value="insert">
				<table border="1">
					<tr>
						<td> 과목 코드 </td>
						<td> <input type="text" name="id" style="width:100%;"> </td>
					</tr>
					<tr>
						<td> 과목명 </td>
						<td> <input type="text" name="name" style="width:100%;"> </td>
					</tr>
					<tr>
						<td> 학점 </td>
						<td> <input type="text" name="credit" style="width:100%;"> </td>
					</tr>
					<tr>
						<td> 담당강사 </td>
						<td>
							<select name="lecturer" style="width:100%;">
								<option value=""> 담당강사선택 </option>
								<option value="1"> 김교수 </option>
								<option value="2"> 이교수 </option>
								<option value="3"> 박교수 </option>
								<option value="4"> 우교수 </option>
								<option value="5"> 최교수 </option>
								<option value="6"> 임교수 </option>
							</select>
						</td>
					</tr>
					<tr>
						<td> 요일 </td>
						<td>
							<input type="radio" name="week" value="1"> 월
							<input type="radio" name="week" value="2"> 화
							<input type="radio" name="week" value="3"> 수
							<input type="radio" name="week" value="4"> 목
							<input type="radio" name="week" value="5"> 금
						</td>
					</tr>
					<tr>
						<td> 시작 시간 </td>
						<td> <input type="text" name="start_hour" style="width:100%;"> </td>
					</tr>
					<tr>
						<td> 종료 시간 </td>
						<td> <input type="text" name="end_hour" style="width:100%;"> </td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="추가" onclick="addCheck()">&nbsp;&nbsp;
							<input type="button" value="목록" onclick="search()">
						</td>
					</tr>
				</table>
			</form>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>