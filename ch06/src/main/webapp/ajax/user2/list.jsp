<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ajax::user2</title>

<script>
		// javascript는 인터프리터 방식이라 태그들을 쓰려면 맨 밑에 써야함 
		// 혹은 window.onload function(){} 안에서 구현하면 됨
		
		window.onload = function(){
			// 테이블 객체화
			const table = document.getElementsByTagName('table')[0];
			
			// 사용자 데이터 요청
			fetch('./proc/getUsers.jsp')
				.then(response=>response.json())
				.then(data => {
					console.log(data);
					
					for(const user of data){
						console.log(user.uid);
						
						const row = `<tr>
			                            <td>\${user.uid}</td>
			                            <td>\${user.name}</td>
			                            <td>\${user.birth}</td>
			                            <td>\${user.hp}</td>
			                            <td>\${user.age}</td>
			                            <td>
			                            	<a href='#' class='modify'>수정</a>
			                            	<a href='#' class='delete'>삭제</a>
			                            </td>
			                        </tr>`;

						table.insertAdjacentHTML('beforeend', row);
						
					}
				})
				.catch(err => {
					console.log(err);
				});
			
		
			
		}// onload end
	</script>

</head>

<body>

	<h3>User2 목록</h3>
	
	<a href ="./register.jsp">등록하기</a>
	
	<table border = "1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
	</table>
</body>
</html>