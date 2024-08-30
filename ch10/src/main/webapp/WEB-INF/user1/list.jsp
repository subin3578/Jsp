<%@ taglib prefix = "c" uri="jakarta.tags.core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User1::list</title>
</head>
<body>
	<h3>User1 목록</h3>
	
	<a href="/ch10/">처음으로</a>
	<a href="/ch10/user1/register.do">등록</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		
		<c:forEach var="user" items= "${requestScope.users}"> <!-- requestScope 생략 가능 -->
		<tr>
			<td>${user.getUid()}</td>
			<td>${user.getName()}</td>
			<td>${user.birth}</td> <!-- 표현언어는 직접 참조 가능 -->
			<td>${user.hp}</td>
			<td>${user.age}</td>
			<td>
				<a href="/ch10/user1/modify.do?uid=${user.uid}">수정</a>
				<a href="/ch10/user1/delete.do?uid=${user.uid}">삭제</a>
			</td>
		</tr>
		</c:forEach>

	</table>
</body>
</html>