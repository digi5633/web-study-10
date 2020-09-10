<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>한꺼번에 여러 파일을 업로드하기 위한 폼</title>
	</head>
	
	<body>
		<form action="upload2.do" method="post" enctype="multipart/form-data">
			1. 파일 지정하기 : <input type="file" name="uploadFile01"><br>
			2. 파일 지정하기 : <input type="file" name="uploadFile02"><br>
			3. 파일 지정하기 : <input type="file" name="uploadFile03"><br>
			<input type="submit" value="전송">
		</form>
	</body>
</html>