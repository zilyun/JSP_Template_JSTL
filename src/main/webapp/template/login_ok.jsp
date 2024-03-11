<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 처리</title>
<meta charset="utf-8">
</head>
<body>
	<%
	// web.xml에 설정한 값을 가져옵니다.
	String xmlID = application.getInitParameter("id");
	String xmlPASS = application.getInitParameter("password");

	// 입력한 아이디와 비밀번호를 가져옵니다. 
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	// web.xml에서 가져온 값과 입력한 값을 비교합니다. 
	if (xmlID.equals(id) && xmlPASS.equals(passwd)) {
		session.setAttribute("id", id);
	%>
	<script>
		location.href = 'templatetest.jsp';
	</script>
	<%
	} else if (xmlID.equals(id)) {
	%>
	<script>
		alert('비밀번호를 확인하세요.');
		history.back();
	</script>
	<%
	} else {
	%>
	<script>
		alert('아이디를 확인하세요.');
		history.back();
	</script>
	<%
	}
	%>
</body>
</html>
