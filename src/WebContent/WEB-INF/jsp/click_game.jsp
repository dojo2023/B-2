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
<img id="image_file" src = "/BtwoB/img/earth_image1.png" width = "525" height ="525" onclick="henkou()" onclick="audio()"></p>

<audio id="btn_audio">
    <source src="/BtwoB/img/bakuhatu1.mp3" type="audio/mp3">
</audio>

<script>
var img_src = new Array("/BtwoB/img/earth_image1.png","/BtwoB/img/earth_image2.png","/BtwoB/img/earth_image3.png","/BtwoB/img/earth_image4.png");
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

function audio() {
    document.getElementById('btn_audio').currentTime = 0; //連続クリックに対応
    document.getElementById('btn_audio').play(); //クリックしたら音を再生
}

</script>
</body>
</html>