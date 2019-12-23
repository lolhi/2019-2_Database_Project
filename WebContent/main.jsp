<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0L);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("UTF-8"); 
%>
<html>
<head>
<meta charset="UTF-8">
<title>마법관리 체계 </title>
<style>
.dropbtn {
  background-color: #f1f1f1;
  color: black;
  padding:5px;
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
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 5px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #f1f1f1;}
</style>
</head>
<script type="text/javascript">

	function setDropdownMenu(str){
		document.getElementsByName("userType")[0].value = str;
	}
	
	function loginCheck(){
		if(document.login.userType.value == "사용자 타입"){
			alert("사용자 타입을 선택해주세요.");
			return;
		}
		if(document.login.id.value == ""){
			alert("아이디를 입력해주세요.");
			document.login.id.focus();
			return;
		}
		if(document.login.pw.value == ""){
			alert("비밀번호를 입력해주세요.");
			document.login.pw.focus();
			return;
		}
		document.login.submit();
	}
</script>
<body>
<%
	try{
		if(session.getAttribute("id")!=null){
			response.sendRedirect("login_main.jsp");
		} 
		else{
			System.out.println("id is null");
		}
	}
	catch(NullPointerException e){
		//e.printStackTrace();
		System.out.println("NullPointerException: id is null");
	}
%>
<div align="center">
	<div>
		<h1>플레임 왕국 마법 관리 체계에 오신것을 환영합니다.</h1>
	</div>
	<form name=login action="login_processing.jsp" method="post">
		<table>
			<tr>
				<td align="center" colspan="2"><h4>마법관리 체계 로그인</h4></td>
			</tr>
			<tr>
				<td>사용자타입</td>
				<td>
					<div class="dropdown">
						<input class="dropbtn" name="userType" type="text" value="사용자 타입" readonly="readonly"/>
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
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="right">
						<input type="button" value="로그인" onClick="loginCheck()"/>
						<input type="button" value="회원가입" onClick="javascript:location.href='join.jsp'"/>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>