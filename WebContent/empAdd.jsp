<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 추가</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#add').on("click", function() {
					var Title = {
							no:$("#selectTitle").val(),
					};
					
					var Dept = {
							no:$("#selectDept").val(),
					};
					
					var Emp2 = {
							no:$("#selectEmp").val(),
					};

					var newEmp = {
							no:$('#no').val(),
							name:$('#name').val(),
							tno:Title,
							manager:Emp2,
							salary:$('#salary').val(),
							dno:Dept,
							email:$('#email').val(),
							regDate:$('#regDate').val(),
							pass:$('#pass').val(),
							tel:$('#tel').val(),
							};
					$.ajax({
						type : "post",
						url : "EmpAddHandler",
						cache : false,
						data : JSON.stringify(newEmp),
						complete : function(data) {
							alert("사원이 추가 되었습니다.");
							window.location.href="EmpListHandler";
						}
						
					});
					
				});
				
				 $.post("TitleListHandler", function(json){
				        var dataLength = json.length;
				        if ( dataLength >=1 ){
				            var sCont = "";
				            for ( i=0 ; i < dataLength ; i++){
				                sCont += "<option value=" + json[i].no + ">" + json[i].name + "</>";
				            }
				            $("#selectTitle").append(sCont);   
				        }

					});
				    
			    $.post("DeptListHandler", function(json){
			        var dataLength = json.length;
			        if ( dataLength >=1 ){
			            var sCont = "";
			            for ( i=0 ; i < dataLength ; i++){
			                sCont += "<option value=" + json[i].no + ">" + json[i].name + "</>";
			            }
			            $("#selectDept").append(sCont);   
			        }

			    });
			    
			    $.post("EmpListHandler", function(json){
			        var dataLength = json.length;
			        if ( dataLength >=1 ){
			            var sCont = "";
			            for ( i=0 ; i < dataLength ; i++){
			                sCont += "<option value=" + json[i].no + ">" + json[i].name + "</>";
			            }
			            $("#selectEmp").append(sCont);   
			        }
		        
		    	});
			    
				$('#list').on("click", function() {
					 if (confirm("사원 목록으로 이동 하시겠습니까?") == true) {	// 확인
						
						 location.href="EmpListHandler";
					 
				    } else {	// 취소
				    	return false;
				    }
					 
				});
				
				$('#cancel').on("click", function() {
					$('#no').val("");
					$('#name').val("");
					$('#selectDept').val("");
					$('#selectEmp').val("");
					$('#selectTitle').val("");
					$('#salary').val("");
					$('#email').val("");
					$('#regDate').val("");
					$('#tel').val("");
					$('#pass').val("");
					$('#passChk').val("");
				});
					
			});
		</script>
	</head>
	
	<body>
		<fieldset>
			<legend>사원 추가</legend>
			<ul>
				<li>
					<label for="no">사원 번호</label>
					<div><input id="no" type="number" name="no"></div>
				</li>
				<br>
				<li>
					<label for="name">사원 이름</label>
					<div><input id="name" type="text" name="name"></div>
				</li>
				<br>
				<li>
					<label for="dname">부서</label>
					<div><select id="selectDept" name="selectDept" style="width:178px;height:22px;">
						<option value="${emp.dno.no}">부서를 선택하세요.</option>
					</select></div>
				</li>
				<br>
				<li>
					<label for="manager">직속상사</label>
					<div><select id="selectEmp" name="selectEmp" style="width:178px;height:22px;">
						<option value="${emp.manager.no}">직속상사를 선택하세요.</option>
					</select></div>
				</li>
				<br>
				<li>
					<label for="tname">직책</label>
					<div><select id="selectTitle" name="selectTitle" style="width:178px;height:22px;">
						<option value="${emp.tno.no}">직책을 선택하세요.</option>
					</select></div>
				</li>
				<br>
				<li>
					<label for="salary">급여</label>
					<div><input id="salary" type="text" name="salary"></div>
				</li>
				<br>
				<li>
					<label for="email">이메일</label>
					<div><input id="email" type="text" name="email"></div>
				</li>
				<br>
				<li>
					<label for="regDate">입사일</label>
					<div><input id="regDate" type="date" name="regDate" style="width:178px;height:22px;"></div>
				</li>
				<br>
				<li>
					<label for="tel">전화번호</label>
					<div><input id="tel" type="text" name="tel"></div>
				</li>
				<br>
				<li>
					<label for="pass">비밀번호</label>
					<div><input id="pass" type="password" name="pass"></div>
				</li>
				<br>
				<li>
					<label for="passChk">비밀번호 확인</label>
					<div><input id="passChk" type="password" name="passChk"></div>
				</li>
				<br>
				<li>
					<button id="add">추가</button> &nbsp;&nbsp;
					<button id="cancel">취소</button> &nbsp;&nbsp;
					<button id="list">목록</button>
				</li>
			</ul>
		</fieldset>
	</body>
</html>