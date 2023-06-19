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



<hr>
<!-- ヘッダーここまで -->

<!-- タグのプルダウンメニュー -->
<div class="mur_in">
<label class="tag_menu">
<p>入力　　</p>
	<select>
        <option>仕事</option>
        <option>友達</option>
        <option>家族</option>
        <option>恋愛</option>
        <option>自分</option>
        <option>その他</option>
    </select>
</label><br>
<!-- テキストエリア -->
<form id="myForm">
  <textarea name="murmur_text" id="nyuryokuarea"></textarea><br>
  <input type="button" value="戻る" class="back_button">
  <input type="button" value="入力完了" class="murmur_end_button">
  <p id="error_message" style="color: red; display: none;">愚痴を入力してください。</p>
</form>

</div>

</body>
<script>
// 戻るボタンと入力完了ボタンをクリックしたときの処理
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
	    } else {
	      // 入力完了ボタンがクリックされ、内容が未入力の場合の処理
	      errorMessage.style.display = "block";
	    }
	  });
	});


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

