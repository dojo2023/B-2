//描画エリアの設定
let lineCtx = document.getElementById("Chart");
// 円グラフの設定
let lineConfig = {
    type: 'pie',
    data: {
        labels: ['仕事', '友達', '家族','恋愛','自分','その他'],
        datasets: [{
            label: 'Red',
            data: [50, 30, 20,60,40,10],
            borderColor: '#ffffff',
            backgroundColor: ['#B0C4DE','#66CDAA','#FFDEAD','#FFB6C1','#F0E68C','#DDA0DD'],
        }],
    },
};
let lineChart = new Chart(lineCtx, lineConfig);