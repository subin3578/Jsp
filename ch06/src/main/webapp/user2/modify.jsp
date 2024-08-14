<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="user1.User1VO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%                                                                                                                                                                                                                                                                                                                            
    // 데이터베이스 연결 정보
    String host = "jdbc:mysql://127.0.0.1:3306/studydb";
    String user = "root";
    String pass = "1234";

    String uid = request.getParameter("uid");
    User1VO vo = new User1VO();

    try {
        // 1단계 - JDBC 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // 2단계 - 데이터베이스 접속
        Connection conn = DriverManager.getConnection(host, user, pass);
        
        // 3단계 - SQL 실행 객체 생성
        String sql = "SELECT * FROM `user2` WHERE uid=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, uid);
        
        // 4단계 - SQL 실행 및 결과 처리
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            vo.setUid(rs.getString("uid"));
            vo.setName(rs.getString("name"));
            vo.setBirth(rs.getString("birth"));
            vo.setHp(rs.getString("hp"));
            vo.setAge(rs.getInt("age"));
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
    <h3>User2 정보 수정</h3>
    
    
    	<form action="/ch06/user2/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value ="<%=vo.getUid()%>" readonly = "readonly"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value ="<%=vo.getName() %>"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" value ="<%=vo.getBirth() %>"/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value ="<%=vo.getHp() %>"/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value ="<%=vo.getAge()%>"/></td>
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
