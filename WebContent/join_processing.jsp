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
<title>회원가입이 완료되었습니다</title>
</head>
<body>
	<%
		DatabaseConnection mDBConn = null;
		try {
			String sId = request.getParameter("id");
			String sPassword = request.getParameter("pw");
			String sUserType = request.getParameter("userType");
			String sMagicStoreId = "";
			mDBConn = new DatabaseConnection();
			Statement mStmt = mDBConn.getStmt();
			String sQuery ="";
			
			if(sUserType.equals("마법사")){
				sQuery = "SELECT ID FROM magicstore WHERE storename='" + request.getParameter("magicstroreID") +"';";
				
				ResultSet mRs = mStmt.executeQuery(sQuery);
				
				while(mRs.next()){
					sMagicStoreId = mRs.getString("ID");
				}
				
				sQuery = "INSERT INTO magician VALUES('" + sId + "', "
							+ "HEX(AES_ENCRYPT('" + sPassword + "',SHA2('password', 512))), "
							+ "'" + request.getParameter("name") + "', "
							+ Integer.parseInt(request.getParameter("age")) + ", "
							+ "'" + request.getParameter("species") + "', "
							+ "'" + request.getParameter("birth") + "', "
							+ "'" + request.getParameter("job") + "', "
							+ Integer.parseInt(request.getParameter("userClass")) + ", "
							+ "'" + request.getParameter("property") +"', "
							+ Integer.parseInt(request.getParameter("mana")) + ", "
							+ "10000, "+
							"'"+ sMagicStoreId + "');";
			}
			else if(sUserType.equals("마법상회")){
				sQuery = "INSERT INTO magicstore VALUES('" + sId + "', "
						+ "HEX(AES_ENCRYPT('" + sPassword + "',SHA2('password', 512))), "
						+ "'" + request.getParameter("storename") + "', "
						+ "'" + request.getParameter("address") + "', "
						+ "'" + request.getParameter("representative") + "', "
						+ Integer.parseInt(request.getParameter("maxClass")) + ", "
						+ "20000);";
			}
			else if(sUserType.equals("소비자")){				
				sQuery = "INSERT INTO customer VALUES('" + sId + "', "
							+ "HEX(AES_ENCRYPT('" + sPassword + "',SHA2('password', 512))), "
							+ "'" + request.getParameter("name1") + "', "
							+ Integer.parseInt(request.getParameter("age1")) + ", "
							+ "'" + request.getParameter("address1") + "', "
							+ "'" + request.getParameter("property1") +"', "
							+ "10000);";
			}
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
		<p>회원가입이 성공적으로 완료되었습니다.</p>
		<input type="button" value="메인화면으로 되돌아가기"
			onClick="javascript:location.href='main.jsp'" />
	</div>
</body>
</html>