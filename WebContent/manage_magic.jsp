<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="Database.MagicianInfomation"%>
<%@page import="Database.MagicInfomation"%>
<%@page import="Database.MagicStoreInfomation"%>
<%@page import="Database.CustomerInfomation"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>마법 관리</title>
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
	function check(obj) {
		document.manage_magic.magic_idx.value = obj;
		document.manage_magic.submit();
	}
	
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9)
			return;
		else
			return false;
	}

	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9 || keyID == 229) {
			if (Number(document.enroll_material.price.value) > 0 || keyID == 8
					|| keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9
					|| keyID == 229)
				return;
			else {
				document.enroll_material.price.value = "";
				alert("1 이상의 숫자만 가능합니다.");
			}
		}

		else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}

	function removeChar1(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9 || keyID == 229) {
			if ((Number(document.enroll_magic.magic_class.value) > 0 && Number(document.enroll_magic.magic_class.value) < 11)
					|| keyID == 8
					|| keyID == 46
					|| keyID == 37
					|| keyID == 39
					|| keyID == 9 || keyID == 229)
				return;
			else {
				document.enroll_magic.magic_class.value = "";
				alert("1 이상 10 이하의 숫자만 가능합니다.");
			}
		}

		else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}

	function removeChar2(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9 || keyID == 229) {
			if ((Number(document.enroll_magic.magic_effective.value) > 0 && Number(document.enroll_magic.magic_effective.value) < 101)
					|| keyID == 8
					|| keyID == 46
					|| keyID == 37
					|| keyID == 39
					|| keyID == 9 || keyID == 229)
				return;
			else {
				document.enroll_magic.magic_effective.value = "";
				alert("1 이상 100 이하의 숫자만 가능합니다.");
			}
		}

		else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}

	function removeChar3(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9 || keyID == 229) {
			if (Number(document.enroll_magic.magic_consumption.value) > 0
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
					|| keyID == 9 || keyID == 229)
				return;
			else {
				document.enroll_magic.magic_consumption.value = "";
				alert("1 이상의 숫자만 가능합니다.");
			}
		}

		else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}

	function removeChar4(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9 || keyID == 229) {
			if (Number(document.enroll_magic.magic_price.value) > 0
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
					|| keyID == 9 || keyID == 229)
				return;
			else {
				document.enroll_magic.magic_price.value = "";
				alert("1 이상의 숫자만 가능합니다.");
			}
		}

		else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function removeChar5(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9 || keyID == 229) {
			if ((Number(document.update_magic.magic_class.value) > 0 && Number(document.update_magic.magic_class.value) < 11)
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
					|| keyID == 9 || keyID == 229)
				return;
			else {
				document.update_magic.magic_class.value = "";
				alert("1 이상 10 이하의 숫자만 가능합니다.");
			}
		}

		else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function removeChar6(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9 || keyID == 229) {
			if ((Number(document.update_magic.magic_effective.value) > 0 && Number(document.update_magic.magic_effective.value) < 101)
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
					|| keyID == 9 || keyID == 229)
				return;
			else {
				document.update_magic.magic_effective.value = "";
				alert("1 이상 100이하의 숫자만 가능합니다.");
			}
		}

		else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function removeChar7(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9 || keyID == 229) {
			if (Number(document.update_magic.magic_consumption.value) > 0
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
					|| keyID == 9 || keyID == 229)
				return;
			else {
				document.update_magic.magic_consumption.value = "";
				alert("1 이상의 숫자만 가능합니다.");
			}
		}

		else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function removeChar8(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
				|| keyID == 9 || keyID == 229) {
			if (Number(document.update_magic.magic_price.value) > 0
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
					|| keyID == 9 || keyID == 229)
				return;
			else {
				document.update_magic.magic_price.value = "";
				alert("1 이상의 숫자만 가능합니다.");
			}
		}

		else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
			alert("숫자만 입력가능합니다.");
		}
	}
	
	function CheckUpdateMagic() {
		if (document.update_magic.magic_name.value == "") {
			alert("이름을 입력해주세요.");
			document.update_magic.magic_name.focus();
			return;
		}
		if (document.update_magic.magic_descrb.value == "") {
			alert("마법설명을 입력해주세요.");
			document.update_magic.magic_descrb.focus();
			return;
		}
		if (document.update_magic.magic_class.value == "") {
			alert("클래스를 입력해주세요.");
			document.update_magic.magic_class.focus();
			return;
		}
		if (document.update_magic.magic_property.value == "속성") {
			alert("속성을 선택해주세오.");
			document.update_magic.magic_property.focus();
			return;
		}
		if (document.update_magic.magic_type.value == "종류") {
			alert("종류를 선택해주세오.");
			document.update_magic.magic_type.focus();
			return;
		}
		if (document.update_magic.magic_effective.value == "") {
			alert("효과량을 입력해주세오.");
			document.update_magic.magic_effective.focus();
			return;
		}
		if (document.update_magic.magic_consumption.value == "") {
			alert("마나소비량을 입력해주세오.");
			document.update_magic.magic_consumption.focus();
			return;
		}
		if (document.update_magic.magic_price.value == "") {
			alert("가격을 입력해주세오.");
			document.update_magic.magic_price.focus();
			return;
		}
		var isMaterialCheck = false;
		var arr_magic_material_val = document
				.getElementsByName("magic_material_value");
		var arr_magic_material = document.getElementsByName("magic_material");
		for (var i = 0; i < arr_magic_material.length; i++) {
			if (arr_magic_material[i].checked == true) {
				isMaterialCheck = true;
				break;
			}
		}

		for (var i = 0; i < arr_magic_material.length; i++) {
			if (arr_magic_material[i].checked == true
					&& arr_magic_material_val[i].value == "") {
				alert(arr_magic_material[i].value + " 의 필요량이 입력되지 않았습니다.");
				document.update_magic.arr_magic_material_val[i].focus();
				break;
			}
		}

		if (!isMaterialCheck) {
			alert("한 개 이상의 필요 재료를 선택해주세요");
			document.update_magic.magic_material.focus();
			return;
		}

		if (document.update_magic.magic_property.value != document.update_magic.pp.value) {
			alert("등록하려는 마법의 속성과 마법사의 속성이 일치하지 않습니다.");
			document.update_magic.magic_property.focus();
			return;
		}
		if (Number(document.update_magic.magic_class.value) > Number(document.update_magic.cc.value)) {
			alert("등록하려는 마법의 클래스가 마법사의 클래스 보다 높습니다.");
			document.update_magic.magic_class.focus();
			return;
		}

		for (var i = 0; i < arr_magic_material_val.length; i++) {
			if (arr_magic_material_val[i].value == "")
				arr_magic_material_val[i].disabled = true;
		}
		document.update_magic.submit();
	}

	function CheckEnrollMagic() {
		if (document.enroll_magic.magic_name.value == "") {
			alert("이름을 입력해주세요.");
			document.enroll_magic.magic_name.focus();
			return;
		}
		if (document.enroll_magic.magic_descrb.value == "") {
			alert("마법설명을 입력해주세요.");
			document.enroll_magic.magic_descrb.focus();
			return;
		}
		if (document.enroll_magic.magic_class.value == "") {
			alert("클래스를 입력해주세요.");
			document.enroll_magic.magic_class.focus();
			return;
		}
		if (document.enroll_magic.magic_property.value == "속성") {
			alert("속성을 선택해주세오.");
			document.enroll_magic.magic_property.focus();
			return;
		}
		if (document.enroll_magic.magic_type.value == "종류") {
			alert("종류를 선택해주세오.");
			document.enroll_magic.magic_type.focus();
			return;
		}
		if (document.enroll_magic.magic_effective.value == "") {
			alert("효과량을 입력해주세오.");
			document.enroll_magic.magic_effective.focus();
			return;
		}
		if (document.enroll_magic.magic_consumption.value == "") {
			alert("마나소비량을 입력해주세오.");
			document.enroll_magic.magic_consumption.focus();
			return;
		}
		if (document.enroll_magic.magic_price.value == "") {
			alert("가격을 입력해주세오.");
			document.enroll_magic.magic_price.focus();
			return;
		}
		var isMaterialCheck = false;
		var arr_magic_material_val = document
				.getElementsByName("magic_material_value");
		var arr_magic_material = document.getElementsByName("magic_material");
		for (var i = 0; i < arr_magic_material.length; i++) {
			if (arr_magic_material[i].checked == true) {
				isMaterialCheck = true;
				break;
			}
		}

		for (var i = 0; i < arr_magic_material.length; i++) {
			if (arr_magic_material[i].checked == true
					&& arr_magic_material_val[i].value == "") {
				alert(arr_magic_material[i].value + " 의 필요량이 입력되지 않았습니다.");
				document.enroll_magic.arr_magic_material_val[i].focus();
				break;
			}
		}

		if (!isMaterialCheck) {
			alert("한 개 이상의 필요 재료를 선택해주세요");
			document.enroll_magic.magic_material.focus();
			return;
		}

		if (document.enroll_magic.magic_property.value != document.enroll_magic.pp.value) {
			alert("등록하려는 마법의 속성과 마법사의 속성이 일치하지 않습니다.");
			document.enroll_magic.magic_property.focus();
			return;
		}
		if (Number(document.enroll_magic.magic_class.value) > Number(document.enroll_magic.cc.value)) {
			alert("등록하려는 마법의 클래스가 마법사의 클래스 보다 높습니다.");
			document.enroll_magic.magic_class.focus();
			return;
		}

		for (var i = 0; i < arr_magic_material_val.length; i++) {
			if (arr_magic_material_val[i].value == "")
				arr_magic_material_val[i].disabled = true;
		}
		document.enroll_magic.submit();
	}

	function CheckEnrollMaterial() {
		if (document.enroll_material.name.value == "") {
			alert("이름을 입력해주세요.");
			document.enroll_material.name.focus();
			return;
		}
		if (document.enroll_material.origin.value == "") {
			alert("원산지를 입력해주세요.");
			document.enroll_material.origin.focus();
			return;
		}
		if (document.enroll_material.type.value == "") {
			alert("종류를 입력해주세요.");
			document.enroll_material.type.focus();
			return;
		}
		if (document.enroll_material.price.value == "") {
			alert("도매 가격을 선택해주세오.");
			document.enroll_material.price.focus();
			return;
		}
		document.enroll_material.submit();
	}

	function setDropdownMenu(str, obj) {
		document.getElementsByName(obj)[0].value = str;
	}
