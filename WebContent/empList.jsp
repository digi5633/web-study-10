<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 목록</title>
				<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#addEmp').on("click", function(){
					if (confirm("사원을 추가 하시겠습니까?") == true){	// 확인
						$.ajax ({
							type : "get",
							url : "EmpAddHandler",
							success : function(data) {
								/* alert("data > " + data); */
								window.location.href="empAdd.jsp" + data;
							}
						
						});
					
					} else {	// 취소
						 return false;
					}
					
				});
				
			    $.post("TitleListHandler", function(json){
			        setTimeout(function() {
				        var dataLength = json.length;
				        if ( dataLength >=1 ){
				            var sCont = "";
				            for ( i=0 ; i < dataLength ; i++){
				                sCont += "<option value=" + json[i].no + ">" + json[i].name + "</>";
				            }
				            $("#selectTitle").append(sCont);   
				        }
						
					});
					
				});
			    
			    $.post("DeptListHandler", function(json){
			        setTimeout(function() {
				        var dataLength = json.length;
				        if ( dataLength >=1 ){
				            var sCont = "";
				            for ( i=0 ; i < dataLength ; i++){
				                sCont += "<option value=" + json[i].no + ">" + json[i].name + "</>";
				            }
				            $("#selectDept").append(sCont);   
				        }
 
					});
			        
			    });

				$('#index').on("click", function() {
				    if (confirm("처음 화면으로 이동 하시겠습니까?") == true) {	// 확인
				    	
						location.href="IndexHandler";
				    	
				    } else {	// 취소
				    	return false;
				    }
				    
				});
       
			});
		</script>
	</head>
		
	<body>
	직책
	<select id="selectTitle" name="selectTitle">
		<option>목록</option>
	</select>
	<br>
	부서
	<select id="selectDept" name="selectDept">
		<option>목록</option>
	</select>
		<h2>사원 목록</h2>
		<table border=1>
			<thead>
				<td>사원 번호</td>
				<td>사원 이름</td>
				<td>직책(번호)</td>
				<td>직속상사(번호)</td>
				<td>급여</td>
				<td>부서(번호)</td>
				<td>이메일</td>
				<td>입사일</td>
				<td>전화번호</td>
			</thead>
			<tbody>
				<c:forEach var="emp" items="${list}">
					<tr>
						<td>${emp.no}</td>
						<td><a href="EmpGetHandler?no=${emp.no}">${emp.name}</a></td>
						<td>${emp.tno.name}(${emp.tno.no})</td>
						<td>${emp.manager.name}<c:if test="${emp.manager.no ne 0}">(${emp.manager.no})</c:if>
						<td><fmt:formatNumber value="${emp.salary}"/></td>
 						<td>${emp.dno.name}(${emp.dno.no})</td>
 						<td>${emp.email}</td>
						<td><fmt:formatDate value="${emp.regDate}" pattern="yyyy년 MM월 dd일"/></td>
						<td>${emp.tel}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<button id="addEmp">사원 추가</button> &nbsp;&nbsp;
		<button id="index">처음 화면으로</button>
	</body>
</html>