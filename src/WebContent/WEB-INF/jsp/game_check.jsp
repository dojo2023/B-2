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
<h1>あいうえお</h1>

<!-- 左右画面のdiv -->
<div class="split">
	<!-- 左画面のdiv -->
    <div class="split-item split-left">
    	<!-- 左画面の中のdiv -->
        <div class="split-left__inner">
        <!-- ここに愚痴一覧のテーブル -->
            <p>チェックボックス</p>

            <!-- 愚痴一覧テーブル scroll_graph.css適用-->
           <!--  <table class="tagmurmur">
                <tr style="width: 100px"><td class="tag">その他</td></tr>
                <tr><td class="blank"></td></tr>
                <tr><td class="murmur">暑すぎて無理。気温ちょうどいい世界になれ</td></tr>
            </table> -->

			<c:forEach var="e" items="${cardList}" >
			<form method="GET" action="/BtwoB/GameCheckServlet">
			<table>
			<!-- もしチェックがtrueだったら、もしセッションスコープに保存されてるuser_idと同じだったら -->
			<c:if test = "${MURMUR_CHECK == TRUE}">
				<tr><td>id</td><td><input type="text" name="ID" value="${e.id}"></td></tr>
				<tr><td>user_id</td><td><input type="text" name="USER_ID" value="${e.user_id}"></td></tr>
				<tr><td>tag</td><td><input type="text" name="TAG" value="${e.tag}"></td></tr>
				<tr><td>murmur</td><td><input type="text" name="MURMUR" value="${e.murmur}"></td></tr>
				<tr><td>murmur_check</td><td><input type="text" name="MURMUR_CHECK" value="${e.murmur_check}"></td></tr>
				<tr><td>created_at</td><td><input type="text" name="CREATED_AT" value="${e.created_at}"></td></tr>
				<tr><td>update_at</td><td><input type="text" name="UPDATE_AT" value="${e.update_at}"></td></tr>
			</c:if>
			</table>
			</form>
			</c:forEach>
        </div><!--split-left__inner-->
    </div><!--split-item split-left-->
    <!-- 右画面のdiv -->
    <div class="split-item split-right">
    	<!-- 左画面の中のdiv -->
        <div class="split-right__inner">
        	<p>ゲーム選択</p>
            <!-- ボタン４つ設置 -->
            <table>
            	<tr><td><input type="button" name="CLICKGAME_BUTTON" value="クリック破壊ゲーム"></td>
            		<td><input type="button" name="SPACEGAME_BUTTON" value="スペースキー連打ゲーム"></td></tr>
            	<tr><td><input type="button" name="NICOGAME_BUTTON" value="文字クリックゲーム"></td>
            		<td><input type="button" name="LAMBGAME_BUTTON" value="ヤギのご飯ゲーム"></td>
			</table>
        </div><!--split-right__inner-->
    </div><!--split-item split-right-->
</div><!--split-->

</body>
</html>