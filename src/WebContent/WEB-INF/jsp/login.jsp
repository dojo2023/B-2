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
<hr>
<form method="POST" action="/BtwoB/LoginServlet">
ゆ～ざ～メェ～<input type="text" name="username"><br>
ぱすわ～ど<input type="password" name="PW"><br>
		  <button type="submit" class="btn btn-primary">ろぐいん</button><button type="submit" class="btn btn-primary">りせっと</button><br>

		  <a href="/BtwoB/RegistServlet">しんきとうろくしますか？</a>
		  </form>
</body>
</html>