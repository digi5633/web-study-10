<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 추가</title>
	</head>
	
	<body>
		<fieldset>
			<legend>사원 추가</legend>
			<ul>
				<li>
					<label for="no">사원 번호</label>
					<input id="no" type="number" name="no">
				</li>
				<br>
				<li>
					<label for="name">사원 이름</label>
					<input id="name" type="text" name="name">
				</li>
				<br>
				<li>
					<label for="tname">직책</label>
					<input id="tname" type="text" name="tname">
				</li>
				<br>
				<li>
					<label for="manager">직속상사</label>
					<input id="manager" type="text" name="manager">
				</li>
				<br>
				<li>
					<label for="salary">급여</label>
					<input id="salary" type="text" name="salary">
				</li>
				<br>
				<li>
					<label for="dname">부서</label>
					<input id="dname" type="text" name="dname">
				</li>
				<br>
				<li>
					<label for="email">이메일</label>
					<input id="email" type="text" name="email">
				</li>
				<br>
				<li>
					<label for="regDate">입사일</label>
					<input id="regDate" type="date" name="regDate">
				</li>
				<br>
				<li>
					<label for="tel">전화번호</label>
					<input id="tel" type="text" name="tel">
				</li>
				<br>
				<li>
					<label for="pass">비밀번호</label>
					<input id="pass" type="password" name="pass">
				</li>
				<br>
				<li>
					<label for="passChk">비밀번호 확인</label>
					<input id="passChk" type="password" name="passChk">
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