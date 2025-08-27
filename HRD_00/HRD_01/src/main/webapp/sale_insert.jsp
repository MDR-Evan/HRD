<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBPKG.Util" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>매출등록</title>
		<style>
			* {
				margin: 0px;
				padding: 0px;
			}
			
			section {
				display: fixed;
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
			function insertCheck() {
				if(document.frm.sale_fg.lenght == 0) {
					alert("판매구분을 선택하지 않았습니다.");
					frm.sale_no.focus();
					return false;
				} else if(document.frm.store_cd.lenght == 0) {
					alert("판매점포를 선택하지 않았습니다.");
					frm.store_cd.focus();
					return false;
				} else if(document.frm.goods_cd.lenght == 0) {
					alert("판매상품을 선택하지 않았습니다.");
					frm.goods_cd.focus();
					return false;
				} else if(document.frm.sale_cnt.lenght == 0) {
					alert("판매수량을 입력하지 않았습니다.");
					frm.sale_cnt.focus();
					return false;
				} else if(document.frm.pay_type.lenght == 0) {
					alert("수취구분을 선택하지 않았습니다.");
					frm.pay_type.focus();
					return false;
				} else {
					success();
					return true;
				}
			}
			
			function success() {
				alert("매출이 정상적으로 저장되었습니다.");
			}
		</script>
	</head>
	<% 
		Connection conn = null;
		Statement stmt = null;
		String sale_no = "", sale_ymd = "";
		
		try{
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "select max(sale_no) + 1 as sale_no, max(sale_ymd) + 1 as sale_ymd from tbl_sale_003";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			sale_no = rs.getString("sale_no");
			sale_ymd = rs.getString("sale_ymd");
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
	<body>
		<jsp:include page="header.jsp" />
		<section>
			<h2>매출등록</h2>
			<form name="frm">
				<table border="1">
					<tr>
						<td>판매번호(자동발생)</td>
						<td><input type="text" readonly="readonly" value="<%= sale_no %>"></td>
					</tr>
					<tr>
						<td>판매일자(자동발생)</td>
						<td><input type="text" readonly="readonly" value="<%= sale_ymd %>>"></td>
					</tr>
					<tr>
						<td>판매구분</td>
						<td>
							<select>
								<option>선택</option>
								<option>판매</option>
								<option>판매취소</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매점포</td>
						<td>
							<select>
								<option>선택</option>
								<option>이태원점</option>
								<option>한남점</option>
								<option>도원점</option>
								<option>혜화점</option>
								<option>방배점</option>
								<option>사당점</option>
								<option>흑석점</option>
								<option>금호점</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매상품</td>
						<td>
							<select>
								<option>선택</option>
								<option>라면</option>
								<option>빵</option>
								<option>과자</option>
								<option>탄산음료</option>
								<option>삼각김밥</option>
								<option>초콜릿</option>
								<option>우유</option>
							</select>	
						</td>
					</tr>
					<tr>
						<td>판매수량</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>수취구분</td>
						<td><input type="radio" checked="checked">현금&nbsp;<input type="radio">카드</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록" onclick="insertCheck()">
							<input type="button" value="조회">
						</td>
					</tr>
				</table>
			</form>
		</section>
		<jsp:include page="footer.jsp" />
	</body>
</html>