<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/scroll_graph.css">
<link rel="stylesheet" href="/BtwoB/css/popup.css">
<link rel="stylesheet" href="css/top.css">
<script src=""></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
</head>
<body>
<!--ヘッダーここから-->
<header>
	<nav class="navbar">

	<!-- まめぇまめぇのロゴ画像 -->
	<div class="logo">
		<img src="logo.png" alt="ロゴ">
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
<div class="split">
    <!-- 左画面のdiv -->
    <div class="split-left">
        <!-- 左画面の中のdiv -->
        <div class="split-left__inner">
        <!-- ここに愚痴一覧のテーブル -->
            <h1>トップ</h1>
            <%-- <c:forEach var="e" items="${murList}" >
            <form method="GET" action="/BtwoB/GameCheckServlet">
            <table>
                <tr><td>tag</td><td><input type="text" name="TAG" value="${e.tag}"></td></tr>
                <tr><td>murmurs</td><td><input type="text" name="MURMUR" value="${e.murmur}"></td></tr>
            </table> --%>
            <table class="tagmurmur">
                <tr style="width: 100px"><td class="tag">その他</td></tr>
                <tr><td class="blank"></td></tr>
                <tr><td class="murmur">暑すぎて無理。気温ちょうどいい世界になれ</td></tr>
            </table>

            <!-- 6/20佐野　変更点
			・データベースの情報を参照してlist表示した
			 -->
            <c:forEach var="e" items="${cardList}" >
			<form method="GET" action="/BtwoB/TopServlet">
			<table class="tagmurmur">
			<!--
				・もしmurmur_checkがtrueだったら
				・(もしmurmur_deleteがtrueだったら)これいらないかも
				・もしセッションスコープに保存されてるuser_idと同じだったら
				・もしcreated_atの時間が現在から見て1週間以内だったら
				を追加する必要あり
			-->
			<c:if test = "${MURMUR_CHECK == TRUE}">
				<tr><td><input type="hidden" name="ID" value="${e.id}"></td></tr>
				<tr><td><input type="hidden" name="USER_ID" value="${e.user_id}"></td></tr>
				<tr style="width: 100px"><td class="tag"><input type="text" name="TAG" value="${e.tag}"></td></tr>
				<tr><td class="murmur"><input type="text" name="MURMUR" value="${e.murmur}"></td></tr>
				<tr><td><input type="hidden" name="MURMUR_CHECK" value="${e.murmur_check}"></td></tr>
				<tr><td><input type="hidden" name="MURMUR_DELETE" value="${e.murmur_delete}"></td></tr>
				<tr><td><input type="hidden" name="CREATED_AT" value="${e.created_at}"></td></tr>
				<tr><td><input type="hidden" name="UPDATE_AT" value="${e.update_at}"></td></tr>
			</c:if>
			</table>
			</form>
			</c:forEach>

        </div><!--split-left__inner-->
    </div><!--split-item split-left-->

	<!-- 右画面のdiv -->
	<div class="split-right">
	<!-- 「週間円グラフ」 -->

			<div class="weekly_piegraph" style="position:relative;width:450px;height:450px;margin: auto;text-align:center;">
			<canvas id="Chart"></canvas>
			</div>
		<!-- 右画面の中のdiv -->
		<div class="split-right__inner">
			<!-- 画面右下「愚痴一覧表示ボタン」「新規愚痴入力ボタン」-->
			<a href="MurListServlet"><input type="image" src="/BtwoB/img/murlist_button.png" onclick="/BtwoB/MurListServlet" value="愚痴一覧表示" name="murlist_button"></a>
			<a href="MurInServlet"><input type="image" src="/BtwoB/img/murinput_button.png" onclick="/BtwoB/MurInServlet" value="新規入力" name="murinput_button"></a>


		</div><!-- split-right__inner -->
	</div><!-- split-item split-right -->
</div><!--split-->
<!-- 愚痴グラフのデータ取得 -->
<!-- <script src="js/graph.js"> -->
<script>
labelsData = [
	<c:forEach var="e" items="${tagPersentList}">
	'${e.tag}',
	</c:forEach>
];

datesValue = [
	<c:forEach var="e" items="${tagPersentList}">
	'${e.percentage_of_orders}',
	</c:forEach>
];

</script>
<script src="js/graph.js"></script>
</body>

<!-- ポップアップ -->
<input type="checkbox" id="pop-up">
<div class="overlay">
	<div class="window">
		<label class="close" for="pop-up">×</label>
		<%-- <c:out><p class="text" value="${eyecatch}"></p></c:out> --%>
		<c:out value="${eyecatch}"></c:out>
		<%-- <c:if test="${not empty showPopup}">

		</c:if> --%>
	</div>
</div>
<script>
	document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("pop-up").checked = true;
    });
</script>

<!-- ポップアップここまで -->

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



//愚痴入力のjs
//戻るボタンと入力完了ボタンをクリックしたときの処理
document.addEventListener("DOMContentLoaded", function() {
		var backButton = document.querySelector(".back_button");
		var endButton = document.querySelector(".murmur_end_button");
		var errorMessage = document.querySelector("#error_message");

		backButton.addEventListener("click", function() {
		// 戻るボタンがクリックされた時の処理（画面遷移など）
		console.log("戻るボタンがクリックされました");
		window.location.href = "TopServlet";
		});

		endButton.addEventListener("click", function() {
		var murmurText = document.querySelector("textarea[name='murmur_text']").value;

		if (murmurText.trim() !== "") {
		// 入力完了ボタンがクリックされ、内容が入力されている場合の処理（画面遷移など）
			console.log("入力完了ボタンがクリックされました");
			window.location.href = "TopServlet";
		}
		else {
			// 入力完了ボタンがクリックされ、内容が未入力の場合の処理
			errorMessage.style.display = "block";
		}
		});
});




</script>
</html>