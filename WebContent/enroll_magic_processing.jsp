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
<title>Insert title here</title>
</head>
<body>
	<%
		DatabaseConnection mDBConn = null;
		ResultSet mRs = null;
		String sId = session.getAttribute("id").toString();
		String[] sMagicMaterial = request.getParameterValues("magic_material");
		String[] sMagicMaterialVal = request.getParameterValues("magic_material_value");
	
		
		try {
			String sMagicStoreID = "";
			mDBConn = new DatabaseConnection();
			Statement mStmt = mDBConn.getStmt();

			String sQuery = "SELECT magicstroreID FROM Magician WHERE ID='" + sId + "'";
			System.out.println("squery: " + sQuery);
			mRs = mStmt.executeQuery(sQuery);	
			
			while(mRs.next()){
				sMagicStoreID = mRs.getString("magicstroreID");
			}
			
			sQuery = "INSERT INTO Magic(name, descrb, class, property, type, effective, consumption, price, magicianID, magicstroreID) VALUES("
						+ "'" + request.getParameter("magic_name") + "', "
						+ "'" + request.getParameter("magic_descrb") + "', "
						+ Integer.parseInt(request.getParameter("magic_class")) +", "
						+ "'" + request.getParameter("magic_property") + "', "
						+ "'" + request.getParameter("magic_type") + "', "
						+ Integer.parseInt(request.getParameter("magic_effective")) +", "
						+ Integer.parseInt(request.getParameter("magic_consumption")) +", "
						+ Integer.parseInt(request.getParameter("magic_price")) + ", "
						+ "'" + sId + "', "
						+"'" + sMagicStoreID +"');";

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
		<p>재료등록이 성공적으로 완료되었습니다.</p>
		<input type="button" value="메인화면으로 되돌아가기"
			onClick="javascript:location.href='login_main.jsp'" />
	</div>
</body>
</html>