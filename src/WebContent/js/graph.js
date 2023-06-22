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
            borderColor: '#000000',
            backgroundColor: ['#6699FF','#99CC33','#FF9900','#FF99FF','#FFCC33','#CC66FF'],
        }],
    },
};
let lineChart = new Chart(lineCtx, lineConfig);