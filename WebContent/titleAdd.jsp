<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>직책 추가</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#add').on("click", function() {
					var newTitle = {
							no:$('#no').val(),
							name:$('#name').val()
							};
					$.ajax({
						type : "post",
						url : "TitleAddHandler",
						cache : false,
						data : JSON.stringify(newTitle),
						complete : function(data) {
							alert("추가 되었습니다." + data);
							window.location.href="TitleListHandler";
						}
						
					});
					
				});
				
			});
		</script>
	</head>
	
	<body>
		<fieldset>
			<legend>직책 추가</legend>
			<ul>
				<li>
					<label for="no">직책 번호</label>
					<input id="no" type="number" name="no" value="${param.nextNo}" readonly="readonly">
				</li>
				<li>
					<label for="name">직책 이름</label>
					<input id="name" type="text" name="name">
				</li>
				<br>
				<li>
					<button id="add">추가</button> &nbsp;&nbsp;
					<button id="cancel">취소</button>
				</li>
			</ul>
		</fieldset>
	</body>
</html>