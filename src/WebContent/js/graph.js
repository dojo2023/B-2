//描画エリアの設定
let lineCtx = document.getElementById("Chart");
// 円グラフの設定
let initialLabelsData = ['仕事', '友達', '家族', '恋愛', '自分', 'その他'];
let initialColors = ['#B0C4DE', '#66CDAA', '#FFDEAD', '#FFB6C1', '#F0E68C', '#DDA0DD'];


/*let tagColorMap = {
  仕事: '#B0C4DE',
  友達: '#66CDAA',
  家族: '#FFDEAD',
  恋愛: '#FFB6C1',
  自分: '#F0E68C',
  その他: '#DDA0DD',
};*/

let lineConfig = {
    type: 'pie',
    data: {
       /*labels: labelsData,*/
       /*labels: ['仕事', '友達', '家族', '恋愛', '自分', 'その他'],*/
       

       /*datasets: [{
            data: datesValue,
            borderColor: '#ffffff',
            backgroundColor: ['#B0C4DE','#66CDAA','#FFDEAD','#FFB6C1','#F0E68C','#DDA0DD'],*/
            
            
              labels: initialLabelsData,
        datasets: [{
            data: datesValue,
            borderColor: '#FFFFFF',
            backgroundColor: initialColors,
        }],
        },
        };
let lineChart = new Chart(lineCtx, lineConfig);
