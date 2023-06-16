<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/BtwoB/css/login_regist.css">
<title>まめぇまめぇ</title>
</head>
<body>
	<div class="mx-auto" style="width: 300px;">
		<h1 class="mb-3" style="text-align: center">しんきとうろく</h1>
		<form action="/CustomerManagement/CustomerRegisterServlet" method="post">
		  <div class="mb-3">
		    <label for="customerName" class="form-label">ゆ～ざ～メェ</label>
		    <input type="text" class="form-control" id="userName" name="username" required>
		  </div>
		  <div class="mb-3">
		    <label for="address" class="form-label">ぱすわ～ど</label>
		    <input type="text" class="form-control" id="pass" name="password" required>
		  </div>
		  <button type="submit" class="btn btn-primary">とうろくする</button> <button type="submit" class="btn btn-primary">りせっと</button>
		</form>
	<a href="/BtwoB/LoginServlet">ろぐいんぺーじにもどる</a>
	</div>
</body>
</html>