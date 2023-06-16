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
ゆ～ざ～メェ～<input type="username" name="name"><br>
ぱすわ～ど<input type="password" name="pass"><br>
 <button type="submit" class="btn btn-primary">とうろく</button><button type="submit" class="btn btn-primary">りせっと</button><br>
 <a href="/BtwoB/LoginServlet">ろぐいんぺーじにもどる？</a>
</form>
</body>
</html>