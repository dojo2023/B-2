<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/BtwoB/css/login.css">
<title>まめぇまめぇ</title>
</head>
<body>
	<div class="mx-auto" style="width: 300px;">
		<h1 class="mb-3" style="text-align: center">まめぇまめぇ</h1>
		<form action="/CustomerManagement/LoginServlet" method="post">
		  <div class="mb-3">
		    <label for="adminID" class="form-label">ゆ～ざ～めい</label>
		    <input type="text" class="form-control" id="username" name="username">
		  </div>
		  <div class="mb-3">
		    <label for="pass" class="form-label">ぱすわ～ど</label>
		    <input type="password" class="form-control" id="pass" name="password">
		  </div>
		  <button type="submit" class="btn btn-primary">ろぐいん</button>
		</form>
	</div>
</body>
</html>