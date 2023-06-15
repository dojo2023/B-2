<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
</head>
<body>
<h1>まめぇまめぇ</h1>
<div class="gblnv_box">
<a class="menu-trigger" href="#"> <!-- ←ハンバーガーボタン -->
  <span></span>
  <span></span>
  <span></span>
</a>
<div class="gblnv_block">
  <ul class="gblnv_list"> <!-- ←ハンバーガーボタン内、グローバルメニュー -->
    <li><a href="TopServlet">トップ</a></li>
    <li><a href="MurListServlet">愚痴一覧</a></li>
    <li><a href="MurInServlet">愚痴入力</a></li>
    <li><a href="GameCheckServlet">ゲーム選択/チェックボックス</a></li>
  </ul>
</div>
</div>

	<nav>
	<ul class="nav">
	<li><a href="">ログイン金</a></li>
	<li><a href="">ログイン銀</a></li>
	<li><a href="">ログイン銅</a></li>
	<li><a href="">愚痴件数金</a></li>
	<li><a href="">愚痴件数銀</a></li>
	<li><a href="">愚痴件数銅</a></li>
	<li><a href="">ゲーム金</a></li>
	<li><a href="">ゲーム銀</a></li>
	<li><a href="">ゲーム銅</a></li>
	</ul>
	</nav>
<hr>
</body>
<script type="text/javascript">
'use strict';>
	$(document).ready(function() {
		$(".menu-trigger").click(function () {
			$(this).toggleClass("active");
			$(this).next().toggleClass("onanimation");
			$('ul li').hide();
			$('ul li').each(function(i) {
				$(this).delay(80 * i).fadeIn(500);
    		});
		});
	});
</script>
</html>