</script>
<body>
	<div align="center">
		<%
			String sBtn = request.getParameter("btn");
			if(sBtn == null)
				sBtn = "수정";
			String sId = session.getAttribute("id").toString();
			if (sBtn.equals("새로운 재료 등록")) {
		%>
		<form name=enroll_material action="enroll_material_processing.jsp"
			method="post">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>재료 등록</h4></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>원산지</td>
					<td><input type="text" name="origin" /></td>
				</tr>
				<tr>
					<td>종류</td>
					<td><input type="text" name="type" /></td>
				</tr>
				<tr>
					<td>도매가격</td>
					<td><input type="text" name="price"
						onkeydown="onlyNumber(event)" onkeyup='removeChar(event)' /></td>
				</tr>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<input type="button" value="취소"
								onClick="javascript:location.href='login_main.jsp'" /> <input
								type="button" value="등록" onClick="CheckEnrollMaterial()" />
						</div>
					</td>
				</tr>
			</table>
		</form>
		<%
			} else if (sBtn.equals("새로운 마법 등록")) {
		%>
		<form name=enroll_magic action="enroll_magic_processing.jsp"
			method="post">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>마법 등록</h4></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="magic_name" /></td>
				</tr>
				<tr>
					<td>설명</td>
					<td><input type="text" name="magic_descrb" /></td>
				</tr>
				<tr>
					<td>클래스</td>
					<td><input type="text" name="magic_class"
						onkeydown="onlyNumber(event)" onkeyup='removeChar1(event)' /></td>
				</tr>
				<tr>
					<td>속성</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name="magic_property" type="text"
								value="속성" readonly="readonly" />
							<div class="dropdown-content">
								<a href='javascript:void(0);'
									onclick="setDropdownMenu('빛', 'magic_property');">빛</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('어둠', 'magic_property');">어둠</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('불', 'magic_property');">불</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('물', 'magic_property');">물</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('바람', 'magic_property');">바람</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('땅', 'magic_property');">땅</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>종류</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name="magic_type" type="text" value="종류"
								readonly="readonly" />
							<div class="dropdown-content">
								<a href='javascript:void(0);'
									onclick="setDropdownMenu('공격', 'magic_type');">공격</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('방어', 'magic_type');">방어</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('치유', 'magic_type');">치유</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('도움', 'magic_type');">도움</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>효과량</td>
					<td><input type="text" name="magic_effective"
						onkeydown="onlyNumber(event)" onkeyup='removeChar5(event)' /></td>
				</tr>
				<tr>
					<td>마나소비량</td>
					<td><input type="text" name="magic_consumption"
						onkeydown="onlyNumber(event)" onkeyup='removeChar3(event)' /></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="magic_price"
						onkeydown="onlyNumber(event)" onkeyup='removeChar4(event)' /></td>
				</tr>
				<tr>
					<%
						DatabaseConnection mDBConn = null;
							ResultSet mRs = null;
							ArrayList<String> mMaterialNameList = new ArrayList<String>();

							try {
								mDBConn = new DatabaseConnection();
								Statement mStmt = mDBConn.getStmt();

								String sQuery = "SELECT name FROM meterial;";

								System.out.println("squery: " + sQuery);
								mRs = mStmt.executeQuery(sQuery);

								while (mRs.next()) {
									mMaterialNameList.add(mRs.getString("name"));
								}
					%>
					<td rowspan=<%=(mMaterialNameList.size() + 1) * 2%>>필요 재료</td>
				</tr>
				<%
					for (int i = 0; i < mMaterialNameList.size(); i++) {
				%>
				<tr>
					<td><label><input type="checkbox"
							name="magic_material" value="<%=mMaterialNameList.get(i)%>" /><%=mMaterialNameList.get(i)%></label></td>
				</tr>
				<tr>
					<td><input type="text" name="magic_material_value" /></td>
				</tr>
				<%
					}

							mRs.close();
							sQuery = "SELECT class, property FROM Magician WHERE ID='" + sId + "';";
							System.out.println("squery: " + sQuery);
							mRs = mStmt.executeQuery(sQuery);

							while (mRs.next()) {
								System.out.println(mRs.getString("property"));
				%>
				<tr>
					<td><input type="text" name="pp" style="display: none"
						value=<%=mRs.getString("property")%> /></td>
					<script>
						document.enroll_magic.pp.value = document.enroll_magic.pp.value
								.replace('/', '');
					</script>
					<td><input type="text" name="cc" style="display: none"
						value=<%=mRs.getString("class")%> /></td>
					<script>
						document.enroll_magic.cc.value = document.enroll_magic.cc.value
								.replace('/', '');
					</script>
				</tr>
				<%
					}
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							try {
								mDBConn.CloseConnection();
							} catch (Exception e) {
								e.printStackTrace();
							}
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
								onClick="javascript:location.href='login_main.jsp'" /> <input
								type="button" value="등록" onClick="CheckEnrollMagic()" />
						</div>
					</td>
				</tr>
			</table>
		</form>
		<%
			} else if (sBtn.equals("수정")) {
				String[] sMagicName = request.getParameterValues("magic_name");
				String[] sMagicDescribe = request.getParameterValues("magic_descrb");
				String[] sMagicClass = request.getParameterValues("magic_class");
				String[] sMagicProperty = request.getParameterValues("magic_property");
				String[] sMagicType = request.getParameterValues("magic_type");
				String[] sMagicEffective = request.getParameterValues("magic_effective");
				String[] sMagicConsumption = request.getParameterValues("magic_consumption");
				String[] sMagicPrice = request.getParameterValues("magic_price");
				String sIdx = request.getParameter("magic_idx");
				
				for(int i = 0; i < sMagicName.length; i++){
					System.out.println(sMagicName[i]);
					System.out.println(sMagicDescribe[i]);
					System.out.println(sMagicClass[i]);
					System.out.println(sMagicProperty[i]);
					System.out.println(sMagicType[i]);
					System.out.println(sMagicEffective[i]);
					System.out.println(sMagicConsumption[i]);
					System.out.println(sMagicPrice[i]);
					System.out.println(sIdx);
				}
		%>
		<form name=update_magic action="update_magic_processing.jsp">
		<table>
				<tr>
					<td align="center" colspan="2"><h4>마법 수정</h4></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="magic_name" value="<%=sMagicName[Integer.parseInt(sIdx)] %>"/></td>
					<td><input type="text" name="magic_name_pre" value="<%=sMagicName[Integer.parseInt(sIdx)] %>" style="display:none"/></td>
				</tr>
				<tr>
					<td>설명</td>
					<td><input type="text" name="magic_descrb" value="<%=sMagicDescribe[Integer.parseInt(sIdx)] %>"/></td>
				</tr>
				<tr>
					<td>클래스</td>
					<td><input type="text" name="magic_class" value="<%=Integer.parseInt(sMagicClass[Integer.parseInt(sIdx)]) %>"
						onkeydown="onlyNumber(event)" onkeyup='removeChar5(event)' /></td>
				</tr>
				<tr>
					<td>속성</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name="magic_property" type="text"
								value="<%=sMagicProperty[Integer.parseInt(sIdx)] %>" readonly="readonly" />
							<div class="dropdown-content">
								<a href='javascript:void(0);'
									onclick="setDropdownMenu('빛', 'magic_property');">빛</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('어둠', 'magic_property');">어둠</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('불', 'magic_property');">불</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('물', 'magic_property');">물</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('바람', 'magic_property');">바람</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('땅', 'magic_property');">땅</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>종류</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name="magic_type" type="text" value="<%=sMagicType[Integer.parseInt(sIdx)] %>"
								readonly="readonly" />
							<div class="dropdown-content">
								<a href='javascript:void(0);'
									onclick="setDropdownMenu('공격', 'magic_type');">공격</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('방어', 'magic_type');">방어</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('치유', 'magic_type');">치유</a> <a
									href='javascript:void(0);'
									onclick="setDropdownMenu('도움', 'magic_type');">도움</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>효과량</td>
					<td><input type="text" name="magic_effective" value="<%=Integer.parseInt(sMagicEffective[Integer.parseInt(sIdx)]) %>"
						onkeydown="onlyNumber(event)" onkeyup='removeChar6(event)' /></td>
				</tr>
				<tr>
					<td>마나소비량</td>
					<td><input type="text" name="magic_consumption" value="<%=Integer.parseInt(sMagicConsumption[Integer.parseInt(sIdx)]) %>"
						onkeydown="onlyNumber(event)" onkeyup='removeChar7(event)' /></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="magic_price" value="<%=Integer.parseInt(sMagicPrice[Integer.parseInt(sIdx)]) %>"
						onkeydown="onlyNumber(event)" onkeyup='removeChar8(event)' /></td>
				</tr>
				<tr>
					<%
						DatabaseConnection mDBConn = null;
							ResultSet mRs = null;
							ArrayList<String> mMaterialNameList = new ArrayList<String>();

							try {
								ArrayList<String> mMaterialName = new ArrayList<>();
								ArrayList<Integer> mStockValue = new ArrayList<>();
								mDBConn = new DatabaseConnection();
								Statement mStmt = mDBConn.getStmt();

								String sQuery = "SELECT * FROM execute WHERE magicName='" + sMagicName[Integer.parseInt(sIdx)] + "';";
								
								System.out.println("squery: " + sQuery);
								mRs = mStmt.executeQuery(sQuery);
								
								while (mRs.next()) {
									mMaterialName.add(mRs.getString("meterialName"));
									mStockValue.add(mRs.getInt("requirevalue"));
								}
								mRs.close();
								
								sQuery = "SELECT name FROM meterial;";
								mRs = mStmt.executeQuery(sQuery);

								while (mRs.next()) {
									mMaterialNameList.add(mRs.getString("name"));
								}
					%>
					<td rowspan=<%=(mMaterialNameList.size() + 1) * 2%>>필요 재료</td>
				</tr>
				<%
					boolean flag = false;
					int idx = -1;
					for (int i = 0; i < mMaterialNameList.size(); i++) {
						for(int j = 0; j < mMaterialName.size(); j++){
							if(mMaterialName.get(j).equals(mMaterialNameList.get(i))){
								flag = true;
								idx = j;
							}
						}
						if(flag) {
				%>
				<tr>
					<td><label><input type="checkbox"
						name="magic_material" value="<%=mMaterialNameList.get(i)%>" checked/><%=mMaterialNameList.get(i)%></label></td>
				</tr>
				<tr>
					<td><input type="text" name="magic_material_value" value="<%=mStockValue.get(idx)%>"/></td>
				</tr>
				<%
						}
						else {
				%>
				<tr>
					<td><label><input type="checkbox"
						name="magic_material" value="<%=mMaterialNameList.get(i)%>"/><%=mMaterialNameList.get(i)%></label></td>
				</tr>
				<tr>
					<td><input type="text" name="magic_material_value"/></td>
				</tr>
				<%
						}
						flag = false;
						idx = -1;
					}

							mRs.close();
							sQuery = "SELECT class, property FROM Magician WHERE ID='" + sId + "';";
							System.out.println("squery: " + sQuery);
							mRs = mStmt.executeQuery(sQuery);

							while (mRs.next()) {
								System.out.println(mRs.getString("property"));
				%>
				<tr>
					<td><input type="text" name="pp" style="display: none"
						value=<%=mRs.getString("property")%> /></td>
					<script>
						document.enroll_magic.pp.value = document.enroll_magic.pp.value
								.replace('/', '');
					</script>
					<td><input type="text" name="cc" style="display: none"
						value=<%=mRs.getString("class")%> /></td>
					<script>
						document.enroll_magic.cc.value = document.enroll_magic.cc.value
								.replace('/', '');
					</script>
				</tr>
				<%
					}
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							try {
								mDBConn.CloseConnection();
							} catch (Exception e) {
								e.printStackTrace();
							}
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
								onClick="javascript:location.href='login_main.jsp'" /> <input
								type="button" value="등록" onClick="CheckUpdateMagic()" />
						</div>
					</td>
				</tr>
			</table>
		</form>
		<%
			} else if (sBtn.equals("검색")) {
				DatabaseConnection mDBConn = null;
				Statement mStmt = null;
				ResultSet mRs = null;
				String sQuery = "";
				try{
				ArrayList<MagicInfomation> mMagicInfoList = new ArrayList<MagicInfomation>();
				mDBConn = new DatabaseConnection();
				mStmt = mDBConn.getStmt();
				sQuery = "SELECT name, descrb, class, property, type, effective, consumption, price "
						+ "FROM magic "
						+ "WHERE magicianID='"+ sId +"' AND name LIKE'%" + request.getParameter("search") + "%'"
						+ " OR descrb LIKE'%" + request.getParameter("search") + "%' OR property LIKE'%" + request.getParameter("search") + "%'"
						+ " OR type LIKE'%" + request.getParameter("search") + "%' OR class='"+ request.getParameter("search") +"';";
				
				mRs = mStmt.executeQuery(sQuery);
				
				while(mRs.next()){
					mMagicInfoList.add(new MagicInfomation(
							mRs.getString("name"),
							mRs.getString("descrb"),
							mRs.getInt("class"),
							mRs.getString("property"),
							mRs.getString("type"),
							mRs.getInt("effective"),
							mRs.getInt("consumption"),
							mRs.getInt("price")
							));
				}
		%>
		<form name="manage_magic" action="manage_magic.jsp" method="post">
				<table>
						<tr>
							<td align="left" colspan="4"><h3>검색결과</h3></td>
						</tr>
		<%		
					if(mMagicInfoList.size() == 0){
		%>
						<tr>
							<td align="center" colspan="6"><h4>검색결과가 존재하지 않습니다.</h4></td>
						</tr>
		<%				
					}
					else{
		%>			
						<tr>
							<td>이름</td>
							<td>설명</td>
							<td>클래스</td>
							<td>속성</td>
							<td>종류</td>
							<td>효과량</td>
							<td>마나소비량</td>
							<td>가격</td>
							<td><input type="text" name="magic_idx" style="display:none"></td>
						</tr>	
		<%
						for(int i = 0; i < mMagicInfoList.size(); i++){
		%>
						<tr>
							<td><input type="text" name="magic_name" value="<%=mMagicInfoList.get(i).getsName() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_descrb" value="<%=mMagicInfoList.get(i).getsDescribe() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_class" value="<%=mMagicInfoList.get(i).getiClass() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_property" value="<%=mMagicInfoList.get(i).getsProperty() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_type" value="<%=mMagicInfoList.get(i).getsType() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_effective" value="<%=mMagicInfoList.get(i).getiEffective() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_consumption" value="<%=mMagicInfoList.get(i).getiConsumption() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_price" value="<%=mMagicInfoList.get(i).getiPrice() %>" readonly="readonly"></td>
							<td><input type="button" id="btn" value="수정" onclick="check(this.parentElement.parentElement.cells[9].children[0].value)"/></td>
							<td><input type="text" name="magic_i" style="display:none"value="<%=i %>"></td>
						</tr>
		<%					
						}
					}
		%>			
					</table>
					</form>
		<%
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
			}
		%>
	</div>
</body>
</html>