<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page  import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%


    // 폼에서 전달된 데이터 수신
    String custId = request.getParameter("custId");
    String name = request.getParameter("name");
    String hp = request.getParameter("hp");
    String addr = request.getParameter("addr");
    String rdate = request.getParameter("rdate");

    try {
     	// 1단계 - JNDI 서비스 객체 생성
		Context initctx = new InitialContext();
		Context ctx = (Context) initctx.lookup("java:comp/env");
		
	
	// 2단계 - 커넥션 풀에서 커넥션 객체 가져오기
		DataSource ds= (DataSource)	ctx.lookup("jdbc/shoperd");
		Connection conn = ds.getConnection();
		
        // 3단계 - SQL 실행 객체 생성
        String sql = "UPDATE `customer` SET name=?, hp=?, addr=?, rdate=? WHERE custId=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, hp);
        pstmt.setString(3, addr);
        pstmt.setString(4, rdate);
        pstmt.setString(5, custId);
        
        // 4단계 - SQL 실행
        int result = pstmt.executeUpdate();
        
        // 5단계 - 데이터베이스 종료
        pstmt.close();
        conn.close();
        
        // 업데이트 완료 후 목록 페이지로 리다이렉트
    	response.sendRedirect("/ch06/shop/customer/list.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    }
%>