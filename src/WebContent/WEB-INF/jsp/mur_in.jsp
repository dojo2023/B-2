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
<header>
    <nav id="nav">
      <ul>
        <li><a href="#">トップ</a></li>
        <li><a href="#">愚痴一覧</a></li>
        <li><a href="#">愚痴入力</a></li>
        <li><a href="#">ゲーム選択/チェックボックス</a></li>
      </ul>
    </nav>
    <div id="hamburger">
      <span class="inner_line" id="line1"></span>
      <span class="inner_line" id="line2"></span>
      <span class="inner_line" id="line3"></span>
      <span class="inner_line" id="line4"></span>
    </div>
    <h2>ham</h2>
  </header>

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
function hamburger() {
	  document.getElementById('line1').classList.toggle('line_1');
	  document.getElementById('line2').classList.toggle('line_2');
	  document.getElementById('line3').classList.toggle('line_3');
	  document.getElementById('line4').classList.toggle('line_4');
	  document.getElementById('nav').classList.toggle('in');
	}
	document.getElementById('hamburger').addEventListener('click' , function () {
	  hamburger();
	} );
</script>
</html>