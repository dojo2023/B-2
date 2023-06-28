<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='user-scalable=no,width=device-width,initial-scale=1'>
<title>まめぇまめぇ</title>
<link rel="stylesheet" href="css/click_space_game.css">
<link rel="stylesheet" href="css/game_modal.css">
<script src="click_space_game.js"></script>
</head>

<body>

<!-- タイマー -->
    <div id='main'>
        <div id='display'></div>
        <button id='start'>START</button>
        <button id='reset'>RESET</button>
    </div>
    <div id='lap'></div>

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

<script>
'use strict';
const
    storageName = 'stopWatch_status',
    elem        = {};

let
    startTime  = 0,
    lapTime    = 0,
    lapCount   = 0,
    lapRecords = [];

window.addEventListener('DOMContentLoaded', function() {
    ['start', 'reset', 'display', 'lap'].forEach(function(id) {
        elem[id] = document.getElementById(id)
    });

    // ボタンへのイベントリスナー追加
    const e = window.ontouchstart !== undefined ? 'touchstart' : 'mousedown';
    elem.start.addEventListener(e, clickStart);
    elem.reset.addEventListener(e, clickReset);

    timePrint(0, 0);
    const storage = getStorage();
    // localStorageにデータがあれば状態復元
    if(Object.keys(storage).length > 0) {
        startTime  = storage.startTime;
        lapTime    = storage.lapTime;
        lapRecords = storage.lapRecords;
        // 動作中
        if(startTime > 0) {
            elem.start.textContent = 'STOP';
            elem.reset.textContent = 'LAP';
            countUp();
        }
        // 一時停止中
        else if(startTime < 0) {
            timePrint(-startTime, -lapTime);
        }
        // ラップタイムレコード復元
        if(lapRecords.length > 0) {
            let str = '';
            for(let i in lapRecords) {
                str = '[' + (++lapCount) + '] ' + lapRecords[i] + '<br>' + str;
            }
            elem.lap.innerHTML = str;
        }
    }
});

// START/STOPボタン押下
function clickStart() {
    const now = Date.now();
    // 停止時
    if(startTime <= 0) {
        // 計測開始
        startTime += now;
        lapTime   += now;
        countUp();
        elem.start.textContent = 'STOP';
        elem.reset.textContent = 'LAP';
    }
    // 動作時
    else {
        // 一時停止
        startTime -= now;
        lapTime   -= now;
        timePrint(-startTime, -lapTime);
        elem.start.textContent = 'START';
        elem.reset.textContent = 'RESET';
    }
    setStorage();
}

// RESET/LAPボタン押下
function clickReset() {
    // 計測中
    if(startTime > 0) {
        // LAP
        const now = Date.now();
        timePrint(now - startTime, now - lapTime);
        lapTimePrint();
        lapTime = now;
        setStorage();
        window.scrollTo(0, 0);
    }
    // 停止中
    else {
        // リセット
        startTime = lapTime = 0;
        timePrint(0, 0);
        elem.lap.textContent = '';
        lapCount = 0;
        lapRecords = [];
        clearStorage();
    }
}

// 計測
function countUp() {
    if(startTime > 0) {
        const now = Date.now();
        timePrint(now - startTime, now - lapTime);
        requestAnimationFrame(countUp);
    }
}

// タイム表示
function timePrint(t, l) {
    elem.display.textContent = timeFormat(t) + ' / ' + timeFormat(l);
}

// 時間表示フォーマット
function timeFormat(t) {
    return Math.floor(t / 36e5) + new Date(t).toISOString().slice(13, 23);
}

// ラップタイムレコード追加
function lapTimePrint() {
    const str = display.textContent;
    lapRecords.push(str);
    elem.lap.innerHTML = '[' + (++lapCount) + '] ' + str + '<br>' + lap.innerHTML;
}

// localStorageデータ保存
function setStorage() {
    localStorage.setItem(storageName, JSON.stringify({
        startTime : startTime,
        lapTime   : lapTime,
        lapRecords: lapRecords,
    }));
}

// localStorageデータ削除
function clearStorage() {
    localStorage.removeItem(storageName);
}

// localStorageデータ取得
function getStorage() {
    const params = localStorage.getItem(storageName);
    return params ? JSON.parse(params) : {};
}
</script>



</html>