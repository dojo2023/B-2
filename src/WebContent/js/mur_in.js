'use strict'
document.querySelector('.murmur_end_button').addEventListener('click', function() {
  var murmurText = document.querySelector('textarea[name="murmur_text"]').value.trim();
  var errorMessage = document.getElementById('error-message');

  if (murmurText === '') {
    errorMessage.textContent = '愚痴を入力してください。';
    return;
  }

  errorMessage.textContent = ''; // メッセージをリセット

  // ここで愚痴の送信処理を行う
});/**
 *
 */