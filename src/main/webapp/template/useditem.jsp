<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container mt-3">
  <h2>중고상품 목록</h2>
  <p>상품을 입력하세요.</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>상품이름</th>
        <th>가격</th>
        <th>제조사</th>
      </tr>
    </thead>
    <tbody id="myTable">
      <tr>
        <td>갤럭시 s2</td>
        <td>100</td>
        <td>삼성</td>
      </tr>
      <tr>
        <td>LG그램 미니 PC</td>
        <td>200</td>
        <td>LG 전자</td>
      </tr>
      <tr>
        <td>폰</td>
        <td>0</td>
        <td>꽁짜</td>
      </tr>
      <tr>
        <td>중고</td>
        <td>10</td>
        <td>사기</td>
      </tr>
    </tbody>
  </table>
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
    	console.log($(this).text().toLowerCase().indexOf(value)> -1)
    	
    	
      // toggle(true)는 선택한 요소를 보이도록 설정하는 메소드입니다.
      // toggle(false)는 선택한 요소에 style="display: none;" 속성이 추가되어 보이지 않도록 합니다. 
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

