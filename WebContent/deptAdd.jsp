<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>부서 추가</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#add').on("click", function() {
					var newDept = {
							no:$('#no').val(),
							name:$('#name').val(),
							floor:$('#floor').val()
							};
					$.ajax({
						type : "post",
						url : "DeptAddHandler",
						cache : false,
						data : JSON.stringify(newDept),
						complete : function(data) {
							alert("추가 되었습니다." + data);
							window.location.href="DeptListHandler";
						}
						
					});
					
				});
				
			});
		</script>
	</head>
	
	<body>
		<fieldset>
			<legend>부서 추가</legend>
			<ul>
				<li>
					<label for="no">부서 번호</label>
					<input id="no" type="number" name="no" value="${param.nextNo}" readonly="readonly">
				</li>
				<li>
					<label for="name">부서 이름</label>
					<input id="name" type="text" name="name">
				</li>
				<li>
					<label for="floor">부서 위치</label>
					<input id="floor" type="number" name="floor">
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