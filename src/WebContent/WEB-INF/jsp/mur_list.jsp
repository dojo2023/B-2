<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<link rel="stylesheet" href="/BtwoB/css/header.css">
<link rel="stylesheet" href="css/scroll_graph.css">
<link rel="stylesheet" href="css/mur_list.css">
<link rel="stylesheet" href="/BtwoB/css/popup.css">
<link rel="stylesheet" href="css/top.css">
<script src="mur_list.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js "></script>
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
			<li><a href="LoginServlet" class="right-align no-underline">ろぐあうと</a></li>
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

            <h1>いちらん</h1>
            <%-- <c:forEach var="e" items="${murList}" >
            <form method="GET" action="/BtwoB/GameCheckServlet">
            <table>
                <tr><td>tag</td><td><input type="text" name="TAG" value="${e.tag}"></td></tr>
                <tr><td>murmurs</td><td><input type="text" name="MURMUR" value="${e.murmur}"></td></tr>
            </table> --%>
            <form method="POST" action="/BtwoB/MurListServlet">
            <!-- 「表示方法プルダウンメニュー」 -->
         	<label class="sortmenu">
  			<select name="ORDER">
  				<option>古い順</option>
				<option>新しい順</option>
				<option>タグ</option>
			</select>
			</label><!--sortmenu" -->
			<input type="submit" name="SUBMIT" value="決定">
			</form>
			<!-- ここに愚痴一覧のテーブル -->
			<!-- <table class="mur_list">
			<tr>
			<td>
			<table class="tagmurmur">
                <tr style="width: 100px"><td class="tag">その他</td></tr>
                <tr><td class="blank"></td></tr>
                <tr><td class="murmur">暑すぎて無理。気温ちょうどいい世界になれ。</td></tr>
            </table>tagmurmur
            </td>
            <td>
            <table class="delete_button">
            	<tr><td><input type="submit" name="SUBMIT" value="削除"></td></tr>
            </table>delete_button
            </td>
            </tr>
            </table> --><!-- mur_list -->

			<!-- 6/20佐野　変更点
			・データベースの情報を参照してlist表示した
			・削除ボタンをmurmurの横に表示した
			 -->


			<table class="mur_list">
			<tr>
			<td>


			<c:forEach var="e" items="${cardList}" >
			<form method="POST" action="/BtwoB/MurListServlet">
			<table class="tagmurmur">

				<tr><td><input type="hidden" name="ID" value="${e.id}"></td></tr>
				<tr><td><input type="hidden" name="USER_ID" value="${e.user_id}"></td></tr>
				<tr style="width: 100px"><td class="tag">${e.tag}</td></tr>
				<tr><td class="murmur">${e.murmur}</td>
				<td class="delete_button">
				<input class="delete_button" type="submit" name="SUBMIT" value="削除"></td></tr>
				<tr><td><input type="hidden" name="MURMUR_CHECK" value="${e.murmur_check}"></td></tr>
				<tr><td><input type="hidden" name="MURMUR_DELETE" value="${e.murmur_delete}"></td></tr>
				<tr><td><input type="hidden" name="CREATED_AT" value="${e.created_at}"></td></tr>
				<tr><td><input type="hidden" name="UPDATE_AT" value="${e.update_at}"></td></tr>

			</table>
			</form>
			</c:forEach>

			<!-- pagetop遷移用 -->
			<p id="page-top"><a href="#"><span>うえにもどる</span></a></p>
			<!-- <input id="page-top"><a href="#"><span>Page Top</span></a> -->

			</td>
            <td>
            <table class="delete_button">
            	<!-- <tr><td><input type="submit" name="SUBMIT" value="削除"></td></tr> -->
            </table>
            </td>
            </tr>
            </table><!-- mur_list -->



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



		</div><!-- split-right__inner -->
	</div><!-- split-item split-right -->
</div><!--split-->

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
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="js/page_top.js"></script>

</body>

<input type="hidden" id ="mur_count" name="mur_count" value="${mur_count}">
<input type="hidden" id ="murList_count" name="murList_count" value="${murList_count}">

<!-- 愚痴たまってませんかポップアップここから -->
<input type="checkbox" id="pop-up">
<div class="overlay">
	<div class="window">
		<label class="close" for="pop-up">×</label>
		<p class="text">愚痴が溜まっています。<br> 発散しませんか？<br></p>
<!-- 		<form id="myForm">
	  		フォームの入力フィールドなど
			<button type="button" class="yes_button" onclick="submitForm('GameCheckServlet')">はい</button>
	  		<button type="button" class="no_button" onclick="submitForm('MurListServlet')">いいえ</button>
		</form> -->


		<form id="myForm" method="POST" action="/BtwoB/ClickGameServlet">
			<input type="submit" class="yes_button" name="SUBMIT" value="はい">
			<!-- <input type="submit" class="no_button" name="SUBMIT" value="いいえ"> -->
		</form>
	</div>
</div>

	<%-- <c:if test="${showPopup}"> --%>
<script>
const mur_count = document.getElementById("mur_count").value;
const murList_count = document.getElementById("murList_count").value;
if(mur_count >= 10 && murList_count == 1){
	document.getElementById("pop-up").checked=true ;
};

   /* document.addEventListener("DOMContentLoaded", function() {
     document.getElementById("pop-up").checked = true;
   }); */
   /* function submitForm(action) {
 	  var form = document.getElementById("myForm");
 	  form.action = action;
 	  form.submit();
 	} */
</script>
  	<%-- </c:if> --%>

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


</script>

</html>