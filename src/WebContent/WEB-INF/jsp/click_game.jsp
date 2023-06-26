<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<link rel="stylesheet" href="css/click_space_game.css">
<script src="click_space_game.js"></script>
</head>

<body>
<div class="star-wars-intro">

  <!-- Blue Intro Text -->
  <p class="intro-text">
    A few days ago, during...
  </p>

  <!-- Logo Image or Text goes in here -->
  <h2 class="main-logo">
    <img src="img/star-wars-intro.png">
  </h2>

  <!-- All Scrolling Content Goes in here -->
  <div class="main-content">

    <div class="title-content">
      <p class="content-header">EPISODES IV-VI<br/>A Movie Marathon</p>

      <br>

      <p class="content-body">
        After years of galactic silence, civilization is on the brink of a new Star Wars release. Now, with the Force preparing to awaken, the people of Earth seek solace in films of old. With nowhere to turn, they gather in great numbers and watch the original trilogy without rest. Three films. 6 hours. 24 minutes. Popcorn. Slushies. Total elation.
      </p>

      <!-- button or link or whatever -->
      <a href="./StarScroll.zip" class="space-button">Download The Code Now!</a>

    </div>
  </div>
</div>

<!-- タイトル -->
<h1 class = earth_clickgame_title style="margin-bottom:1px">クリック破壊ゲーム</h1>

<!-- 地球画像１ -->
<p class = "earth_image1" style="margin-top:1px">
<img id="image_file" src = "/BtwoB/img/earth_image1.png" width = "525" height ="525" onclick="henkou()" ></p>

<!-- ボタン -->
<div align="right" class="example-r">
 <button id="save">削除</button>
 </div>
  <div id="saveResult"></div>

<script>
var img_src = new Array("/BtwoB/img/earth_image1.png","/BtwoB/img/earth_image2.png","/BtwoB/img/earth_image3.png","/BtwoB/img/earth_image4.png","button_1");
var i = 0;

function henkou() {
	document.getElementById("image_file").innerHTML = ++i;
	if (i == 18) {
		document.getElementById("image_file").src = "/BtwoB/img/earth_image2.png";
		} else if (i == 34) {
		document.getElementById("image_file").src = "/BtwoB/img/earth_image3.png";
		} else if (i == 50) {
		document.getElementById("image_file").src = "/BtwoB/img/earth_image4.png";
		}
		}

document.getElementById("save").onclick = function() {
	  let checkSaveFlg = window.confirm('削除を実行してもよろしいですか？');

	  if(checkSaveFlg) {
	    document.getElementById("saveResult").textContent = "削除を実行しました。";
	  } else {
	    document.getElementById("saveResult").textContent = "削除をキャンセルしました。";
	  }
	};

</script>
</body>
</html>