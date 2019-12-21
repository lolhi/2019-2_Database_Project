<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>login_processing...</title>
</head>
<body>
	<%
		try{
			String name = request.getParameter("id");
			String password = request.getParameter("pw");
	%>
	<div>
		<h1>결과</h1>
		<p> id: <%=name%></p>
		<p> password: <%=password %></p>
	</div>
	<%
		} catch(NumberFormatException e) {
	%>
	<p> 올바른정보를 입력해주세요</p>
	<%
		}
	%>
</body>
</html>