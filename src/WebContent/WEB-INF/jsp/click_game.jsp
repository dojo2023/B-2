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