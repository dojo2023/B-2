<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<script src="lamb_game1.js"></script>
<link rel="stylesheet" href="css/lamb_game1.css">
<link rel="stylesheet" href="css/game_modal.css">
</head>
<body>

<div>
    <img src="https://4.bp.blogspot.com/-piPWJlRYOIo/UUhH7Pfy1rI/AAAAAAAAO5k/4JfvOTxND24/s400/mail.png"align="right"width="200" height="100">
</div>
<div>
    <img src="https://4.bp.blogspot.com/-piPWJlRYOIo/UUhH7Pfy1rI/AAAAAAAAO5k/4JfvOTxND24/s400/mail.png"align="right"width="200" height="100">
</div>
<div>
    <img src="https://4.bp.blogspot.com/-piPWJlRYOIo/UUhH7Pfy1rI/AAAAAAAAO5k/4JfvOTxND24/s400/mail.png"align="right"width="200" height="100">
</div>

<div class="post-btn">
<button onclick="location.href='http://localhost:8080/BtwoB/LambGame2Servlet'">次へ</button>
</div>

</body>

<!-- モーダル設定コード -->
<button class="button js-modal-button">ゲーム説明</button>
<div class="layer js-modal">
    <div class="modal">
      <div class="modal__inner">
        <div class="modal__button-wrap">
          <button class="close-button js-close-button">
            <span></span>
            <span></span>
          </button>
        </div>
        <div class="modal__contents">
          <div class="modal__content">
            コンテンツが入ります。コンテンツが入ります。コンテンツが入ります。コンテンツが入ります。コンテンツが入ります。コンテンツが入ります。
          </div>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
 const modal = document.querySelector('.js-modal');
  const modalButton = document.querySelector('.js-modal-button');


  const modalClose = document.querySelector('.js-close-button');

  modalButton.addEventListener('click', () => {
    modal.classList.add('is-open');

  });

  modalClose.addEventListener('click', () => {
    modal.classList.remove('is-open');

  });

  </script>
  <!-- モーダルここまで -->

</html>