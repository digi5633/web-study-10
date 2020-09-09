<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 정보</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var status = false;
				$('#modify').on("click", function() {
					alert("수정");
					if(!status) {
						$('input#name').attr("readonly", false);
						$('select#selectTitle').attr("onFocus", false);
						$('select#selectTitle').attr("onChange", false);
						$('input#manager').attr("readonly", false);
						$('select#selectEmp').attr("onFocus", false);
						$('select#selectEmp').attr("onChange", false);
						$('input#salary').attr("readonly", false);
						$('select#selectDept').attr("onFocus", false);
						$('select#selectDept').attr("onChange", false);
						$('input#email').attr("readonly", false);
						$('input#regDate').attr("readonly", false);
						$('input#tel').attr("readonly", false);
						$('input#pass').attr("readonly", false);
						$('input#passChk').attr("readonly", false);
						status = true;
					} else {
						
						var Title = {
								name:$("#selectTitle option:selected").text(),
						};
						
						var Dept = {
								name:$("#selectDept option:selected").text(),
						}
						
						var Emp2 = {
								name:$("#selectEmp option:selected").text(),
						}

						var emp = {
								no:$('#no').val(),
								name:$('#name').val(),
								
								tno:Title,
								
								manager:Emp2,

								/* manager:$('#manager').val(), */
								/* salary:$('#salary').val(),*/
								
								dno:Dept,
								
								email:$('#email').val(),
								regDate:$('#regDate').val(),
								tel:$('#tel').val(),
								/* pass:$('#pass').val() */
								};
						$.ajax({
							type : "post",
							url : "EmpModHandler",
							data : JSON.stringify(emp),
							success : function(data) {
								alert(data);
								if (data == 1) {
									alert("수정 되었습니다.")
									window.location.href = "EmpListHandler";
								}
								
							}
							
						});
						
					}
					
				});
				
				$('#delete').on("click", function() {
					alert("삭제");
					var delEmp = {no:$('#no').val()}
					$.ajax({
						type : "get",
						url : "EmpDelHandler",
						data : delEmp,
						success : function(data) {
							alert(data);	// 1이면 삭제 0이면 실패
							if (data == 1) {
								alert("삭제 되었습니다.");
								window.location.href = "EmpListHandler";
							}
							
						}
					
					});
					
				});
				
				$('#list').on("click", function() {
					location.href="EmpListHandler";
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
			    
			    $.post("EmpListHandler", function(json){
			        setTimeout(function() {
				        var dataLength = json.length;
				        if ( dataLength >=1 ){
				            var sCont = "";
				            for ( i=0 ; i < dataLength ; i++){
				                sCont += "<option value=" + json[i].no + ">" + json[i].name + "</>";
				            }
				            $("#selectEmp").append(sCont);   
				        }
 
					});
			        
			    });

			});
		</script>
	</head>
	
	<body>
		<fieldset>
			<legend>사원 정보</legend>
			<ul>
				<li>
					<label for="no">사원 번호</label>
					<input id="no" type="number" name="no" value="${emp.no}" readonly="readonly">
				</li>
				<br>
				<li>
					<label for="name">사원 이름</label>
					<input id="name" type="text" name="name" value="${emp.name}" readonly="readonly">
				</li>
				<br>
				<li>
					<label for="tname">직책</label>
					<%-- <input id="tname" type="text" name="tname" value="${emp.tno.name}" readonly="readonly"> --%>
					<select id="selectTitle" name="selectTitle"
							onFocus='this.initialSelect = this.selectedIndex;'
							onChange='this.selectedIndex = this.initialSelect;'>
						<option value="${emp.tno.name}">${emp.tno.name}(${emp.tno.no})</option>
					</select>
				</li>
				<br>
				<li>
					<label for="manager">직속상사</label>
					<%-- <input id="manager" type="text" name="manager" value="${emp.manager.name}" readonly="readonly"> --%>
					<select id="selectEmp" name="selectEmp"
							onFocus='this.initialSelect = this.selectedIndex;'
							onChange='this.selectedIndex = this.initialSelect;'>
						<option value="${emp.manager.name}">${emp.manager.name}(${emp.manager.no})</option>
					</select>
				</li>
				<br>
				<li>
					<label for="salary">급여</label>
					<input id="salary" type="text" name="salary" value="<fmt:formatNumber value="${emp.salary}"/>" readonly="readonly">
				</li>
				<br>
				<li>
					<label for="dname">부서</label>
					<%-- <input id="dname" type="text" name="dname" value="${emp.dno.name}" readonly="readonly"> --%>
					<select id="selectDept" name="selectDept"
							onFocus='this.initialSelect = this.selectedIndex;'
							onChange='this.selectedIndex = this.initialSelect;'>
						<option value="${emp.dno.name}">${emp.dno.name}(${emp.dno.no})</option>
					</select>
				</li>
				<br>
				<li>
					<label for="email">이메일</label>
					<input id="email" type="text" name="email" value="${emp.email}" readonly="readonly">
				</li>
				<br>
				<li>
					<label for="regDate">입사일</label>
					<input id="regDate" type="date" name="regDate" value="<fmt:formatDate value="${emp.regDate}" pattern="yyyy-MM-dd"/>" readonly="readonly">
				</li>
				<br>
				<li>
					<label for="tel">전화번호</label>
					<input id="tel" type="text" name="tel" value="${emp.tel}" readonly="readonly">
				</li>
				<br>
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