// 愚痴入力のjs
// 戻るボタンと入力完了ボタンをクリックしたときの処理
document.addEventListener("DOMContentLoaded", function() {
		var backButton = document.querySelector(".back_button");
		var endButton = document.querySelector(".murmur_end_button");
		var errorMessage = document.querySelector("#error_message");

		backButton.addEventListener("click", function() {
		// 戻るボタンがクリックされた時の処理（画面遷移など）
		console.log("戻るボタンがクリックされました");
		window.location.href = "TopServlet";
		});

		endButton.addEventListener("click", function() {
		var murmurText = document.querySelector("textarea[name='murmur_text']").value;




		});
});

