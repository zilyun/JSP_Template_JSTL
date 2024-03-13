<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
<!-- top.jsp -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.container {
	margin-top: 3em;
}

table, h4 {
	text-align: center;
}

td:nth-child(1) {
	font-weight: bold;
}

caption {
	text-align: center;
	font-weight: bold;
	caption-side: top;
	font-size: 1.5em;
}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div class="container">
		<c:if test="${!empty temp}">
			<table class="table">
				<caption>${temp.id}님의상세 정보</caption>
				<tr>
					<td>아이디</td>
					<td>${temp.id}</td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td>${temp.jumin}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${temp.email}</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>${temp.genderView}</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>${temp.hobby}</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>${temp.post}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${temp.address}</td>
				</tr>
				<tr>
					<td>자기소개</td>
					<td><c:out value="${temp.intro}" /></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${temp.register_date}</td>
				</tr>
			</table>
		</c:if>

		<c:if test="${empty temp}">
			<h4>조회된 데이터가 없습니다.</h4>
		</c:if>
	</div>
</body>
</html>