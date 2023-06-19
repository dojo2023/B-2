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