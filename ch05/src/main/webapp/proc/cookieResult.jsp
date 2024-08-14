<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>CookieResult</title>
	</head>
	<body>
		<h3>쿠키확인</h3>
		
		<%
			// request - 기본적으로 요청할 때 해당 서버의 쿠키가 있다면 가지고 요청
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie : cookies){
				
		%>
			<p>
				쿠키명 : <%= cookie.getName() %><br>
				쿠키값 : <%= cookie.getValue() %><br>
			</p>	
		<%		
			}		
	
		%>
		
		<!-- 
			- a 태그 링크 요청방식 : GET 
			- 1분 후에 쿠키를 확인하면 'pass' 쿠키는 없어짐
			- 마찬가지로 3분후 쿠키를 확인하면 'uid' 쿠키도 없어짐
			- JSESSIONID는 디폴트로 가지고 있는 쿠키값
		-->
		<a href = "../1.cookieTest.jsp">처음으로</a>
	</body>
</html>