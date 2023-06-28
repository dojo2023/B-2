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
       <div class="demo1">【手紙をドラッグしてヤギに食べてもらいましょう♪】</div>
<div id="app">
    <img src="https://1.bp.blogspot.com/-QFrT5TR3PMI/XQjt8VWsUAI/AAAAAAABTOA/t9SkJ5C1_mEE7Fv4Ia0EVImkEfIO36vTQCLcBGAs/s300/bunbougu_envelope_ura.png" id="ball"align="left"width="400" height="300"><br>

    <img src="https://3.bp.blogspot.com/-FKXvovCjmvY/Vycei0kkSeI/AAAAAAAA6VE/iQJMhrASMjYO4bYnIyxOMiQBurk9MiACgCLcB/s180-c/tegami_yagi.png" id="yagi"align="right"width="200" height="200"><br>

</div>

<div>

 <img src="https://4.bp.blogspot.com/-GJasGyRK6jQ/WdyD-2252gI/AAAAAAABHhU/o_h6FVCJQkIs8s8v4QXdrD0KKxOC-2J0ACLcBGAs/s180-c/tegami_yagi_black.png" align="right"width="200" height="200"><br>

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