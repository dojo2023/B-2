<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>まめぇまめぇ</title>
<link rel="stylesheet" href="css/scroll_graph.css">
<link rel="stylesheet" href="css/game_check.css">
<link rel="stylesheet" href="css/header.css">
<script src="game_check.js"></script>
<script src="header.js"></script>
</head>
<body>
<!-- <h1>あいうえお</h1> -->
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
		<li><a href="" class="right-align no-underline">ゆ～ざ～メェ　${id_name.user_name}</a></li>

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

<!-- 左右画面のdiv -->
<form method="POST" action="/BtwoB/GameCheckServlet">
<div class="split">
	<!-- 左画面のdiv -->
    <div class="split-left">
    	<!-- 左画面の中のdiv -->
        <div class="split-left__inner">
        <!-- ここに愚痴一覧のテーブル -->
            <p>チェックボックス</p>




			<c:forEach var="e" items="${cardList}" >
			<table class="tagmurmur">
			<!--
				・もしmurmur_checkがtrueだったら〇
				・もしセッションスコープに保存されてるuser_idと同じだったら
				を追加する必要あり
			-->

				<tr><td><input type="hidden" name="ID" value="${e.id}"></td></tr>
				<tr><td><input type="hidden" name="USER_ID" value="${e.user_id}"></td></tr>
				<tr style="width: 100px"><td class="TAG"><input type="text" name="TAG + ${e.id}" value="${e.tag}"></td></tr>
				<tr><td><input type="checkbox" name="checkbox${e.id}"></td>
				<td class="murmur">
				<input type="text" name="MURMUR  + ${e.id}" value="${e.murmur}">
				</td>
				</tr>
				<tr><td><input type="hidden" name="MURMUR_CHECK + ${e.id}" value="${e.murmur_check}"></td></tr>
				<tr><td><input type="hidden" name="MURMUR_DELETE  + ${e.id}" value="${e.murmur_delete}"></td></tr>
				<tr><td><input type="hidden" name="CREATED_AT + ${e.id}" value="${e.created_at}"></td></tr>
				<tr><td><input type="hidden" name="UPDATE_AT + ${e.id}" value="${e.update_at}"></td></tr>

			</table>
			</c:forEach>
			<!-- </form> -->

        </div><!--split-left__inner-->
    </div><!--split-item split-left-->
    <!-- 右画面のdiv -->
    <div class="split-item split-right">
    	<!-- 右画面の中のdiv -->
        <div class="split-right__inner">
        	<p>ゲーム選択</p>
            <!-- ボタン４つ設置 -->
            <!-- <form method="POST" action="/BtwoB/GameCheckServlet"> -->
            <table>
            	<!-- 6/20佐野　button→submitに変更 -->
            	<tr><td><input type="submit" name="submit" value="クリック破壊ゲーム" class="button1"></td>
            		<td><input type="submit" name="submit" value="スペースキー連打ゲーム" class="button2"></td></tr>
            	<tr><td><input type="submit" name="submit" value="文字クリックゲーム" class="button3"></td>
            		<td><input type="submit" name="submit" value="ヤギのご飯ゲーム" class="button4"></td>
			</table>
			<!-- </form> -->
        </div><!--split-right__inner-->
    </div><!--split-item split-right-->
</div><!--split-->
</form>

</body>
<script>
//ヘッダー部分のjs
//JavaScriptでドロップダウンメニューの動作を制御
const hamburgerIcon = document.querySelector('.hamburger-icon');
const titleIcon = document.querySelector('.title-icon');
const hamburgerMenu = document.querySelector('.hamburger-menu');
const titleMenu = document.querySelector('.title-menu');
const hamburgerDropdown = document.querySelector('.hamburger-icon .dropdown-menu');
const titleDropdown = document.querySelector('.title-icon .dropdown-menu');

//ハンバーガーメニューアイコンにカーソルを合わせた時の動作
hamburgerIcon.addEventListener('mouseenter', () => {
	hamburgerDropdown.classList.add('show');
});

//ハンバーガーメニューアイコンからカーソルが離れた時の動作
hamburgerIcon.addEventListener('mouseleave', () => {
	hamburgerDropdown.classList.remove('show');
});

//ドロップダウンメニューから画像を選んでクリックすると、タイトルアイコンが変更されます
function changeTitleIcon(iconPath) {
	const selectedTitle = document.getElementById('selectedTitle');
	selectedTitle.src = iconPath;
}

//称号マークのハンバーガーメニューにカーソルを合わせた時の動作
titleIcon.addEventListener('mouseenter', () => {
	titleDropdown.classList.add('show');
});


//称号マークのハンバーガーメニューからカーソルが離れた時の動作
titleIcon.addEventListener('mouseleave', () => {
	titleDropdown.classList.remove('show');
});

</script>
</html>