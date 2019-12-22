<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String sId = "";
	String sPassword = "";
	String sUserType = "";
	try {
		sId = request.getParameter("id");
		sPassword = request.getParameter("pw");
		sUserType = request.getParameter("userType");
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.dropbtn {
	background-color: #f1f1f1;
	color: black;
	padding: 5px;
	font-size: 16px;
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 5px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #f1f1f1;
}
</style>
</head>
<script type="text/javascript">
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
			return;
		else
			return false;
	}

	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9){
			if(Number(document.join_detail.age.value) > 0 
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.join_detail.age.value = "";
				alert("1 이상의 숫자만 가능합니다.");
			}
		}
			
		else{
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function removeChar1(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9){
			if(Number(document.join_detail.userClass.value) > 0 && Number(document.join_detail.userClass.value) < 11 
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.join_detail.userClass.value = "";
				alert("1 이상 10 이하의 숫자만 가능합니다.");
			}
		}
			
		else{
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function removeChar2(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9){
			if(Number(document.join_detail.mana.value) > 0 
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.join_detail.mana.value = "";
				alert("1 이상의 숫자만 가능합니다.");
			}
		}
			
		else{
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function removeChar3(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9){
			if(Number(document.join_detail.maxClass.value) > 0 && Number(document.join_detail.maxClass.value) < 11 
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.join_detail.maxClass.value = "";
				alert("1 이상 10 이하의 숫자만 가능합니다.");
			}
		}
			
		else{
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function removeChar4(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9){
			if(Number(document.join_detail.age1.value) > 0
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.join_detail.age1.value = "";
				alert("1 이상의 숫자만 가능합니다.");
			}
		}
			
		else{
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function setDropdownMenu(str, obj) {
		document.getElementsByName(obj)[0].value = str;
	}

	function CheckJoinDetail() {
		if(document.join_detail.userType.value == "마법사"){
			if (document.join_detail.name.value == "") {
				alert("이름을 입력해주세요.");
				document.join_detail.name.focus();
				return;
			}
			if (document.join_detail.age.value == "") {
				alert("나이를 입력해주세요.");
				document.join_detail.age.focus();
				return;
			}
			if (document.join_detail.species.value == "종족") {
				alert("종족을 선택해주세오.");
				return;
			}
			if (document.join_detail.birth.value == "") {
				alert("출생지를 입력해주세요.");
				document.join_detail.birth.focus();
				return;
			}
			if (document.join_detail.job.value == "") {
				alert("직업을 입력해주세요.");
				document.join_detail.job.focus();
				return;
			}
			if (document.join_detail.userClass.value == "") {
				alert("클래스를 입력해주세요.");
				document.join_detail.userClass.focus();
				return;
			}
			if (document.join_detail.property.value == "속성") {
				alert("속성을 선택해주세요.");
				return;
			}
			if (document.join_detail.mana.value == "") {
				alert("마나량을 입력해주세요.");
				document.join_detail.mana.focus();
				return;
			}
			if (document.join_detail.magicstroreID.value == "소속 마법상회") {
				alert("소속 마법상회를 선택해주세요.");
				document.join_detail.magicstroreID.focus();
				return;
			}
			document.join_detail.submit();
		}
		else if(document.join_detail.userType.value == "마법상회"){
			if (document.join_detail.storename.value == "") {
				alert("상회명을 입력해주세요.");
				document.join_detail.storename.focus();
				return;
			}
			if (document.join_detail.address.value == "") {
				alert("주소를 입력해주세요.");
				document.join_detail.address.focus();
				return;
			}
			if (document.join_detail.representative.value == "") {
				alert("대표자 이름을 입력해주세요.");
				document.join_detail.representative.focus();
				return;
			}
			if (document.join_detail.maxClass.value == "") {
				alert("거래 허가 클래스를 입력해주세요.");
				document.join_detail.maxClass.focus();
				return;
			}
			document.join_detail.submit();
		}
		else if(document.join_detail.userType.value == "소비자"){
			if (document.join_detail.name1.value == "") {
				alert("이름을 입력해주세요.");
				document.join_detail.name1.focus();
				return;
			}
			if (document.join_detail.age1.value == "") {
				alert("나이를 입력해주세요.");
				document.join_detail.age1.focus();
				return;
			}
			if (document.join_detail.address1.value == "") {
				alert("주소를 입력해주세요.");
				document.join_detail.address1.focus();
				return;
			}
			if (document.join_detail.property1.value == "속성") {
				alert("속성을 선택해주세요.");
				return;
			}
			document.join_detail.submit();
		}
	}
</script>
<body>
	<div align="center">
		<form name=join_detail action="join_processing.jsp" method="post">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>마법관리 체계 회원가입</h4></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value=<%=sId%> readonly="readonly" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" value=<%=sPassword%> readonly="readonly" /></td>
				</tr>
				<tr>
					<td>사용자 타입</td>
					<td><input name=userType type=text value=<%=sUserType%> readonly="readonly" /></td>
				</tr>

				<%
					if (sUserType.equals("마법사")) {
				%>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age"
						onkeydown="onlyNumber(event)" onkeyup='removeChar(event)' /></td>
				</tr>
				<tr>
					<td>종족</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name=species type=text value="종족"
								readonly="readonly" />
							<div class="dropdown-content">
								<a href='javascript:void(0);'
									onclick="setDropdownMenu('인간', 'species');">인간</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('엘프', 'species');">엘프</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('오크', 'species');">오크</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('드워프', 'species');">드워프</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('기타', 'species');">기타</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>출신지</td>
					<td><input type="text" name="birth" /></td>
				</tr>
				<tr>
					<td>직업</td>
					<td><input type="text" name="job" /></td>
				</tr>
				<tr>
					<td>클래스</td>
					<td><input type="text" name="userClass"
						onkeydown="onlyNumber(event)" onkeyup='removeChar1(event)' /></td>
				</tr>
				<tr>
					<td>속성</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name=property type=text value="속성"
								readonly="readonly" />
							<div class="dropdown-content">
								<a href='javascript:void(0);'
									onclick="setDropdownMenu('빛', 'property');">빛</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('어둠', 'property');">어둠</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('불', 'property');">불</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('물', 'property');">물</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('바람', 'property');">바람</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('땅', 'property');">땅</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>마나량</td>
					<td><input type="text" name="mana"
						onkeydown="onlyNumber(event)" onkeyup='removeChar2(event)' /></td>
				</tr>
				<tr>
					<td>소속 마법상회</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name=magicstroreID type=text
								value="소속 마법상회" readonly="readonly" />
							<div class="dropdown-content">
								<%
									DatabaseConnection mDBConn = null;
									ResultSet mRs = null;
									try {
										mDBConn = new DatabaseConnection();
										Statement mStmt = mDBConn.getStmt();
										String sQuery = "SELECT storename FROM magicstore;";

										mRs = mStmt.executeQuery(sQuery);

										while (mRs.next()) {
								%>
								<a href='javascript:void(0);'
									onclick="setDropdownMenu('<%=mRs.getString("storename")%>', 'magicstroreID');"><%=mRs.getString("storename")%></a>
								<%
										}
									} catch (Exception e) {
										e.printStackTrace();
									} finally {
										try {
											mRs.close();
											mDBConn.CloseConnection();
										} catch (Exception e) {
											e.printStackTrace();
										}
									}
								%>
							</div>
						</div>
					</td>
				</tr>
				<%
					} 
					else if (sUserType.equals("마법상회")) {
				%>
				<tr>
					<td>상호명</td>
					<td><input type="text" name="storename" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td>대표자 이름</td>
					<td><input type="text" name="representative" /></td>
				</tr>
				<tr>
					<td>거래 허가 클래스</td>
					<td><input type="text" name="maxClass"
						onkeydown="onlyNumber(event)" onkeyup='removeChar3(event)' /></td>
				</tr>
				<%
					} 
					else {
				%>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name1" /></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age1"
						onkeydown="onlyNumber(event)" onkeyup='removeChar4(event)' /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address1" /></td>
				</tr>
				<tr>
					<td>속성</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name="property1" type="text" value="속성"
								readonly="readonly" />
							<div class="dropdown-content">
								<a href='javascript:void(0);' onclick="setDropdownMenu('빛', 'property1');">빛</a> 
								<a href='javascript:void(0);' onclick="setDropdownMenu('어둠', 'property1');">어둠</a> 
								<a href='javascript:void(0);'onclick="setDropdownMenu('불', 'property1');">불</a> 
								<a href='javascript:void(0);'onclick="setDropdownMenu('물', 'property1');">물</a> 
								<a href='javascript:void(0);' onclick="setDropdownMenu('바람', 'property1');">바람</a> 
								<a href='javascript:void(0);'onclick="setDropdownMenu('땅', 'property1');">땅</a>
							</div>
						</div>
					</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<input type="button" value="취소"
								onClick="javascript:location.href='main.jsp'" /> <input
								type="button" value="다음" onClick="CheckJoinDetail()" />
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>