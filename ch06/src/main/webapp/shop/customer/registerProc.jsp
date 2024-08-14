<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// form에서 입력된 데이터 수신
	String custId   = request.getParameter("custId");
	String name  = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr    = request.getParameter("addr");
	String rdate   = request.getParameter("rdate");
	
	
	try {
		// 1단계 - JNDI 서비스 객체 생성
				Context initctx = new InitialContext();
				Context ctx = (Context) initctx.lookup("java:comp/env");
				
			
			// 2단계 - 커넥션 풀에서 커넥션 객체 가져오기
				DataSource ds= (DataSource)	ctx.lookup("jdbc/shoperd");
				Connection conn = ds.getConnection();
				
		// 2단계 - SQL실행 객체 생성
		String sql = "insert into `customer` values (?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custId);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, addr);
		psmt.setString(5, rdate);
		
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












