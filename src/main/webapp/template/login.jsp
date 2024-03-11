<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link href="../../css/ch03-1.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="./login_ok.jsp" method="post">
		<h1>로그인</h1>
		<hr>
		<label>이름</label> <input type="text" name=id id=id
			placeholder="Enter ID" required="required"> <label>아이디</label>
		<input type="text" name=passwd id=passwd placeholder="Enter Passwd"
			required="required">
		<div class="clearfix">
			<button type="submit" class="submitbtn">Submit</button>
			<button type="reset" class="cancelbtn">Cancel</button>
		</div>
	</form>
</body>
</html>