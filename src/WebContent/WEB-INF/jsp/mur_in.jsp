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
<!--ヘッダーここから-->
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

    <script src="script.js"></script>

<hr>
</body>

</html>