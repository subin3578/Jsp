<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1.request</title>
	</head>
	<body>
		<h3>1.request 내장객체</h3>
		
		<h4>GET 요청 방식</h4>
			<!-- method get은 디폴트 / server로 데이터 전송하는 태그 <form>-->
			<form action= "./proc/result1.jsp" method="get">
				<input type="text" name ="uid"><br>
				<input type="text" name ="name"><br>
				<input type="number" name ="age"><br>
				<input type="submit" value ="전송"/>
			</form>
		<h4>POST 요청 방식</h4>
			
	</body>
</html>