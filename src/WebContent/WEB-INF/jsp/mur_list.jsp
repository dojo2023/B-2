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
  <div class="logo">
    <img src="logo.png" alt="ロゴ" class="left-align">
  </div>
  <nav class="right-align">
    <ul class="menu">
      <li class="hamburger-icon">
        <div class="hamburger-menu">
          <div class="line"></div>
          <div class="line"></div>
          <div class="line"></div>
        </div>
        <ul class="dropdown-menu">
          <li><a href="TopServlet">トップ</a></li>
          <li><a href="MurListServlet">愚痴一覧</a></li>
          <li><a href="MurInServlet">愚痴入力</a></li>
          <li><a href="GameCheckServlet">ゲーム選択/チェックボックス</a></li>
        </ul>
      </li>
      <li><a href="" class="right-align">ユーザー名</a></li>
      <li class="title-icon">
        <div class="title-menu">
          <div class="line"></div>
          <div class="line"></div>
          <div class="line"></div>
        </div>
        <ul class="dropdown-menu">
          <li><a href="#"><img src="/BtwoB/img/crown_login_gold.png" alt="称号1"></a></li>
          <li><a href="#"><img src="/BtwoB/img/crown_login_silver.png" alt="称号2"></a></li>
          <li><a href="#"><img src="/BtwoB/img/crown_login_bronze.png" alt="称号3"></a></li>
          <li><a href="#"><img src="/BtwoB/img/crown_mur_gold.png" alt="称号4"></a></li>
          <li><a href="#"><img src="/BtwoB/img/crown_mur_silver.png" alt="称号5"></a></li>
          <li><a href="#"><img src="/BtwoB/img/crown_mur_bronze.png" alt="称号6"></a></li>
          <li><a href="#"><img src="/BtwoB/img/crown_game_gold.png" alt="称号7"></a></li>
          <li><a href="#"><img src="/BtwoB/img/crown_game_silver.png" alt="称号8"></a></li>
          <li><a href="#"><img src="/BtwoB/img/crown_game_bronze.png" alt="称号9"></a></li>
        </ul>
      </li>
      <li><a href="LoginServlet" class="right-align">ログアウト</a></li>
    </ul>
  </nav>
</header>
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

</script>

</html>