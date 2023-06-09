<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>

<link rel="stylesheet" href="/BtwoB/css/header.css">
<link rel="stylesheet" href="/BtwoB/css/mur_in.css">
<!-- <script src="js/header.js"> -->
</head>
<body>

<!--ヘッダーここから-->
<header>
	<nav class="navbar">

	<!-- まめぇまめぇのロゴ画像 -->
	<div class="logo">
		<a href="/BtwoB/TopServlet"><img src="/BtwoB/img/logo.png" alt="まめぇまめぇ" ></a>
	</div>
	<nav class="right-align">
		<ul class="menu">

			<!-- ハンバーガーメニューアイコン -->
			<li class="hamburger-icon">
		<div class="hamburger-menu">
			<div class="line"></div>
			<div class="line"></div>
			<div class="line"></div>
		</div>
			<ul class="dropdown-menu left-align">
				<li><a href="TopServlet">　トップ</a></li>
				<li><a href="MurListServlet">愚痴一覧</a></li>
				<li><a href="MurInServlet">愚痴入力</a></li>
				<li><a href="GameCheckServlet">ゲーム選択/チェックボックス</a></li>
			</ul>
			</li>
		<!-- ユーザ名表示 -->
		<li><a href="" class="right-align no-underline">${id_name.user_name}</a></li>

		<!-- 称号アイコン -->
		<li class="title-icon">
			<a href="#" class="title-icon-link">
				<img src="/BtwoB/img/crown_login_bronze.png" alt="デフォルトの称号アイコン" class="selected-title" id="selectedTitle">
			</a>
			<ul class="dropdown-menu">
			<li>
				<div class="grid-container">
				<a href="#" onclick="changeTitleIcon('/BtwoB/img/crown_login_gold.png')"><img src="/BtwoB/img/crown_login_gold.png" alt="称号1"></a>
				<a href="#" onclick="changeTitleIcon('/BtwoB/img/crown_login_silver.png')"><img src="/BtwoB/img/crown_login_silver.png" alt="称号2"></a>
				<a href="#" onclick="changeTitleIcon('/BtwoB/img/crown_login_bronze.png')"><img src="/BtwoB/img/crown_login_bronze.png" alt="称号3"></a>
				<a href="#" onclick="changeTitleIcon('/BtwoB/img/crown_mur_gold.png')"><img src="/BtwoB/img/crown_mur_gold.png" alt="称号4"></a>
				<a href="#" onclick="changeTitleIcon('/BtwoB/img/crown_mur_silver.png')"><img src="/BtwoB/img/crown_mur_silver.png" alt="称号5"></a>
				<a href="#" onclick="changeTitleIcon('/BtwoB/img/crown_mur_bronze.png')"><img src="/BtwoB/img/crown_mur_bronze.png" alt="称号6"></a>
				<a href="#" onclick="changeTitleIcon('/BtwoB/img/crown_game_gold.png')"><img src="/BtwoB/img/crown_game_gold.png" alt="称号7"></a>
				<a href="#" onclick="changeTitleIcon('/BtwoB/img/crown_game_silver.png')"><img src="/BtwoB/img/crown_game_silver.png" alt="称号8"></a>
				<a href="#" onclick="changeTitleIcon('/BtwoB/img/crown_game_bronze.png')"><img src="/BtwoB/img/crown_game_bronze.png" alt="称号9"></a>
				</div>
			</li>
			</ul>
		</li>
			<!-- ログアウト(ログイン画面に遷移) -->
			<li><a href="LogoutServlet" class="right-align no-underline">ろぐあうと</a></li>
		</ul>
	</nav>
	</nav>
</header>
<!-- ヘッダーここまで -->

<div class="container">
<!-- タグのプルダウンメニュー -->
<form method="POST" action="/BtwoB/MurInServlet">
<div class="mur_in" style="margin-top: 20px;">
<label class="tag_menu">
<p>入力　　</p>
	<select name="TAG">
		<option>仕事</option>
		<option>友達</option>
		<option>家族</option>
		<option>恋愛</option>
		<option>自分</option>
		<option>その他</option>
	</select>
</label><br>

<!-- テキストエリア -->
<div id="myForm">
	<textarea name="MURMUR" id="nyuryokuarea"></textarea><br>

	<!-- 戻るボタンと入力完了ボタン -->
	<input type="submit" value="戻る" class="btn btn--orange" name="SUBMIT">
	<input type="submit" value="入力完了" class="btn btn--orange" name="SUBMIT">
<br>
	<!-- 愚痴が未入力だった時のエラーメッセージ -->
	<span class="error-message">${errorMessage}</span>
	<%-- <c:out value="${errorMessage}"></c:out> --%>

</div>

</div>
</form>

<script src="js/mur_in.js"></script>
<!-- <script src="js/header.js"></script> -->
<footer>
    <!-- フッターコンテンツ -->
  </footer>
</div>
</body>

<script>
// ヘッダー部分のjs
//JavaScriptでドロップダウンメニューの動作を制御
const hamburgerIcon = document.querySelector('.hamburger-icon');
const titleIcon = document.querySelector('.title-icon');
const hamburgerMenu = document.querySelector('.hamburger-menu');
const titleMenu = document.querySelector('.title-menu');
const hamburgerDropdown = document.querySelector('.hamburger-icon .dropdown-menu');
const titleDropdown = document.querySelector('.title-icon .dropdown-menu');

// ハンバーガーメニューアイコンにカーソルを合わせた時の動作
hamburgerIcon.addEventListener('mouseenter', () => {
 	hamburgerDropdown.classList.add('show');
});

// ハンバーガーメニューアイコンからカーソルが離れた時の動作
hamburgerIcon.addEventListener('mouseleave', () => {
 	hamburgerDropdown.classList.remove('show');
});

// ドロップダウンメニューから画像を選んでクリックすると、タイトルアイコンが変更されます
function changeTitleIcon(iconPath) {
 	const selectedTitle = document.getElementById('selectedTitle');
 	selectedTitle.src = iconPath;
}

// 称号マークのハンバーガーメニューにカーソルを合わせた時の動作
titleIcon.addEventListener('mouseenter', () => {
 	titleDropdown.classList.add('show');
});


// 称号マークのハンバーガーメニューからカーソルが離れた時の動作
titleIcon.addEventListener('mouseleave', () => {
 	titleDropdown.classList.remove('show');
});
</script>
</html>

