<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<script src="lamb_game2.js"></script>
<link rel="stylesheet" href="css/lamb_game2.css">
</head>
<body>
<div id="app">
    <img src="https://4.bp.blogspot.com/-piPWJlRYOIo/UUhH7Pfy1rI/AAAAAAAAO5k/4JfvOTxND24/s400/mail.png" id="ball"align="left"width="500" height="500"><br>

    <img src="/BtwoB/img/Icon_B065_otegami_yagi_700_700.mov" id="yagi"align="right"width="200" height="200"><br>
</div>

<div class="post-btn">
<button onclick="">ごちそうさま！</button>
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
</html>