<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>직책 정보</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var status = false;
				$('#modify').on("click", function() {
					alert("수정");
					if(!status) {
						$('input#name').attr("readonly", false);
						status = true;
					} else {
						var title = {
								no:$('#no').val(),
								name:$('#name').val()
								};
						$.ajax({
							type : "post",
							url : "TitleModHandler",
							data : JSON.stringify(title),
							success : function(data) {
								alert(data);
								if (data == 1) {
									alert("수정 되었습니다.")
									window.location.href = "TitleListHandler";
								}
								
							}
							
						});
						
					}
					
				});
				
				$('#delete').on("click", function() {
					alert("삭제");
					var delTitle = {no:$('#no').val()}
					$.ajax({
						type : "get",
						url : "TitleDelHandler",
						data : delTitle,
						success : function(data) {
							alert(data);	// 1이면 삭제 0이면 실패
							if (data == 1) {
								alert("삭제 되었습니다.");
								window.location.href = "TitleListHandler";
							}
							
						}
					
					});
					
				});
				
				$('#list').on("click", function() {
					location.href="TitleListHandler";
				});

			});
		</script>
	</head>
	
	<body>
		<fieldset>
			<legend>직책 정보</legend>
			<ul>
				<li>
					<label for="no">직책 번호</label>
					<input id="no" type="number" name="no" value="${title.no}" readonly="readonly">
				</li>
				<li>
					<label for="name">직책 이름</label>
					<input id="name" type="text" name="name" value="${title.name}" readonly="readonly">
				</li>
				<li>
					<button id="modify">수정</button>
					<button id="delete">삭제</button>
					<button id="list">목록</button>
				</li>
			</ul>
		</fieldset>
	</body>
</html>