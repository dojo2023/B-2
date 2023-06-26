//描画エリアの設定
let lineCtx = document.getElementById("Chart");
// 円グラフの設定
let lineConfig = {
    type: 'pie',
    data: {
        labels: labelsData,

        datasets: [{
            data: datesValue,
            borderColor: '#ffffff',
            backgroundColor: ['#B0C4DE','#66CDAA','#FFDEAD','#FFB6C1','#F0E68C','#DDA0DD'],
        }],
    },
};
let lineChart = new Chart(lineCtx, lineConfig);