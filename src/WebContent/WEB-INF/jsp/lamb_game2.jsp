<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<script src="lamb_game2.js"></script>
<link rel="stylesheet" href="css/lamb_game2.css">
<link rel="stylesheet" href="css/game_modal.css">
</head>
<body>
<div id="app">
    <img src="https://4.bp.blogspot.com/-piPWJlRYOIo/UUhH7Pfy1rI/AAAAAAAAO5k/4JfvOTxND24/s400/mail.png" id="ball"align="left"width="500" height="500"><br>

    <img src="https://4.bp.blogspot.com/-O_6mCoV6Ffk/VveIznoHZDI/AAAAAAAA5N4/8DpXpRHEpa42Zq2kiHAZv91bqWXGMIMXg/s400/animal_yagi.png" id="yagi"align="right"width="200" height="200"><br>
</div>



  <script>
  var ball = document.getElementById("ball");
  ball.onmousedown = function(event){
    console.log("タップされたよ!");
  }
  ball.style.position = "absolute";

  ball.onmousedown = function(event){
	  document.addEventListener("mousemove",onMouseMove);
	}

	var onMouseMove = function(event){
	  var x = event.clientX;
	  var y = event.clientY;
	  var width = ball.offsetWidth;
	  var height = ball.offsetHeight;
	  ball.style.top = (y-height/2) + "px";
	  ball.style.left = (x-width/2) + "px";
	}

	ball.onmouseup = function(event){
		  var x = event.clientX;
		  var y = event.clientY;
		  var width = ball.offsetWidth;
		  var height = ball.offsetHeight;
		  var yagiRect = yagi.getBoundingClientRect();
		  if((x>=yagiRect.left && x<=(yagiRect.left+yagiRect.width)) && (y>=yagiRect.top && y<=(yagiRect.top+yagiRect.height))){
		    var app = document.getElementById("app");
		    app.removeChild(ball);
		  }
		  document.removeEventListener("mousemove",onMouseMove);
		}

  </script>

</body>
<!-- モーダルここから -->
<button class="button js-modal-button">ごちそうさまでした！</button>
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
				<form id="myForm">
					<!-- フォームの入力フィールドなど -->
					<button type="button" class="yes_button" onclick="submitForm('GameCheckServlet')">はい</button>
					<button type="button" class="no_button" onclick="submitForm('TopServlet')">いいえ</button>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- モーダルここまで -->

 <script type="text/javascript">

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