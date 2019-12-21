<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
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
	function setDropdownMenu(str) {
		document.join.userType.value = str;
	}

	function CheckIdDuplicate() {
		if (document.join.userType.value == "사용자 타입") {
			alert("사용자 타입을 먼저 선택해주세요.");
			return;
		} else if (document.join.id.value == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		var url = "check_id.jsp?id=" + document.join.id.value + "&userType="
				+ encodeURIComponent(document.join.userType.value);
		window.open(url, "Check ID", "width=500, height=300");
	}

	function CheckJoinBasic() {
		if (document.join.id.value == "") {
			alert("아이디를 입력해주세요.");
			document.join.id.focus();
			return;
		}
		if (document.join.pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			document.join.pw.focus();
			return;
		}
		if (document.join.pw2.value == "") {
			alert("비밀번호확인을 입력해주세요.");
			document.join.pw2.focus();
			return;
		}
		if (document.join.pw2.value != document.join.pw.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			document.join.pw.focus();
			return;
		}
		if (document.join.userType.value == "사용자 타입") {
			alert("사용자 타입을 선택해주세오.");
			return;
		}
		document.join.submit();
	}
</script>
<body>
	<div align="center">
		<form name=join action="join_detail.jsp" method="post">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>마법관리 체계 회원가입</h4></td>
				</tr>
				<tr>
					<td>사용자 타입</td>
					<td>
						<div class="dropdown">
							<input class="dropbtn" name=userType type=text value="사용자 타입"
								readonly="readonly" />
							<div class="dropdown-content">
								<a href='javascript:void(0);' onclick="setDropdownMenu('마법사');">마법사</a>
								<a href='javascript:void(0);' onclick="setDropdownMenu('마법상회');">마법상회</a>
								<a href='javascript:void(0);' onclick="setDropdownMenu('소비자');">소비자</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" /></td>
					<td><input type="button" value="아이디 중복확인"
						onClick="CheckIdDuplicate()" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pw2" /></td>
				</tr>
				<tr>
					<td><p></p></td>
					<td><p></p></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<input type="button" value="취소"
								onClick="javascript:location.href='main.jsp'" /> <input
								type="button" value="다음" onClick="CheckJoinBasic()" />
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>