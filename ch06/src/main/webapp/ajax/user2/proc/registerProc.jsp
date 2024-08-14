<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="user2.User2VO"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	
	String line;
	while((line=reader.readLine()) != null){
		requestBody.append(line);
	} 
	reader.close();
	
	Gson gson = new Gson();
	User2VO user2 = gson.fromJson(requestBody.toString(), User2VO.class);
	System.out.println(user2);
	
	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		String sql = "insert into `user2` values (?,?,?,?,?)";

	}catch(Exception e){
		e.printStackTrace();
	}




%>