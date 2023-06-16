<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>まめぇまめぇ</title>
</head>
<body>
	<div class="mx-auto" style="width: 300px;">
		<h1 class="mb-3" style="text-align: center">しんきとうろく</h1>
		<form action="/CustomerManagement/CustomerRegisterServlet" method="post">
		  <div class="mb-3">
		    <label for="customerName" class="form-label">ゆ～ざ～めい</label>
		    <input type="text" class="form-control" id="userName" name="username" required>
		  </div>
		  <div class="mb-3">
		    <label for="address" class="form-label">ぱすわ～ど</label>
		    <input type="text" class="form-control" id="pass" name="password" required>
		  </div>
		  <button type="submit" class="btn btn-primary">とうろくする</button>
		</form>
		<a href="#" onclick="window.history.back(); return false;" class="btn btn-primary mt-3">ろぐいんぺーじへもどる</a>
	</div>
</body>
</html>