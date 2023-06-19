<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/BtwoB/css/login.css">
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
</head>
<body>
<h1>まめぇまめぇ</h1>
<form method="POST" action="/BtwoB/LoginServlet">
<input type="text" name="username" placeholder="ゆ～ざ～メェ"><br>
<input type="password" name="PW" placeholder="ぱすわ～ど"><br>
		  <button type="submit" class="btn btn-primary">ろぐいん</button><button type="submit" class="btn btn-primary">りせっと</button><br>

		  <a href="/BtwoB/RegistServlet">しんきとうろくしますか？</a>
		  </form>
</body>

<footer class="footer">
  <p class="copyright">© 2023 BtwoB Inc. All Rights Reserved.</p>
</footer>
</html>