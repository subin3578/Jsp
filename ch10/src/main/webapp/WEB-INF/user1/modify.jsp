
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify User</title>
</head>
<body>
    <h3>User1 정보 수정</h3>
    
    
    	<form action="/ch10/user1/modify.do" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value ="${user.uid}" readonly = "readonly"/></td>
			</tr>
			<tr>
				<td>이름</td>
			 	<td><input type="text" name="name" value ="${user.name}"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" value ="${user.birth}"/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value ="${user.hp}"/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value ="${user.age}"/></td>
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
