<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>부서 정보</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var status = false;
				$('#modify').on("click", function() {
					alert("수정");
					if(!status) {
						$('input#name').attr("readonly", false);
						$('input#floor').attr("readonly", false);
						status = true;
					} else {
						var dept = {
								no:$('#no').val(),
								name:$('#name').val(),
								floor:$('#floor').val()
								};
						$.ajax({
							type : "post",
							url : "DeptModHandler",
							data : JSON.stringify(dept),
							success : function(data) {
								alert(data);
								if (data == 1) {
									alert("수정 되었습니다.")
									window.location.href = "DeptListHandler";
								}
								
							}
							
						});
						
					}
					
				});
				
				$('#delete').on("click", function() {
					alert("삭제");
					var delDept = {no:$('#no').val()}
					$.ajax({
						type : "get",
						url : "DeptDelHandler",
						data : delDept,
						success : function(data) {
							alert(data);	// 1이면 삭제 0이면 실패
							if (data == 1) {
								alert("삭제 되었습니다.");
								window.location.href = "DeptListHandler";
							}
							
						}
					
					});
					
				});
				
				$('#list').on("click", function() {
					location.href="DeptListHandler";
				});

			});
		</script>
	</head>
	
	<body>
		<fieldset>
			<legend>부서 정보</legend>
			<ul>
				<li>
					<label for="no">부서 번호</label>
					<input id="no" type="number" name="no" value="${dept.no}" readonly="readonly">
				</li>
				<li>
					<label for="name">부서 이름</label>
					<input id="name" type="text" name="name" value="${dept.name}" readonly="readonly">
				</li>
				<li>
					<label for="floor">부서 위치</label>
					<input id="floor" type="number" name="floor" value="${dept.floor}" readonly="readonly">
				</li>
				<br>
				<li>
					<button id="modify">수정</button> &nbsp;&nbsp;
					<button id="delete">삭제</button> &nbsp;&nbsp;
					<button id="list">목록</button>
				</li>
			</ul>
		</fieldset>
	</body>
</html>