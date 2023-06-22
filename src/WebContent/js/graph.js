//描画エリアの設定
let lineCtx = document.getElementById("Chart");
// 円グラフの設定
let lineConfig = {
    type: 'pie',
    data: {
        labels: ['data1', 'data2', 'data3'],
        datasets: [{
            label: 'Red',
            data: [50, 30, 20],
            borderColor: 'Red',
            backgroundColor: ['#66CDAA','#FFD700','#FFC6C1'],
        }],
    },
};
let lineChart = new Chart(lineCtx, lineConfig);