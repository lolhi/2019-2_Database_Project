<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="Database.MagicianInfomation"%>
<%@page import="Database.MagicInfomation"%>
<%@page import="Database.MagicStoreInfomation"%>
<%@page import="Database.CustomerInfomation"%>
<%@page import="Database.MaterialInfomation"%>
<%@page import="Database.SalesInfomation"%>
<%@page import="Database.ExecuteInfomation"%>


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
<title>상세페이지</title>
</head>
<body>
	<%
		
		DatabaseConnection mDBConn = null;
		Statement mStmt = null;
		ResultSet mRs = null;
		String sQuery = "";
		MagicStoreInfomation mMagicStoreInfo = null;
		try {
			String sId = request.getParameter("sId");
			mDBConn = new DatabaseConnection();
			mStmt = mDBConn.getStmt();
			sQuery = "SELECT * FROM Magicstore WHERE ID='" + sId + "';";
			
			mRs = mStmt.executeQuery(sQuery);
			
			while(mRs.next()){
				System.out.println("test");
				mMagicStoreInfo = new MagicStoreInfomation(
						mRs.getString("storename"),
						mRs.getString("address"), 
						mRs.getString("representative"),
						mRs.getInt("maxclass"),
						mRs.getDouble("money"));
			}
			
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
	<table>
		<tr>
			<td>상호명</td>
			<td><input type="text" name="storename"
				value=<%=mMagicStoreInfo.getsStoreName()%> /></td>
		</tr>
		<script>
			document.update_info.storename.value = document.update_info.storename.value
					.replace('/', '');
		</script>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address"
				value=<%=mMagicStoreInfo.getsAddress()%> /></td>
		</tr>
		<script>
			document.update_info.address.value = document.update_info.address.value
					.replace('/', '');
		</script>
		<tr>
			<td>대표자 이름</td>
			<td><input type="text" name="representative"
				value=<%=mMagicStoreInfo.getsRepresentative()%> /></td>
		</tr>
		<script>
			document.update_info.representative.value = document.update_info.representative.value
					.replace('/', '');
		</script>
		<tr>
			<td>거래 허가 클래스</td>
			<td><input type="text" name="maxClass"
				value=<%=mMagicStoreInfo.getiMaxClass()%>
				onkeydown="onlyNumber(event)" onkeyup='removeChar3(event)' /></td>
		</tr>
	</table>
</body>
</html>