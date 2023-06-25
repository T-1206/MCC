// 画面を一番下にスクロールする関数
function scrollToBottom() {
    var container = document.getElementById('talks-container');
    container.scrollTop = container.scrollHeight;
}

// ページ読み込み時に画面を一番下にスクロール
document.addEventListener("DOMContentLoaded", scrollToBottom);


