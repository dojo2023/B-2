<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/BtwoB/css/login_regist.css">
<link rel="stylesheet" href="/BtwoB/css/popup.css">
<title>まめぇまめぇ</title>
</head>
<style>
body{
text-align: center;
}
.center{
text-align: center;
}
</style>
<body>
<!-- まめぇまめぇのロゴ画像 -->
	<div class="logo">
		<a href="/BtwoB/TopServlet"><img src="/BtwoB/img/logo.png" alt="まめぇまめぇ" ></a>
	</div>
	<form method="POST" action="/BtwoB/RegistServlet">
	<input type="text" name="user_name" placeholder="ゆ～ざ～メェ"><br>
	<input type="password" name="user_pw" placeholder="ぱすわ～ど"><br>
	<button type="submit" class="btn btn-primary">とうろく</button>
	<button type="submit" class="btn btn-primary">りせっと</button><br>
	</form>
	<a href="/BtwoB/LoginServlet">ろぐいんぺーじにもどる？</a>
</body>

<!-- ポップアップ -->
<input type="checkbox" id="pop-up">
<div class="overlay">
	<div class="window">
	<label class="close" for="pop-up">×</label>
		<p class="text">登録失敗！</p>

  <c:if test="${not empty showPopup}">
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      document.getElementById("pop-up").checked = true;
    });
  </script>
  </c:if>
	</div>
</div>
<!-- ポップアップここまで -->

<footer class="footer">
  <p class="copyright">© 2023 BtwoB Inc. All Rights Reserved.</p>
</footer>
</html>