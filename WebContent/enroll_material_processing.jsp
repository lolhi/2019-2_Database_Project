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
<title>재료등록에 성공하였습니다.</title>
</head>
<body>
	<%
		DatabaseConnection mDBConn = null;
		try {
			mDBConn = new DatabaseConnection();
			Statement mStmt = mDBConn.getStmt();

			
				
			String sQuery = "INSERT INTO Meterial(name, origin, type, price) VALUES("
						+ "'" + request.getParameter("name") + "', "
						+ "'" + request.getParameter("origin") + "', "
						+ "'" + request.getParameter("type") + "', "
						+ Integer.parseInt(request.getParameter("price")) + ");";

			System.out.println("squery: " + sQuery);
			mStmt.executeUpdate(sQuery);

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
	<div align="center">
		<p>재료등록이 성공적으로 완료되었습니다.</p>
		<input type="button" value="메인화면으로 되돌아가기"
			onClick="javascript:location.href='login_main.jsp'" />
	</div>
</body>
</html>