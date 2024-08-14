<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookieCreat 결과</title>
</head>
<body>
	<h3>쿠키생성</h3>

	
	<%
		//전송 데이터 수신
		String uid = request.getParameter("uid");
		String pass = request.getParameter("pass");
		
		// 쿠키 생성
		Cookie c1 = new Cookie("uid",uid);
		c1.setMaxAge(60*3);
		
		Cookie c2 = new Cookie("pass",pass);
		c1.setMaxAge(60*1);
		// 쿠키 전송
		response.addCookie(c1);
		response.addCookie(c2);
	%>
	
	<a href = "./cookieResult.jsp">쿠키확인</a>
	
</body>
</html>