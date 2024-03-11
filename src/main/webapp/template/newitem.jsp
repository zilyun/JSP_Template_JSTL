<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container mt-3">
  <h2>신상품 목록</h2>
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
        <td>갤럭시 S30</td>
        <td>10000</td>
        <td>샘숭</td>
      </tr>
      <tr>
        <td>LG그램 울트라리스크 PC</td>
        <td>200미네랄 200가스</td>
        <td>LG 전자</td>
      </tr>
      <tr>
        <td>롤러블 폰</td>
        <td>700</td>
        <td>삼성</td>
      </tr>
      <tr>
        <td>롤리팝</td>
        <td>200</td>
        <td>달달함</td>
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

