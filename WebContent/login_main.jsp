<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0L);
%>
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
<title>마법 관리 체계</title>
</head>
<script type="text/javascript">
	function check(obj){
		document.manage_magic.magic_idx.value = obj;
		document.manage_magic.submit();
	}
</script>
<body>
	<div align="center">
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
		%>
		<div>
			<table>
				<tr>
					<td colspan="2" align="left"> <h2><%=sId%>님! 마법 관리 체계에 오신것을 환영합니다.</h2> </td>
					<td colspan="2" align="right"><input type="button" value="로그아웃" onClick="javascript:location.href='logout_processing.jsp'" /> </td>
				</tr>
			</table>
		</div>

		<form name=infomation_update action="update_info.jsp" method="post">
			<table>
				<tr>
					<td align="left" colspan="2"><h3>기본정보</h3></td>
					<td align="right" colspan="2"><input type="submit" value="변경" /></td>
				</tr>

				<%
					if (sUserType.equals("마법사")) {
						// 로그인 유저타입이 마법사 일때 표시
						MagicianInfomation mMagicianInfo = null;
						sQuery = "SELECT * FROM magician WHERE ID='" + sId + "';";
						mRs = mStmt.executeQuery(sQuery);
						
						while(mRs.next()){
							mMagicianInfo = new MagicianInfomation(
									mRs.getString("ID"),
									mRs.getString("password"),
									mRs.getString("name"),
									mRs.getInt("age"),
									mRs.getString("species"),
									mRs.getString("birth"),
									mRs.getString("job"),
									mRs.getInt("class"),
									mRs.getString("property"),
									mRs.getInt("mana"),
									mRs.getDouble("money"),
									mRs.getString("magicstroreID"));
						}
						mRs.close();
						
						String sStoreName = "";
						sQuery = "SELECT storename FROM magicstore WHERE ID='" + mMagicianInfo.getsMagicStore() + "';";
						
						mRs = mStmt.executeQuery(sQuery);
						
						while(mRs.next()){
							sStoreName = mRs.getString("storename");
						}
				%>
				<tr>
					<td style="display:none">ID</td>
					<td>
						<input type="text" name="info_id" value=<%=mMagicianInfo.getsId() %> readonly="readonly" style="display:none"/>
					</td>
					<td style="display:none">password</td>
					<td>
						<input type="password" name="info_password" value=<%=mMagicianInfo.getsPassword() %> readonly="readonly" style="display:none" />
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="info_name" value=<%=mMagicianInfo.getsName() %> readonly="readonly"/>
					</td>
					<td>나이</td>
					<td>
						<input type="text" name="info_age" value=<%=mMagicianInfo.getsAge() %> readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>종족</td>
					<td>
						<input type="text" name="info_species" value=<%=mMagicianInfo.getsSpecies() %> readonly="readonly"/>
					</td>
					<td>출신지</td>
					<td>
						<input type="text" name="info_birth" value=<%=mMagicianInfo.getsBirth() %> readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<input type="text" name="info_job" value=<%=mMagicianInfo.getsJob() %> readonly="readonly"/>
					</td>
					<td>클래스</td>
					<td>
						<input type="text" name="info_class" value=<%=mMagicianInfo.getsClass() %> readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>속성</td>
					<td>
						<input type="text" name="info_property" value=<%=mMagicianInfo.getsProperty() %> readonly="readonly"/>
					</td>
					<td>마나량</td>
					<td>
						<input type="text" name="info_mana" value=<%=mMagicianInfo.getsMana() %> readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>소지금</td>
					<td>
						<input type="text" name="info_money" value=<%=mMagicianInfo.getsMoney() %> readonly="readonly"/>
					</td>
					<td>소속 마법 상회</td>
					<td>
						<input type="text" name="info_magicstoreID" value=<%=sStoreName %> readonly="readonly"/>
					</td>
				</tr>
				<%
					} else if (sUserType.equals("마법상회")) {
						// 로그인 유저타입이 마법상회 일때 표시
						MagicStoreInfomation mMagicStoreInfo = null;
						sQuery = "SELECT * FROM magicstore WHERE ID='" + sId + "';";
						
						mRs = mStmt.executeQuery(sQuery);
							
						while(mRs.next()){
							mMagicStoreInfo = new MagicStoreInfomation(
									mRs.getString("ID"),
									mRs.getString("password"),
									mRs.getString("storename"),
									mRs.getString("address"),
									mRs.getString("representative"),
									mRs.getInt("maxclass"),
									mRs.getDouble("money"));
						}
						
				%>
				<tr>
					<td style="display:none">ID</td>
					<td>
						<input type="text" name="info_store_id" value=<%=mMagicStoreInfo.getsId() %> readonly="readonly" style="display:none"/>
					</td>
					<td style="display:none">password</td>
					<td>
						<input type="password" name="info_store_password" value=<%=mMagicStoreInfo.getsPassword() %> readonly="readonly" style="display:none" />
					</td>
				</tr>
				<tr>
					<td>상회명</td>
					<td>
						<input type="text" name="info_store_name" value=<%=mMagicStoreInfo.getsStoreName() %> readonly="readonly"/>
					</td>
					<td>주소</td>
					<td>
						<input type="text" name="info_store_address" value=<%=mMagicStoreInfo.getsAddress() %> readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>대표자 이름</td>
					<td>
						<input type="text" name="info_store_representative" value=<%=mMagicStoreInfo.getsRepresentative() %> readonly="readonly"/>
					</td>
					<td>거래 허가 클래스</td>
					<td>
						<input type="text" name="info_store_maxclass" value=<%=mMagicStoreInfo.getiMaxClass() %> readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>소지금</td>
					<td>
						<input type="text" name="info_store_money" value=<%=mMagicStoreInfo.getdMoney() %> readonly="readonly"/>
					</td>
				</tr>
				<%
					} else if (sUserType.equals("소비자")) {
						// 로그인 유저타입이 소비자 일때 표시
						CustomerInfomation mCustomerInfo = null;
						sQuery = "SELECT * FROM customer WHERE ID='" + sId + "';";
						
						mRs = mStmt.executeQuery(sQuery);
						
						while(mRs.next()){
							mCustomerInfo = new CustomerInfomation(
									mRs.getString("ID"),
									mRs.getString("password"),
									mRs.getString("name"),
									mRs.getInt("age"),
									mRs.getString("address"),
									mRs.getString("property"),
									mRs.getDouble("money"));
						}
				%>
				<tr>
					<td style="display:none">ID</td>
					<td>
						<input type="text" name="info_customer_id" value=<%=mCustomerInfo.getsId() %> readonly="readonly" style="display:none"/>
					</td>
					<td style="display:none">password</td>
					<td>
						<input type="password" name="info_customer_password" value=<%=mCustomerInfo.getsPassword() %> readonly="readonly" style="display:none" />
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="info_customer_name" value=<%=mCustomerInfo.getsName() %> readonly="readonly"/>
					</td>
					<td>나이</td>
					<td>
						<input type="text" name="info_customer_age" value=<%=mCustomerInfo.getiAge() %> readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="info_customer_address" value=<%=mCustomerInfo.getsAddress() %> readonly="readonly"/>
					</td>
					<td>속성</td>
					<td>
						<input type="text" name="info_customer_property" value=<%=mCustomerInfo.getsProperty() %> readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>소지금</td>
					<td>
						<input type="text" name="info_customer_money" value=<%=mCustomerInfo.getdMoney() %> readonly="readonly"/>
					</td>
				</tr>
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
			</table>
		</form>
		<hr>
		<%
			try{
				if (sUserType.equals("마법사")) {
					ArrayList<MagicInfomation> mMagicInfoList = new ArrayList<MagicInfomation>();
					mDBConn = new DatabaseConnection();
					mStmt = mDBConn.getStmt();
					sQuery = "SELECT name, descrb, class, property, type, effective, consumption, price FROM magic WHERE magicianID='"+ sId +"'";
					
					mRs = mStmt.executeQuery(sQuery);
					
					while(mRs.next()){
						mMagicInfoList.add(new MagicInfomation(
								mRs.getString("name"),
								mRs.getString("descrb"),
								mRs.getInt("class"),
								mRs.getString("property"),
								mRs.getString("type"),
								mRs.getInt("effective"),
								mRs.getInt("consumption"),
								mRs.getInt("price")
								));
					}
		%>
				<form name="manage_magic" action="manage_magic.jsp" method="post">
					<table>
						<tr>
							<td align="left" colspan="4"><h3>내가 창조한 마법</h3></td>
							<td align="right"><input type="text" name="search" placeholder="검색어를 입력하세요." /></td>
							<td align="right"><input type="submit" name="btn" value="검색" /></td>
							<td align="right" ><input type="submit" name="btn" value="새로운 마법 등록" /></td>
							<td align="right"><input type="submit" name="btn" value="새로운 재료 등록" /></td>
						</tr>
		<%		
					if(mMagicInfoList.size() == 0){
		%>
						<tr>
							<td align="center" colspan="6"><h4>창조한 마법이 존재하지 않습니다.</h4></td>
						</tr>
		<%				
					}
					else{
		%>			
						<tr>
							<td>이름</td>
							<td>설명</td>
							<td>클래스</td>
							<td>속성</td>
							<td>종류</td>
							<td>효과량</td>
							<td>마나소비량</td>
							<td>가격</td>
							<td><input type="text" name="magic_idx" style="display:none"></td>
						</tr>	
		<%
						for(int i = 0; i < mMagicInfoList.size(); i++){
		%>
						<tr>
							<td><input type="text" name="magic_name" value="<%=mMagicInfoList.get(i).getsName() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_descrb" value="<%=mMagicInfoList.get(i).getsDescribe() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_class" value="<%=mMagicInfoList.get(i).getiClass() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_property" value="<%=mMagicInfoList.get(i).getsProperty() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_type" value="<%=mMagicInfoList.get(i).getsType() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_effective" value="<%=mMagicInfoList.get(i).getiEffective() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_consumption" value="<%=mMagicInfoList.get(i).getiConsumption() %>" readonly="readonly"></td>
							<td><input type="text" name="magic_price" value="<%=mMagicInfoList.get(i).getiPrice() %>" readonly="readonly"></td>
							<td><input type="button" id="btn" value="수정" onclick="check(this.parentElement.parentElement.cells[9].children[0].value)"/></td>
							<td><input type="text" name="magic_i" style="display:none"value="<%=i %>"></td>
						</tr>
		<%					
						}
					}
		%>			
					</table>
				</form>
		<%
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		
	</div>
</body>
</html>