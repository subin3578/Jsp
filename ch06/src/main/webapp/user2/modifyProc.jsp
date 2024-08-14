<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 데이터베이스 연결 정보
    String host = "jdbc:mysql://127.0.0.1:3306/studydb";
    String user = "root";
    String pass = "1234";

    // 폼에서 전달된 데이터 수신
    String uid = request.getParameter("uid");
    String name = request.getParameter("name");
    String birth = request.getParameter("birth");
    String hp = request.getParameter("hp");
    String age = request.getParameter("age");

    try {
        // 1단계 - JDBC 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // 2단계 - 데이터베이스 접속
        Connection conn = DriverManager.getConnection(host, user, pass);
        
        // 3단계 - SQL 실행 객체 생성
        String sql = "UPDATE `user2` SET name=?, birth=?, hp=?, age=? WHERE uid=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, birth);
        pstmt.setString(3, hp);
        pstmt.setInt(4, Integer.parseInt(age));
        pstmt.setString(5, uid);
        
        // 4단계 - SQL 실행
        int result = pstmt.executeUpdate();
        
        // 5단계 - 데이터베이스 종료
        pstmt.close();
        conn.close();
        
        // 업데이트 완료 후 목록 페이지로 리다이렉트
        response.sendRedirect("/ch06/user2/list.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    }
%>