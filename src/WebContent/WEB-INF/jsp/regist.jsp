<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/BtwoB/css/login_regist.css">
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
<h1>まめぇまめぇ</h1>
	<form method="POST" action="/BtwoB/RegistServlet">
	<input type="text" name="user_name" placeholder="ゆ～ざ～メェ"><br>
	<input type="password" name="user_pw" placeholder="ぱすわ～ど"><br>
	<button type="submit" class="btn btn-primary">とうろく</button>
	<button type="submit" class="btn btn-primary">りせっと</button><br>
	</form>
	<a href="/BtwoB/LoginServlet">ろぐいんぺーじにもどる？</a>
</body>
<footer class="footer">
  <p class="copyright">© 2023 BtwoB Inc. All Rights Reserved.</p>
</footer>
</html>