<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web_study_10.ds.JndiDS"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>데이터베이스 연결 테스트</title>
	</head>
	
	<body>
		<c:set var="con" value="${JndiDS.getConnection()}"/>
		<c:out value="${con}"/>
		<br><br>
		<a href="TitleListHandler">직책 목록</a> <br><br>
		<a href="DeptListHandler">부서 목록</a> <br><br>
		<a href="EmpListHandler">사원 목록</a> <br><br>
	</body>
</html>