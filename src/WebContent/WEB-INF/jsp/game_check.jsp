<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/scroll_graph.css">
<link href="css/game_check.css" rel="stylesheet">
<title>まめぇまめぇ</title>
<script src="game_check.js"></script>
</head>
<body>
<!-- <h1>あいうえお</h1> -->
<!--ヘッダーここから-->
<header>
  <nav class="navbar">
    <div class="logo">
      <img src="logo.png" alt="ロゴ">
    </div>
    <nav class="right-align">
      <ul class="menu">
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
        <li><a href="" class="right-align no-underline">ゆ～ざ～メェ</a></li>
        <li class="title-icon">
          <div class="title-menu">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
          </div>
          <ul class="dropdown-menu">
            <li>
              <div class="grid-container">
                <a href="#"><img src="/BtwoB/img/crown_login_gold.png" alt="称号1"></a>
                <a href="#"><img src="/BtwoB/img/crown_login_silver.png" alt="称号2"></a>
                <a href="#"><img src="/BtwoB/img/crown_login_bronze.png" alt="称号3"></a>
                <a href="#"><img src="/BtwoB/img/crown_mur_gold.png" alt="称号4"></a>
                <a href="#"><img src="/BtwoB/img/crown_mur_silver.png" alt="称号5"></a>
                <a href="#"><img src="/BtwoB/img/crown_mur_bronze.png" alt="称号6"></a>
                <a href="#"><img src="/BtwoB/img/crown_game_gold.png" alt="称号7"></a>
                <a href="#"><img src="/BtwoB/img/crown_game_silver.png" alt="称号8"></a>
                <a href="#"><img src="/BtwoB/img/crown_game_bronze.png" alt="称号9"></a>
              </div>
            </li>
          </ul>
        </li>
        <li><a href="LoginServlet" class="right-align no-underline">ろぐあうと</a></li>
      </ul>
    </nav>
  </nav>
</header>





<hr>
<!-- ヘッダーここまで -->

<!-- 左右画面のdiv -->
<div class="split">
	<!-- 左画面のdiv -->
    <div class="split-item split-left">
    	<!-- 左画面の中のdiv -->
        <div class="split-left__inner">
        <!-- ここに愚痴一覧のテーブル -->
            <p>チェックボックス</p>

            <!-- 愚痴一覧テーブル scroll_graph.css適用-->
            <table class="tagmurmur">
                <tr style="width: 100px"><td class="tag">その他</td></tr>
                <tr><td class="blank"></td></tr>
                <tr><td class="murmur">暑すぎて無理。気温ちょうどいい世界になれ</td></tr>
            </table>

			<c:forEach var="e" items="${cardList}" >
			<form method="GET" action="/BtwoB/GameCheckServlet">
			<table class="tagmurmur">
			<!--
				・もしmurmur_checkがtrueだったら
				・(もしmurmur_deleteがtrueだったら)これいらないかも
				・もしセッションスコープに保存されてるuser_idと同じだったら
				を追加する必要あり
			-->
			<c:if test = "${MURMUR_CHECK == TRUE}">

				<!-- 6/20佐野　変更点
				・表示しないid等のtypeをhiddenに変更
				・MURMUR_DELETEを追加（チェックボックスの判定に使用）
				・checkboxを追加、name=checkboxとした
				 -->

				<tr><td><input type="hidden" name="ID" value="${e.id}"></td></tr>
				<tr><td><input type="hidden" name="USER_ID" value="${e.user_id}"></td></tr>
				<tr style="width: 100px"><td class="tag"><input type="text" name="TAG" value="${e.tag}"></td></tr>
				<tr><td><input type="checkbox" name="checkbox"></td><td class="murmur"><input type="text" name="MURMUR" value="${e.murmur}"></td></tr>
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
    <div class="split-item split-right">
    	<!-- 右画面の中のdiv -->
        <div class="split-right__inner">
        	<p>ゲーム選択</p>
            <!-- ボタン４つ設置 -->
            <form method="POST" action="/BtwoB/GameCheckServlet">
            <table>
            	<!-- 6/20佐野　button→submitに変更 -->
            	<tr><td><input type="submit" name="CLICKGAME_BUTTON" value="クリック破壊ゲーム" class="button1"></td>
            		<td><input type="submit" name="SPACEGAME_BUTTON" value="スペースキー連打ゲーム" class="button2"></td></tr>
            	<tr><td><input type="submit" name="NICOGAME_BUTTON" value="文字クリックゲーム" class="button3"></td>
            		<td><input type="submit" name="LAMBGAME_BUTTON" value="ヤギのご飯ゲーム" class="button4"></td>
			</table>
			</form>
        </div><!--split-right__inner-->
    </div><!--split-item split-right-->
</div><!--split-->

</body>
<script>
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