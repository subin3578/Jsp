<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="user2.User2VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<User2VO> users = new ArrayList<>();
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		String sql = "select * from `user2`";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		ResultSet rs = psmt.executeQuery(sql);
		
		while(rs.next()){
			User2VO vo = new User2VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setHp(rs.getString(4));
			vo.setAge(rs.getInt(5));
		
			users.add(vo);
				
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	Gson gson = new Gson();
	String jsonData = gson.toJson(users);
	out.print(jsonData);
%>