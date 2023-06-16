<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>

<link rel="stylesheet" href="/BtwoB/css/mur_in.css">
</head>
<body>
<script src="mur_in.js"></script>
<!--ヘッダーここから-->
<header>
 <nav class="navbar">
        <div class="hamburger-menu">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
        </div>
        <ul class="menu"><li class="dropdown">
                <a href="#">メニュー</a>
                <ul class="dropdown-menu">
                    <li><a href="TopServlet">トップ</a></li>
                    <li><a href="MurListServlet">愚痴一覧</a></li>
                    <li><a href="MurInServlet">愚痴入力</a></li>
                    <li><a href="GameCheckServlet">ゲーム選択/チェックボックス</a></li>
                </ul>
            </li>
            <li><a href="#">ユーザ名</a></li>
            <li class="dropdown">
                <a href="#">称号</a>
                <ul class="dropdown-menu">
                <li><a href="">ログイン金</a></li>
                <li><a href="">ログイン銀</a></li>
                <li><a href="">ログイン銅</a></li>
                <li><a href="">愚痴件数金</a></li>
                <li><a href="">愚痴件数銀</a></li>
                <li><a href="">愚痴件数銅</a></li>
                <li><a href="">ゲーム金</a></li>
                <li><a href="">ゲーム銀</a></li>
                <li><a href="">ゲーム銅</a></li>
                </ul>
            </li>
            <li><a href="LoginServlet">ログアウト</a></li>
        </ul>
    </nav>


</header>
<hr>
<div class="mur_in">
入力　　<div class="dropdown">
        <button class="dropdown-button">プルダウンメニュー</button>
        <ul class="dropdown-menu">
            <li><a href="#">仕事</a></li>
            <li><a href="#">友達</a></li>
            <li><a href="#">家族</a></li>
            <li><a href="#">恋愛</a></li>
            <li><a href="#">自分</a></li>
            <li><a href="#">その他</a></li>
        </ul>
    </div><br>
<textarea name="murmur_text"></textarea><br>
<input type="submit" value="戻る" class="back_button">
<input type="submit" value="完了" class="murmur_end_button">
<div id="error-message"></div>

</div>

</body>

</html>

