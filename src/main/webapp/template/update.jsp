<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>update.jsp</title>
<!-- top.jsp -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 회원가입 디자인 -->
<link href="${pageContext.request.contextPath}/css/NewFile.css"
	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/validate.js"></script>
<!-- 우편 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function () {
	const result = '${message}';
	if(result != ''){
		alert(result);
		<%session.removeAttribute("message");%>
	}
})
</script>
</head>
<body style="background-color: #474e5d">
	<jsp:include page="top.jsp" />
	<c:if test="${!empty temp}">
		<form method="post" action="updateProcess.net" name="myform" id="myform">
			<div class="container">
				<fieldset>
					<legend>정보 수정</legend>
					<div>
						<label for="id">ID</label> 
						<input type="text" size="10" name="id" readOnly
							id="id" placeholder="Enter ID" value="${temp.id}" 
							style="background: #ccc; width: 100%"> 
					</div>

					<div>
						<label for="pass">비밀번호</label> 
						<input type="password" name="pass"
							id="pass" placeholder="Enter Password" value='${temp.password}'>
					</div>
					
					<label for="jumin1">주민번호</label> 
					<input type="text" size="6" readOnly
						maxLength="6" name="jumin1" id="jumin1" placeholder="주민번호 앞자리" 
						value="${temp.jumin.substring(0,6)}">
					<b> - </b> 
					<input type="text" size="7" maxLength="7" name="jumin2"
						id="jumin2" placeholder="주민번호 뒷자리" 
						value="${temp.jumin.substring(7)}"> 
					
					<label for="email">E-Mail</label>
					<input type="text" name="email" id="email" value='${temp.email.split("@")[0]}' readOnly> 
					<b> @ </b> 
					<input
						type="text" name="domain" id="domain" value='${temp.email.split("@")[1]}' readOnly> 
					<select
						name=sel id=sel>
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
					
					<label>성별</label>
					<div class="container2">
						<input type="radio" name="gender" value="m" id="gender1" onClick="return false">남자
						<input type="radio" name="gender" value="f" id="gender2" onClick="return false">여자
					</div>

					<label>취미</label>
					<div class="container2">
						<input type="checkbox" name="hobby" id="hobby1" value="공부">공부
						<input type="checkbox" name="hobby" id="hobby2" value="게임">게임
						<input type="checkbox" name="hobby" id="hobby3" value="운동">운동
						<input type="checkbox" name="hobby" id="hobby4" value="등산">등산
						<input type="checkbox" name="hobby" id="hobby5" value="낚시">낚시
					</div>

					<label for="post1">우편번호</label> 
					<input type="text" maxLength="5" name="post1" id="post1" value='${temp.post}' readOnly> 
					<input type="button" value="우편검색" id="postcode" onclick="Postcode()"> 
						
					<label for="address">주소</label>
					<input type="text" name="address" id="address"
							value="<c:out value='${temp.address}'/>"> 
					
					<label for="intro">자기소개</label>
					<textarea rows="10" cols="75" name="intro" id="intro">${temp.intro}</textarea>
					
					<div class="clearfix">
						<button type="submit" class="signupbtn" value="회원가입">Update</button>
						<button type="reset" class="cancelbtn" value="취소">Cancel</button>
					</div>
				</fieldset>
				<a href="templatetest.net">templatetest.jsp 이동하기</a>
				<a href="javascript:history.back();">이전 페이지로 이동하기</a>
			</div>
		</form>
		<script>
		const gender = '${temp.gender}';
		$("input[value=" + gender + "]").prop("checked", true); // 성별 체크
		
		const hobbys = '${temp.hobby}'.split(',');
		for (let i = 0; i < hobbys.length; i++)
			$("input[value=" + hobbys[i] + "]").prop("checked", true);
		</script>
	</c:if>
	<c:if test="${empty temp}">
		<h3 style="text-align: center; position: relative; top: 3em;">해당 정보가 존재하지 않습니다.</h3>
	</c:if>
</body>
</html>