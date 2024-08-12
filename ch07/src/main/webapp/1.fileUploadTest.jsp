<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.fileUploadTest</title>
	<!-- 
		날짜 : 2024/08/12
		이름 : 황수빈
		내용 : 파일 업로드 실습하기
		
		- 초기 설정 	 +) lib 파일에 mysql-connector-j-8,2,0.jar 파일 넣기
		1. 톰캣 jsp/servers/context.xml> Context 태그에 allowCasualMultipartparsing = "true";
		2. 톰캣 jsp/servers/server.xml > Connector 태그에 maxPostSize = "10485760" (1024 X 1024 X 10 = 10MB) 설정

		
		
	-->
</head>
<body>
	<h3>1.파일업로드</h3>
	<!-- 파일전송 폼은 post와 multipart/form-data 전송방식 설정 -->
	<form action="./proc/fileUpload.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="uid" placeholder="아이디 입력"/><br>
		<input type="text" name="name" placeholder="이름 입력"/><br>
		<input type="file" name="fname" placeholder="파일 추가"/><br>
		<input type="submit" value="전송하기"/>
	</form>
	<a href = "./2.fileDownloadTest.jsp" > 다운로드 목록 </a>
	
</body>
</html>