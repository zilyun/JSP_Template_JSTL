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
<script>

</script>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div class="container">
		<c:if test="${!empty list}">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>성별</th>
						<th>취미</th>
						<th>자기소개</th>
						<th>가입일</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="temp" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><a href="info.net?id=${temp.id}">${temp.id}</a></td>
							<td>${temp.genderView}</td>
							<td>${temp.hobby}</td>
							<td><c:out value="${temp.intro}" /></td>
							<td>${temp.register_date}</td>
							<td><button class="btn btn-danger btn-sm"
									onclick="confirmLink('${temp.id}')">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script>
				function confirmLink(tempId) {
					if (confirm("정말 삭제하시겠습니까?")) {
						const id = tempId;
						//console.log(id);

						output = "<form action='delete.net' method=post>";
						output += "<input name=id value=" + id + ">";
						output += "<input type=submit onclick=\"submit()\")>"
						output += "</form>";
						
						$('body').append(output);
						$('form').hide().submit(); // 화면상에서 보이지 않도록 한 후 submit()을 실행합니다.
					} else {
						alert('취소를 선택하셨습니다.');
					}
				}
				
				const result = '${message}';
				if (result != '') {
					alert(result);
					<%session.removeAttribute("message");%>
				}
			</script>
		</c:if>

		<c:if test="${empty list}">
			<h4>조회된 데이터가 없습니다.</h4>
		</c:if>
	</div>
</body>
</html>