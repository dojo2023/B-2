<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- モーダルここから -->
     <!--    <button class="button js-modal-button">ゲーム説明</button>
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
 -->
<!-- モーダルここまで -->

<!-- 左右画面のdiv -->
<div class="split">
	<!-- 左画面のdiv -->
	<div class="split-item split-left">
		<!-- 左画面の中のdiv -->
		<div class="split-left__inner">

         <c:forEach var="e" items="${chTdeF}" >
			<!-- <form method="GET" action="/BtwoB/LambGame1Servlet"> -->
			<table class="tagmurmur">
				<tr><td><input type="hidden" name="ID" value="${e.id}"></td></tr>
				<tr><td><input type="hidden" name="USER_ID" value="${e.user_id}"></td></tr>
				<tr><td><input type="hidden" name="TAG" value="${e.tag}"></td></tr>
				<tr><td class="murmur">${e.murmur}</td></tr>
				<tr><td><input type="hidden" name="MURMUR_CHECK" value="${e.murmur_check}"></td></tr>
				<tr><td><input type="hidden" name="MURMUR_DELETE" value="${e.murmur_delete}"></td></tr>
				<tr><td><input type="hidden" name="CREATED_AT" value="${e.created_at}"></td></tr>
				<tr><td><input type="hidden" name="UPDATE_AT" value="${e.update_at}"></td></tr>
			</table>
			<!-- </form> -->
		</c:forEach>
		</div><!--split-left__inner-->
	</div><!--split-item split-left-->

    <!-- 右画面のdiv -->
    <div class="split-item split-right">
    	<!-- 右画面の中のdiv -->
        <div class="split-right__inner">
        <table>
          	<tr><td><img src="https://4.bp.blogspot.com/-piPWJlRYOIo/UUhH7Pfy1rI/AAAAAAAAO5k/4JfvOTxND24/s400/mail.png"align="right"width="200" height="100"></td>
          		<td><img src="https://4.bp.blogspot.com/-piPWJlRYOIo/UUhH7Pfy1rI/AAAAAAAAO5k/4JfvOTxND24/s400/mail.png"align="right"width="200" height="100"></td></tr>
          	<tr><td><img src="https://4.bp.blogspot.com/-piPWJlRYOIo/UUhH7Pfy1rI/AAAAAAAAO5k/4JfvOTxND24/s400/mail.png"align="right"width="200" height="100"></td>
            	<td><img src="https://4.bp.blogspot.com/-piPWJlRYOIo/UUhH7Pfy1rI/AAAAAAAAO5k/4JfvOTxND24/s400/mail.png"align="right"width="200" height="100"></td>
			</table>

        </div><!--split-right__inner-->
    </div><!--split-item split-right-->
</div><!--split-->


	<div class="post-btn">
		<button onclick="location.href='http://localhost:8080/BtwoB/LambGame2Servlet'">次へ</button>
	</div>
</body>


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
/* モーダルJSここまで */
 *
 */
 </script>

</html>