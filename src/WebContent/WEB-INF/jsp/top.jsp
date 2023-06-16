<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<link rel="stylesheet" href="css/top.css">
<script src=""></script>

</head>
<body>

<!-- 左右画面のdiv -->
<div class="split">
    <!-- 左画面のdiv -->
    <div class="split-item split-left">
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
            <table>
                <tr><td>タグの種類</td></tr>
                <tr><td>愚痴内容</td></tr>
                <tr><td>タグの種類</td></tr>
                <tr><td>愚痴内容</td></tr>
                <tr><td>タグの種類</td></tr>
                <tr><td>愚痴内容</td></tr>
            </table>

        </div><!--split-left__inner-->
    </div><!--split-item split-left-->

	<!-- 右画面のdiv -->
	<div class="split-item split-right">
		<!-- 右画面の中のdiv -->
		<div class="split-right__inner">

			<!-- 「週間円グラフ」 -->
			<canvas id="weekly_piegraph"></canvas>

			<!-- 画面右下「愚痴一覧表示ボタン」「新規愚痴入力ボタン」-->
			<input type="image" src="/BtwoB/img/murlist_button.png" onclick="/BtwoB/MurListServlet" value="愚痴一覧表示" name="murlist_button">
			<input type="image" src="/BtwoB/img/murinput_button.png" onclick="/BtwoB/MurInServlet" value="新規入力" name="murinput_button">


		</div><!-- split-right__inner -->
	</div><!-- split-item split-right -->
</div><!--split-->
</body>
</html>