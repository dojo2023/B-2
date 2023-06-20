<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<link rel="stylesheet" href="css/scroll_graph.css">
<link rel="stylesheet" href="css/mur_list.css">
<script src="mur_list.js"></script>
</head>
<body>
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

            <h1>一覧</h1>
            <%-- <c:forEach var="e" items="${murList}" >
            <form method="GET" action="/BtwoB/GameCheckServlet">
            <table>
                <tr><td>tag</td><td><input type="text" name="TAG" value="${e.tag}"></td></tr>
                <tr><td>murmurs</td><td><input type="text" name="MURMUR" value="${e.murmur}"></td></tr>
            </table> --%>
            <!-- 「表示方法プルダウンメニュー」 -->
         	<label class="sortmenu">
  			<select>
			<option value="new">新しい順</option>
			<option value="old">古い順</option>
			<option value="tag">タグ順</option>
			</select>
			</label><!--sortmenu" -->
			<!-- ここに愚痴一覧のテーブル -->
			<table class="mur_list">
			<tr>
			<td>
			<table class="tagmurmur">
                <tr style="width: 100px"><td class="tag">その他</td></tr>
                <tr><td class="blank"></td></tr>
                <tr><td class="murmur">暑すぎて無理。気温ちょうどいい世界になれ。</td></tr>
            </table><!-- tagmurmur -->
            </td>
            <td>
            <table class="delete_button">
            	<tr><td><input type="submit" name="SUBMIT" value="消去"></td></tr>
            </table><!-- delete_button -->
            </td>
            </tr>
            </table><!-- mur_list -->

        </div><!--split-left__inner-->
    </div><!--split-item split-left-->

	<!-- 右画面のdiv -->
	<div class="split-item split-right">
		<!-- 右画面の中のdiv -->
		<div class="split-right__inner">

		<!-- 「一覧円グラフ」 -->
		<canvas id="total_piegraph"></canvas>

		</div><!-- split-right__inner -->
	</div><!-- split-item split-right -->
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

//ハンバーガーメニューアイコンにカーソルを合わせた時の動作
hamburgerIcon.addEventListener('mouseenter', () => {
hamburgerDropdown.classList.add('show');
});

//ハンバーガーメニューアイコンからカーソルが離れた時の動作
hamburgerIcon.addEventListener('mouseleave', () => {
hamburgerDropdown.classList.remove('show');
});

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