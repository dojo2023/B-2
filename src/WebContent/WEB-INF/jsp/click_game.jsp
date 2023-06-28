<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<link rel="stylesheet" href="css/click_space_game.css">
<link rel="stylesheet" href="css/game_modal.css">
<script src="click_space_game.js"></script>
</head>

<body>


<!-- タイトル -->
<h1 class = earth_clickgame_title style="margin-bottom:1px">クリック破壊ゲーム</h1>

<!-- 地球画像１ -->
<p class = "earth_image1" style="margin-top:1px">
<img id="image_file" src = "/BtwoB/img/earth_image1.png" width = "525" height ="525" onclick="henkou()" ></p>

<!-- ボタン -->
<!-- <div align="right" class="example-r">
 <button id="save">削除</button>
 </div> -->

</body>
<!-- モーダルここから -->
<button class="button js-modal-button">地球が破壊されました！</button>
<div class="layer js-modal">
	<div class="modal">
		<div class="modal__inner">
			<div class="modal__button-wrap">
			<!-- <button class="close-button js-close-button"> -->
			<span></span>
			<span></span>
			<!-- </button> -->
			</div>
			<div class="modal__contents">
				<div class="modal__content">
				もう一回やる？ <br>
				<form id="myForm" method="POST" action="/BtwoB/ClickGameServlet">
					<!-- フォームの入力フィールドなど -->
					<input type="submit" class="yes_button" name="SUBMIT" value="はい">
					<input type="submit" class="no_button" name="SUBMIT" value="いいえ">
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- モーダルここまで -->
<div id="saveResult"></div>

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

/* document.getElementById("save").onclick = function() {
	  let checkSaveFlg = window.confirm('削除を実行してもよろしいですか？');

	  if(checkSaveFlg) {
	    document.getElementById("saveResult").textContent = "削除を実行しました。";
	  } else {
	    document.getElementById("saveResult").textContent = "削除をキャンセルしました。";
	  }
	};
 */

	/* モーダルJSここから */
	const modal = document.querySelector('.js-modal');
	const modalButton = document.querySelector('.js-modal-button');


  const modalClose = document.querySelector('.js-close-button');

  modalButton.addEventListener('click', () => {
    modal.classList.add('is-open');

  });

  modalClose.addEventListener('click', () => {
    modal.classList.remove('is-open');

  });

  function submitForm(action) {
	  var form = document.getElementById("myForm");
	  form.action = action;
	  form.submit();
	}
/* モーダルJSここまで */
</script>

</html>