<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String custId = request.getParameter("custId");

	String host = "jdbc:mysql://127.0.0.1:3306/shoperd";
	String user = "root";
	String pass = "1234";

	try {
		// 1단계 - JNDI 서비스 객체 생성
				Context initctx = new InitialContext();
				Context ctx = (Context) initctx.lookup("java:comp/env");
				
			
			// 2단계 - 커넥션 풀에서 커넥션 객체 가져오기
				DataSource ds= (DataSource)	ctx.lookup("jdbc/shoperd");
				Connection conn = ds.getConnection();
		// 2단계 - SQL실행 객체 생성
		String sql = "delete from `customer` where `custId`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custId);
		
		// 3단계 - SQL실행
		psmt.executeUpdate();
		
		// 4단계 - 결과처리(SELECT일 경우)
		// 5단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
		
	}catch(Exception e){	
		e.printStackTrace();
	}
	
	// 목록 이동
	response.sendRedirect("/ch06/shop/customer/list.jsp");
%>