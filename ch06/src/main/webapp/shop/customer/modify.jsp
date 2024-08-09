<%@page import="java.sql.Statement"%>
<%@page import="shop.CustomerVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    String custId = request.getParameter("custId");
    CustomerVO vo = new CustomerVO();

    try {
    	// 1단계 - JNDI 서비스 객체 생성
   			Context initctx = new InitialContext();
   			Context ctx = (Context) initctx.lookup("java:comp/env");
    			
    		
   		// 2단계 - 커넥션 풀에서 커넥션 객체 가져오기
   			DataSource ds= (DataSource)	ctx.lookup("jdbc/shoperd");
   			Connection conn = ds.getConnection();
       
        // 3단계 - SQL 실행 객체 생성
        String sql = "SELECT * FROM `customer` WHERE custId=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, custId);
        
        // 4단계 - SQL 실행 및 결과 처리
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            vo.setCustId(rs.getString("custId"));
            vo.setName(rs.getString("name"));
            vo.setHp(rs.getString("hp"));
            vo.setAddr(rs.getString("addr"));
            vo.setRdate(rs.getString("rdate"));
        }
        
        // 5단계 - 데이터베이스 종료
        rs.close();
        pstmt.close();
        conn.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify User</title>
</head>
<body>
    <h3>customer 정보 수정</h3>
    
    
    	<form action="/ch06/shop/customer/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="custId" value="<%=vo.getCustId() %>" readonly = "readonly"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=vo.getName() %>"/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%=vo.getHp() %>"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=vo.getAddr() %>"/></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="date" name="rdate" value="<%=vo.getRdate() %>"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기"/>
				</td>
			</tr>		
		</table>
	
	</form>
</body>
</html>
