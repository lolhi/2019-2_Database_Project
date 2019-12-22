<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>login_processing...</title>
</head>
<body>
	<%
			String sId = "";
			String sPassword = "";
			String sUserType = "";
			DatabaseConnection mDBConn = null;
			ResultSet mRs = null;
			
			try {
				sId = request.getParameter("id");
				sPassword = request.getParameter("pw");
				sUserType = request.getParameter("userType");
				mDBConn = new DatabaseConnection();
				Statement mStmt = mDBConn.getStmt();
				String sQuery = "";
				
				if(sUserType.equals("마법사")){
					sQuery = "SELECT ID, password FROM magician WHERE ID='" + sId + "' AND password=HEX(AES_ENCRYPT('" + sPassword + "',SHA2('password', 512)));";
				}
				else if(sUserType.equals("마법상회")){
					sQuery = "SELECT ID, password FROM magicstore WHERE ID='" + sId + "' AND password=HEX(AES_ENCRYPT('" + sPassword + "',SHA2('password', 512)));";
				}
				else if(sUserType.equals("소비자")){
					sQuery = "SELECT ID, password FROM customer WHERE ID='" + sId + "' AND password=HEX(AES_ENCRYPT('" + sPassword + "',SHA2('password', 512)));";
				}
				 
				mRs = mStmt.executeQuery(sQuery);
				
				if(mRs.next()){
					session.setAttribute("id", sId);
					session.setAttribute("userType", sUserType);
					response.sendRedirect("login_main.jsp");
				}
				else {
	%>
					<script>
						alert("아이디나 비밀번호가 틀렸습니다.");
						window.location.href = 'http://localhost:8080/DBproject/main.jsp';
					</script>
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
</body>
</html>