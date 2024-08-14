<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>usebeanTag</title>
</head>
<body>
	<h3>3.useBean 액션태그</h3>
	
	<!-- 사용자가 입력한 값을 서버로 전송해주는 태그 <form> post방식--> 
	<form action ="./proc/userProc.jsp" method="get">
		<input type ="text" name ="uid" placeholder ="아이디 입력"/><br>
		<input type ="text" name ="name" placeholder ="이름 입력"/><br>
		<input type ="text" name ="hp" placeholder ="휴대폰 입력"/><br>
		<input type ="number" name ="age" placeholder ="나이 입력"/><br>
		<input type ="submit" value ="전송하기"/><br>
		
	</form>
</body>
</html>