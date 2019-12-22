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
<title>정보 수정을 성공하였습니다.</title>
</head>
<body>
	<%
		DatabaseConnection mDBConn = null;
		try {
			String sId = session.getAttribute("id").toString();
			String sUserType = session.getAttribute("userType").toString();
			String sPassword = request.getParameter("pw");
			System.out.println(sId + "," + sUserType);

			mDBConn = new DatabaseConnection();
			Statement mStmt = mDBConn.getStmt();
			String sQuery ="";
			
			if(sUserType.equals("마법사")){
								
				sQuery = "UPDATE magician "
							+ "SET password=HEX(AES_ENCRYPT('" + sPassword + "',SHA2('password', 512))),"
							+ 	  "name='" + request.getParameter("name") + "', "
							+     "age=" + Integer.parseInt(request.getParameter("age")) + ", "
							+     "species='" + request.getParameter("species") + "', "
							+     "birth='" + request.getParameter("birth") + "', "
							+     "job='" + request.getParameter("job") + "', "
							+     "class=" + Integer.parseInt(request.getParameter("userClass")) + ", "
							+     "property='" + request.getParameter("property") +"', "
							+     "mana=" + Integer.parseInt(request.getParameter("mana")) + " "
							+ "WHERE ID='"+ sId +"';";
			}
			else if(sUserType.equals("마법상회")){
				sQuery = "UPDATE magicstore "
							+ "SET password=HEX(AES_ENCRYPT('" + sPassword + "',SHA2('password', 512))), "
							+ 	  "storename='" + request.getParameter("storename") + "', "
							+ 	  "address='" + request.getParameter("address") + "', "
							+ 	  "representative='" + request.getParameter("representative") + "', "
							+ 	  "maxclass=" + Integer.parseInt(request.getParameter("maxClass")) + " "
							+ "WHERE ID='"+ sId +"';";
			}
			else if(sUserType.equals("소비자")){				
				sQuery = "UPDATE customer "
							+ "SET password=HEX(AES_ENCRYPT('" + sPassword + "',SHA2('password', 512))), "
							+ 	  "name='" + request.getParameter("name1") + "', "
							+ 	  "age=" + Integer.parseInt(request.getParameter("age1")) + ", "
							+ 	  "address='" + request.getParameter("address1") + "', "
							+ 	  "property='" + request.getParameter("property1") +"' "
							+ "WHERE ID='" + sId + "';";
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
		<p>정보수정이 성공적으로 완료되었습니다.</p>
		<input type="button" value="메인화면으로 되돌아가기"
			onClick="javascript:location.href='main.jsp'" />
	</div>
</body>
</html>