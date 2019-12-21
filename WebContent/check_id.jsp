<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>
	<div align="center">
		<%
			String sId = "";
			String sUserType = "";
			System.out.println(sId + sUserType);
			DatabaseConnection mDBConn = null;
			ResultSet mRs = null;
			try {
				sId = request.getParameter("id");
				sUserType = request.getParameter("userType");
				mDBConn = new DatabaseConnection();
				Statement mStmt = mDBConn.getStmt();
				String sQuery = "";
				
				if(sUserType.equals("마법사")){
					sQuery = "SELECT ID FROM magician WHERE ID='" + sId + "';";
				}
				else if(sUserType.equals("마법상회")){
					sQuery = "SELECT ID FROM magicstore WHERE ID='" + sId + "';";
				}
				else if(sUserType.equals("소비자")){
					sQuery = "SELECT ID FROM customer WHERE ID='" + sId + "';";
				}
				 
				mRs = mStmt.executeQuery(sQuery);
		%>
		<b><%=sId %></b>
		<%
				if (!mRs.next()) {
					out.println("는 사용가능한 아이디 입니다.");
				}
				else {
					out.println("는 이미 존재하는 아이디 입니다.");
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
		<br>
		<br>
		<br>
		<a href="#" onclick="self.close()">닫기</a>
	</div>
</body>
</html>