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
<title>마법 정보 수정을 성공하였습니다</title>
</head>
<body>
	<%
		DatabaseConnection mDBConn = null;
		try {
			String sId = session.getAttribute("id").toString();
			String sUserType = session.getAttribute("userType").toString();
			String sPassword = request.getParameter("pw");
			System.out.println(sId + "," + sUserType);
			String[] sMagicMaterial = request.getParameterValues("magic_material");
			String[] sMagicMaterialVal = request.getParameterValues("magic_material_value");
			System.out.println(request.getParameter("magic_name_pre"));

			mDBConn = new DatabaseConnection();
			Statement mStmt = mDBConn.getStmt();
			String sQuery = "UPDATE Magic "
							+ "SET name='" + request.getParameter("magic_name") + "', "
							+ 	  "descrb='" + request.getParameter("magic_descrb") + "', "
							+     "class=" + Integer.parseInt(request.getParameter("magic_class")) +", "
							+     "property='" + request.getParameter("magic_property") + "', "
							+     "type='" + request.getParameter("magic_type") + "', "
							+     "effective=" + Integer.parseInt(request.getParameter("magic_effective")) +", "
							+     "consumption=" + Integer.parseInt(request.getParameter("magic_consumption")) +", "
							+     "price=" + Integer.parseInt(request.getParameter("magic_price")) + " "
							+ "WHERE name='"+ request.getParameter("magic_name_pre") +"';";


			System.out.println("squery: " + sQuery);
			mStmt.executeUpdate(sQuery);
			
			sQuery = "DELETE FROM Execute "
					+ "WHERE magicName='"+ request.getParameter("magic_name") +"';";
					
			System.out.println("squery: " + sQuery);
			mStmt.executeUpdate(sQuery);
			
			sQuery = "INSERT INTO Execute VALUES";
			
			for(int i = 0; i < sMagicMaterial.length; i++){
				sQuery += "('" + request.getParameter("magic_name") + "', "
						+ "'" + sMagicMaterial[i] + "', "
						+ Integer.parseInt(sMagicMaterialVal[i]) +")";
				if(i != sMagicMaterial.length - 1)
					sQuery += ",";
				else
					sQuery += ";";
			}
			
			System.out.println(sQuery);
			
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
			onClick="javascript:location.href='login_main.jsp'" />
	</div>
</body>
</html>