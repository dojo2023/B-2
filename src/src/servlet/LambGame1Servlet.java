package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LambGame1Servlet")
public class LambGame1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ラムゲーム1でチェックつけた愚痴表示してるのにdoGet()メソッドでなんかしないの？って思ったら↓
	// GameCheckServletのdoPost()メソッドでsessionスコープに格納している愚痴をlamb_game1.jspで使ってるから、ここで表示するときになにか処理する必要はない
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/lamb_game1.jsp");
		dispatcher.forward(request, response);
	}

	// ここでは特にformで囲んだ情報を送っている訳ではないのでpostしない
	// せいぜい「次へ」ボタンで画面遷移してるけど、これはjspと多分javaScript？使ってるのかな
	// 画面遷移も色んな書き方できるっぽいです
	// 佐野が担当したときは、jspでformで囲ってメソッドをpostにして画面遷移してました
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



	}

}
