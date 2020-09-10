<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>부서 목록</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#addDept').on("click", function(){
					alert("부서 추가 버튼 클릭");
					$.ajax ({
						type : "get",
						url : "DeptAddHandler",
						success : function(data) {
							alert("data > " + data);
							window.location.href="deptAdd.jsp?nextNo=" + data;
						}
					
					});
					
				});
				
				$('#index').on("click", function() {
					location.href="IndexHandler";
				});
			
			});
		</script>
	</head>
	
	<body>
		<h2>부서 목록</h2>
		<table border=1>
			<thead>
				<td>부서 번호</td>
				<td>부서 이름</td>
				<td>부서 위치</td>
			</thead>
			<tbody>
				<c:forEach var="dept" items="${list}">
					<tr>
						<td>${dept.no}</td>
						<td><a href="DeptGetHandler?no=${dept.no}">${dept.name}</a></td>
						<td>${dept.floor}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<button id="addDept">부서 추가</button> &nbsp;&nbsp;
		<button id="index">처음 화면으로</button>
	</body>
</html>