<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top.jsp</title>
<style>
.bg-dark {
	background-color: #28a745!important;
}
.navbar-dark .navbar-nav .nav-link {
	color: rgb(255, 255, 255);
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-success navbar-dark">
		<a class="navbar-brand" href="#">액션태그</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<%-- flex-row-reverse 추가 - 오른쪽 끝으로 붙어요 --%>
		<div class="collapse navbar-collapse flex-row-reverse"
			id="collapsibleNavbar">
			<%
			String id = (String) session.getAttribute("id");
			if(id!=null && !id.equals("")) {
			%>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" ><%=id %>님이 로그인 되었습니다.</a></li>
				<li class="nav-item"><a class="nav-link" href="./logout.jsp">로그아웃</a></li>
			</ul>
			<%
			} else {
			%>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./join.jsp">회원가입</a></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./login.jsp">로그인</a></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
</body>
</html>