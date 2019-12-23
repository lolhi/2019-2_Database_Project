<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0L);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="Database.MagicianInfomation"%>
<%@page import="Database.MagicStoreInfomation"%>
<%@page import="Database.CustomerInfomation"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
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
			if(Number(document.update_info.age.value) > 0 
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.update_info.age.value = "";
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
			if(Number(document.update_info.userClass.value) > 0 && Number(document.update_info.userClass.value) < 11 
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.update_info.userClass.value = "";
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
			if(Number(document.update_info.mana.value) > 0 
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.update_info.mana.value = "";
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
			if(Number(document.update_info.maxClass.value) > 0 && Number(document.update_info.maxClass.value) < 11 
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.update_info.maxClass.value = "";
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
			if(Number(document.update_info.age1.value) > 0
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
				return;
			else{
				document.update_info.age1.value = "";
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
	
	function CheckUpdateInfo() {
		if (document.update_info.pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			document.update_info.pw.focus();
			return;
		}
		if (document.update_info.pw1.value == "") {
			alert("비밀번호확인을 입력해주세요.");
			document.update_info.pw2.focus();
			return;
		}
		if (document.update_info.pw1.value != document.update_info.pw.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			document.update_info.pw.focus();
			return;
		}
		if(document.update_info.userType.value == "마법사"){
			
			if (document.update_info.name.value == "") {
				alert("이름을 입력해주세요.");
				document.update_info.name.focus();
				return;
			}
			if (document.update_info.age.value == "") {
				alert("나이를 입력해주세요.");
				document.update_info.age.focus();
				return;
			}
			if (document.update_info.species.value == "종족") {
				alert("종족을 선택해주세오.");
				return;
			}
			if (document.update_info.birth.value == "") {
				alert("출생지를 입력해주세요.");
				document.update_info.birth.focus();
				return;
			}
			if (document.update_info.job.value == "") {
				alert("직업을 입력해주세요.");
				document.update_info.job.focus();
				return;
			}
			if (document.update_info.userClass.value == "") {
				alert("클래스를 입력해주세요.");
				document.update_info.userClass.focus();
				return;
			}
			if (document.update_info.property.value == "속성") {
				alert("속성을 선택해주세요.");
				return;
			}
			if (document.update_info.mana.value == "") {
				alert("마나량을 입력해주세요.");
				document.update_info.mana.focus();
				return;
			}
			document.update_info.submit();
		}
		else if(document.update_info.userType.value == "마법상회"){
			if (document.update_info.storename.value == "") {
				alert("상회명을 입력해주세요.");
				document.update_info.storename.focus();
				return;
			}
			if (document.update_info.address.value == "") {
				alert("주소를 입력해주세요.");
				document.update_info.address.focus();
				return;
			}
			if (document.update_info.representative.value == "") {
				alert("대표자 이름을 입력해주세요.");
				document.update_info.representative.focus();
				return;
			}
			if (document.update_info.maxClass.value == "") {
				alert("거래 허가 클래스를 입력해주세요.");
				document.update_info.maxClass.focus();
				return;
			}
			document.update_info.submit();
		}
		else if(document.update_info.userType.value == "소비자"){
			if (document.update_info.name1.value == "") {
				alert("이름을 입력해주세요.");
				document.update_info.name1.focus();
				return;
			}
			if (document.update_info.age1.value == "") {
				alert("나이를 입력해주세요.");
				document.update_info.age1.focus();
				return;
			}
			if (document.update_info.address1.value == "") {
				alert("주소를 입력해주세요.");
				document.update_info.address1.focus();
				return;
			}
			if (document.update_info.property1.value == "속성") {
				alert("속성을 선택해주세요.");
				return;
			}
			document.update_info.submit();
		}
	}
</script>
<body>
	<div align="center">
		<%
			String sId = "";
			String sUserType = "";
			try {
				sId = session.getAttribute("id").toString();
				sUserType = session.getAttribute("userType").toString();
				System.out.println(sId + "," + sUserType);
			} catch (Exception e) {
		%>
			<script type="text/javascript">
				alert("비정상적인 접근입니다. 로그인 화면으로 되돌아갑니다.");
				window.location.href = 'http://localhost:8080/DBproject/main.jsp';
			</script>
		<%
				return;
			}
		%>
		<form name=update_info action="update_info_processing.jsp" method="post">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>마법관리 체계 정보수정</h4></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value=<%=sId%>
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pw1" /></td>
				</tr>
				<tr>
					<td>사용자 타입</td>
					<td><input name=userType type=text value=<%=sUserType%> readonly="readonly" /></td>
				</tr>

				<%
					try {
						if (sUserType.equals("마법사")) {
							System.out.println(request.getParameter("info_name"));
							MagicianInfomation mMagicianInfo = null;
							mMagicianInfo = new MagicianInfomation(
									request.getParameter("info_id"),
									request.getParameter("info_password"),
									request.getParameter("info_name"),
									Integer.parseInt(request.getParameter("info_age")),
									request.getParameter("info_species"),
									request.getParameter("info_birth"),
									request.getParameter("info_job"),
									Integer.parseInt(request.getParameter("info_class")),
									request.getParameter("info_property"),
									Integer.parseInt(request.getParameter("info_mana")),
									Double.parseDouble(request.getParameter("info_money")),
									request.getParameter("info_magicstoreID"));
				%>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value=<%=mMagicianInfo.getsName() %>/></td>
				</tr>
				<script>
						document.update_info.name.value = document.update_info.name.value
								.replace('/', '');
				</script>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value=<%=mMagicianInfo.getsAge() %>
						onkeydown="onlyNumber(event)" onkeyup='removeChar(event)' /></td>
				</tr>
				<tr>
					<td>종족</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name=species type=text value=<%=mMagicianInfo.getsSpecies() %>
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
					<td><input type="text" name="birth" value=<%=mMagicianInfo.getsBirth() %> /></td>
				</tr>
				<script>
						document.update_info.birth.value = document.update_info.birth.value
								.replace('/', '');
				</script>
				<tr>
					<td>직업</td>
					<td><input type="text" name="job"  value=<%=mMagicianInfo.getsJob() %>/></td>
				</tr>
				<script>
						document.update_info.job.value = document.update_info.job.value
								.replace('/', '');
				</script>
				<tr>
					<td>클래스</td>
					<td><input type="text" name="userClass" value=<%=mMagicianInfo.getsClass() %>
						onkeydown="onlyNumber(event)" onkeyup='removeChar1(event)' /></td>
				</tr>
				<tr>
					<td>속성</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name="property" type="text" value=<%=mMagicianInfo.getsProperty() %>
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
					<td><input type="text" name="mana" value=<%=mMagicianInfo.getsMana() %>
						onkeydown="onlyNumber(event)" onkeyup='removeChar2(event)' /></td>
				</tr>
				<%
						} 
						else if (sUserType.equals("마법상회")) {
							MagicStoreInfomation mMagicStoreInfo = new MagicStoreInfomation(
									request.getParameter("info_store_id"),
									request.getParameter("info_store_password"),
									request.getParameter("info_store_name"),
									request.getParameter("info_store_address"),
									request.getParameter("info_store_representative"),
									Integer.parseInt(request.getParameter("info_store_maxclass")),
									Double.parseDouble(request.getParameter("info_store_money")));
				%>
				<tr>
					<td>상호명</td>
					<td><input type="text" name="storename" value=<%=mMagicStoreInfo.getsStoreName() %>/></td>
				</tr>
				<script>
						document.update_info.storename.value = document.update_info.storename.value
								.replace('/', '');
				</script>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value=<%=mMagicStoreInfo.getsAddress() %>/></td>
				</tr>
				<script>
						document.update_info.address.value = document.update_info.address.value
								.replace('/', '');
				</script>
				<tr>
					<td>대표자 이름</td>
					<td><input type="text" name="representative" value=<%=mMagicStoreInfo.getsRepresentative() %>/></td>
				</tr>
				<script>
						document.update_info.representative.value = document.update_info.representative.value
								.replace('/', '');
				</script>
				<tr>
					<td>거래 허가 클래스</td>
					<td><input type="text" name="maxClass" value=<%=mMagicStoreInfo.getiMaxClass() %>
						onkeydown="onlyNumber(event)" onkeyup='removeChar3(event)' /></td>
				</tr>
				<%
						} 
						else {
							CustomerInfomation mCustomerInfo = new CustomerInfomation(
									request.getParameter("info_customer_id"),
									request.getParameter("info_customer_password"),
									request.getParameter("info_customer_name"),
									Integer.parseInt(request.getParameter("info_customer_age")),
									request.getParameter("info_customer_address"),
									request.getParameter("info_customer_property"),
									Double.parseDouble(request.getParameter("info_customer_money")));
				%>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name1" value=<%=mCustomerInfo.getsName()%>/></td>
				</tr>
				<script>
						document.update_info.name1.value = document.update_info.name1.value
								.replace('/', '');
				</script>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age1" value=<%=mCustomerInfo.getiAge()%>
						onkeydown="onlyNumber(event)" onkeyup='removeChar4(event)' /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address1" value=<%=mCustomerInfo.getsAddress()%>/></td>
				</tr>
				<script>
						document.update_info.address1.value = document.update_info.address1.value
								.replace('/', '');
				</script>
				<tr>
					<td>속성</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name="property1" type="text" value=<%=mCustomerInfo.getsProperty()%>
								readonly="readonly" />
							<div class="dropdown-content">
								<a href='javascript:void(0);'
									onclick="setDropdownMenu('빛', 'property1');">빛</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('어둠', 'property1');">어둠</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('불', 'property1');">불</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('물', 'property1');">물</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('바람', 'property1');">바람</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('땅', 'property1');">땅</a>
							</div>
						</div>
					</td>
				</tr>
				<%
						}
					} catch (Exception e) {
				%>
						<script type="text/javascript">
							alert("비정상적인 접근입니다. 로그인 화면으로 되돌아갑니다.");
							window.location.href = 'http://localhost:8080/DBproject/main.jsp';
						</script>
				<%
						return;
					}
				%>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<input type="button" value="취소" onClick="javascript:location.href='login_main.jsp'" /> 
							<input type="button" value="정보 수정" onClick="CheckUpdateInfo()" />
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>