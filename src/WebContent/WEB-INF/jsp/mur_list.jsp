<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>まめぇまめぇ</title>
<link rel="stylesheet" href="css/mur_list.css">
<script src="mur_list.js"></script>
</head>
<body>

<!-- 左右画面のdiv -->
<div class="split">
    <!-- 左画面のdiv -->
    <div class="split-item split-left">
        <!-- 左画面の中のdiv -->
        <div class="split-left__inner">
        <!-- ここに愚痴一覧のテーブル -->
            <h1>一覧</h1>
            <%-- <c:forEach var="e" items="${murList}" >
            <form method="GET" action="/BtwoB/GameCheckServlet">
            <table>
                <tr><td>tag</td><td><input type="text" name="TAG" value="${e.tag}"></td></tr>
                <tr><td>murmurs</td><td><input type="text" name="MURMUR" value="${e.murmur}"></td></tr>
            </table> --%>
            <!-- 「表示方法プルダウンメニュー」 -->
            <div class="displaymethod">
			<select name="sources" id="sources" class="custom-select sources" placeholder="Source Type">
			<option value="new">新しい順</option>
			<option value="old">古い順</option>
			<option value="tag">タグ順</option>
			</select>
			</div><!-- displaymethod -->

            <table>
                <tr><td>タグの種類</td><td></td><td><input type="submit" name="SUBMIT" value="愚痴消去"></td></tr>
                <tr><td>愚痴内容</td></tr>
                <tr><td>タグの種類</td><td></td><td><input type="submit" name="SUBMIT" value="愚痴消去"></td></tr>
                <tr><td>愚痴内容</td></tr>
                <tr><td>タグの種類</td><td></td><td><input type="submit" name="SUBMIT" value="愚痴消去"></td></tr>
                <tr><td>愚痴内容</td></tr>
            </table>

        </div><!--split-left__inner-->
    </div><!--split-item split-left-->

	<!-- 右画面のdiv -->
	<div class="split-item split-right">
		<!-- 右画面の中のdiv -->
		<div class="split-right__inner">

		<!-- 「一覧円グラフ」 -->
		<canvas id="total_piegraph"></canvas>

		</div><!-- split-right__inner -->
	</div><!-- split-item split-right -->
</div><!--split-->


</body>
<script>

$(".custom-select").each(function() {
	  var classes = $(this).attr("class"),
	      id      = $(this).attr("id"),
	      name    = $(this).attr("name");
	  var template =  '<div class="' + classes + '">';
	      template += '<span class="custom-select-trigger">' + $(this).attr("placeholder") + '</span>';
	      template += '<div class="custom-options">';
	      $(this).find("option").each(function() {
	        template += '<span class="custom-option ' + $(this).attr("class") + '" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</span>';
	      });
	  template += '</div></div>';

	  $(this).wrap('<div class="custom-select-wrapper"></div>');
	  $(this).hide();
	  $(this).after(template);
	});
	$(".custom-option:first-of-type").hover(function() {
	  $(this).parents(".custom-options").addClass("option-hover");
	}, function() {
	  $(this).parents(".custom-options").removeClass("option-hover");
	});
	$(".custom-select-trigger").on("click", function() {
	  $('html').one('click',function() {
	    $(".custom-select").removeClass("opened");
	  });
	  $(this).parents(".custom-select").toggleClass("opened");
	  event.stopPropagation();
	});
	$(".custom-option").on("click", function() {
	  $(this).parents(".custom-select-wrapper").find("select").val($(this).data("value"));
	  $(this).parents(".custom-options").find(".custom-option").removeClass("selection");
	  $(this).addClass("selection");
	  $(this).parents(".custom-select").removeClass("opened");
	  $(this).parents(".custom-select").find(".custom-select-trigger").text($(this).text());
	});

</script>

</html>