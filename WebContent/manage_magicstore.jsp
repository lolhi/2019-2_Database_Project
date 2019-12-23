<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="Database.MagicianInfomation"%>
<%@page import="Database.MagicInfomation"%>
<%@page import="Database.MagicStoreInfomation"%>
<%@page import="Database.CustomerInfomation"%>
<%@page import="Database.MaterialInfomation"%>

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
<title>마법상회 관리</title>
</head>
<script>
function check1(obj, obj2) {
	document.manage_magicstore.magic_idx.value = obj;
	document.manage_magicstore.magic_mode.value = obj2;
	document.manage_magicstore.submit();
}
</script>
<body>
	<%
		String sId = "";
		String sUserType = "";

		try {
			sId = session.getAttribute("id").toString();
			sUserType = session.getAttribute("userType").toString();
			System.out.println(sId + "," + sUserType);
		} catch (Exception e) {
	%>
	<script type="text/javascript">
		alert("비정상적인 접근입니다. 로그인 화면으로 되돌아갑니다.");
		window.location.href = 'http://localhost:8080/DBproject/main.jsp';
	</script>
	<%
		return;
		}

		DatabaseConnection mDBConn = null;
		Statement mStmt = null;
		ResultSet mRs = null;
		String sQuery = "";
		try {
			mDBConn = new DatabaseConnection();
			mStmt = mDBConn.getStmt();
			if (request.getParameter("sbtn") == null) {
				String sIdx = request.getParameter("magic_idx");
				String sMode = request.getParameter("magic_mode");
				String[] sMagicianId = request.getParameterValues("magician_id");
				System.out.println("sMOde:"+sMode);
				for (int i = 0; i < sMagicianId.length; i++) {
					System.out.println(sIdx);
				}

				if (sMode.equals("삭제")) {
					sQuery = "UPDATE magician " + "SET magicstroreID='123' " + "WHERE ID='"
							+ sMagicianId[Integer.parseInt(sIdx)] + "';";
				} 
				else if (sMode.equals("등록")) {

					sQuery = "UPDATE magician " + "SET magicstroreID='" + sId + "' " + "WHERE ID='"
							+ sMagicianId[Integer.parseInt(sIdx)] + "';";
				}
				else if (sMode.equals("재고등록")) {
					String[] sMaterialName = request.getParameterValues("material_name");
					String[] sStockValue = request.getParameterValues("magician_stockvalue");
					String[] sBuyValue = request.getParameterValues("magician_buyvalue");
					if(Integer.parseInt(sStockValue[Integer.parseInt(sIdx)]) == 0){
						sQuery = "INSERT INTO Sales VALUES(" 
								+ "'" + sId + "', "
								+ "'" + sMaterialName[Integer.parseInt(sIdx)] + "', "
								+ Integer.parseInt(sBuyValue[Integer.parseInt(sIdx)]) + ");";
					}
					else {
						sQuery = "UPDATE Sales " 
								+ "SET stockvalue='" + Integer.parseInt(sBuyValue[Integer.parseInt(sIdx)]) + "' "
								+ "WHERE magicstroreID='" + sId + "' " 
								+ "AND meterialName='"+ sMaterialName[Integer.parseInt(sIdx)] + "';";
					}
				}

				System.out.println(sQuery);

				mStmt.executeUpdate(sQuery);
	%>
	<script type="text/javascript">
		alert("작업을 성공하였습니다.");
		window.location.href = 'http://localhost:8080/DBproject/login_main.jsp';
	</script>
	
	
	<%
			}	
			else if(request.getParameter("sbtn").equals("삭제검색")){
				ArrayList<MagicianInfomation> mMagicianInfoList = new ArrayList<MagicianInfomation>();
				
				sQuery = "SELECT ID, name, age, species, birth, job, class, property, mana "
						+ "FROM magician "
						+ "WHERE magicstroreID='" + sId +"' AND (name LIKE'%" + request.getParameter("search") + "%'"
						+ " OR species LIKE'%" + request.getParameter("search") + "%' OR birth LIKE'%" + request.getParameter("search") + "%'"
						+ " OR job LIKE'%" + request.getParameter("search") + "%' OR property LIKE'%" + request.getParameter("search") + "%');";

				mRs = mStmt.executeQuery(sQuery);

				while (mRs.next()) {
					mMagicianInfoList.add(new MagicianInfomation(
							mRs.getString("ID"),
							mRs.getString("name"), 
							mRs.getInt("age"),
							mRs.getString("species"), 
							mRs.getString("birth"), 
							mRs.getString("job"),
							mRs.getInt("class"), 
							mRs.getString("property"), 
							mRs.getInt("mana")));
				}
				mRs.close();
				
				String sStoreName = "";
				sQuery = "SELECT storename FROM magicstore WHERE ID='" + sId + "'";
				mRs = mStmt.executeQuery(sQuery);

				while (mRs.next()) {
					sStoreName = mRs.getString("storename");
				}
				mRs.close();
	%>
		<form name="manage_magicstore" action="manage_magicstore.jsp" method="post">
		<table>
				<tr>
					<td align="left" colspan="8"><h3>상회 소속 마법사 검색결과</h3></td>
					<td><input type="text" name="magic_idx" style="display: none"></td>
					<td><input type="text" name="magic_mode" style="display: none"></td>
				</tr>
				<%
					if (mMagicianInfoList.size() == 0) {
				%>
				<tr>
					<td align="center" colspan="6"><h4>소속된 마법사가 존재하지 않습니다.</h4></td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td>이름</td>
					<td>나이</td>
					<td>종족</td>
					<td>출신지</td>
					<td>직업</td>
					<td>클래스</td>
					<td>속성</td>
					<td>마나량</td>
					<td>소속상회</td>
				</tr>
				<%
					for (int i = 0; i < mMagicianInfoList.size(); i++) {
				%>
				<tr>
					<td><input type="text" name="magician_name"
						value="<%=mMagicianInfoList.get(i).getsName()%>" readonly="readonly"></td>
					<td><input type="text" name="magician_age"
						value="<%=mMagicianInfoList.get(i).getsAge()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_species"
						value="<%=mMagicianInfoList.get(i).getsSpecies()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_birth"
						value="<%=mMagicianInfoList.get(i).getsBirth()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_job"
						value="<%=mMagicianInfoList.get(i).getsJob()%>" readonly="readonly"></td>
					<td><input type="text" name="magician_class"
						value="<%=mMagicianInfoList.get(i).getsClass()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_property"
						value="<%=mMagicianInfoList.get(i).getsProperty()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_mana"
						value="<%=mMagicianInfoList.get(i).getsMana()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_storename"
						value="<%=sStoreName%>"
						readonly="readonly"></td>
					<td><input type="button" id="btn" value="삭제"
						onclick="check1(this.parentElement.parentElement.cells[10].children[0].value, this.value)" /></td>
					<td><input type="text" name="magic_i" style="display: none"
						value="<%=i%>"></td>
					<td><input type="text" name="magician_id" style="display: none"
						value="<%=mMagicianInfoList.get(i).getsId()%>" readonly="readonly"></td>
						<%
					}
						%>
				</tr>
				</table>
				</form>
			
	<%
					
				}
			} 
			else if(request.getParameter("sbtn").equals("등록검색")){
				ArrayList<MagicianInfomation> mMagicianInfoList = new ArrayList<MagicianInfomation>();
				sQuery = "SELECT ID, name, age, species, birth, job, class, property, mana, magicstroreID "
						+ "FROM magician "
						+ "WHERE magicstroreID<>'" + sId +"' AND (name LIKE'%" + request.getParameter("search1") + "%'"
						+ " OR species LIKE'%" + request.getParameter("search1") + "%' OR birth LIKE'%" + request.getParameter("search1") + "%'"
						+ " OR job LIKE'%" + request.getParameter("search1") + "%' OR property LIKE'%" + request.getParameter("search1") + "%');";
				System.out.println(sQuery);
				mRs = mStmt.executeQuery(sQuery);

				while (mRs.next()) {
					System.out.println("test");
					mMagicianInfoList.add(new MagicianInfomation(
							mRs.getString("ID"),
							mRs.getString("name"), 
							mRs.getInt("age"),
							mRs.getString("species"), 
							mRs.getString("birth"), 
							mRs.getString("job"),
							mRs.getInt("class"), 
							mRs.getString("property"), 
							mRs.getInt("mana"),
							mRs.getString("magicstroreID")));
				}
				
				mRs.close();
				ArrayList<String> mStoreNameList = new ArrayList<String>();
				
				for(int i = 0; i < mMagicianInfoList.size(); i++){
					sQuery = "SELECT storename FROM magicstore WHERE ID='" + mMagicianInfoList.get(i).getsMagicStore() + "'";
					System.out.println(sQuery);
					mRs = mStmt.executeQuery(sQuery);

					while (mRs.next()) {
						mStoreNameList.add(mRs.getString("storename"));
					}
					System.out.println("test");
					mRs.close();
				}
					
	%>
	<form name="manage_magicstore" action="manage_magicstore.jsp" method="post">
		<table>
				<tr>
					<td align="left" colspan="8"><h3>타상회 소속 마법사 검색결과</h3></td>
					<td><input type="text" name="magic_idx" style="display: none"></td>
					<td><input type="text" name="magic_mode" style="display: none"></td>
				</tr>
				<%
					if (mMagicianInfoList.size() == 0) {
				%>
				<tr>
					<td align="center" colspan="6"><h4>타 상회에 소속된 마법사가 존재하지 않습니다.</h4></td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td>이름</td>
					<td>나이</td>
					<td>종족</td>
					<td>출신지</td>
					<td>직업</td>
					<td>클래스</td>
					<td>속성</td>
					<td>마나량</td>
					<td>소속상회</td>
					<td><input type="text" name="magic_idx1" style="display: none"></td>
				</tr>
				<%
					for (int i = 0; i < mMagicianInfoList.size(); i++) {
				%>
				<tr>
					<td><input type="text" name="magician_name"
						value="<%=mMagicianInfoList.get(i).getsName()%>" readonly="readonly"></td>
					<td><input type="text" name="magician_age"
						value="<%=mMagicianInfoList.get(i).getsAge()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_species"
						value="<%=mMagicianInfoList.get(i).getsSpecies()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_birth"
						value="<%=mMagicianInfoList.get(i).getsBirth()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_job"
						value="<%=mMagicianInfoList.get(i).getsJob()%>" readonly="readonly"></td>
					<td><input type="text" name="magician_class"
						value="<%=mMagicianInfoList.get(i).getsClass()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_property"
						value="<%=mMagicianInfoList.get(i).getsProperty()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_mana"
						value="<%=mMagicianInfoList.get(i).getsMana()%>"
						readonly="readonly"></td>
					<td><input type="text" name="magician_storename"
						value="<%=mStoreNameList.get(i)%>" readonly="readonly"></td>
					<td><input type="button" id="btn" value="등록"
						onclick="check1(this.parentElement.parentElement.cells[10].children[0].value, this.value)" /></td>
					<td><input type="text" name="magic_i" style="display: none"
						value="<%=i%>"></td>
					<td><input type="text" name="magician_id" style="display: none"
						value="<%=mMagicianInfoList.get(i).getsId()%>" readonly="readonly"></td>
				</tr>
				<%
								}
				%>
		</table>
	</form>
	<%				
					

			}
		}
		else if(request.getParameter("sbtn").equals("재고검색")){
			ArrayList<MaterialInfomation> mMaterialInfoList = new ArrayList<MaterialInfomation>();
			
			sQuery = "SELECT * "
					+ "FROM meterial "
					+ "WHERE (name LIKE'%" + request.getParameter("search") + "%'"
							+ " OR origin LIKE'%" + request.getParameter("search") + "%' OR type LIKE'%" + request.getParameter("search") + "%');";

			mRs = mStmt.executeQuery(sQuery);

			while (mRs.next()) {
				mMaterialInfoList.add(new MaterialInfomation(
						mRs.getString("name"),
						mRs.getString("origin"), 
						mRs.getString("type"),
						mRs.getInt("price")));
			}
			mRs.close();
		}
		
	%>
		
	<%
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

</body>
</html>