package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MurmursDAO;
import model.Murmurs;


@WebServlet("/GameCheckServlet")
public class GameCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// MurmursDAOのインスタンス化
		MurmursDAO mDao = new MurmursDAO();
		// MurmursDAOのget()メソッドを呼び出して、返ってきた愚痴の情報のリストを取得
		List<Murmurs> cardList = mDao.get();
		// 愚痴取得結果をリクエストスコープに格納する
		request.setAttribute("cardList", cardList);
		// ゲーム選択/チェックボックス画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/game_check.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ボタンごとの画面遷移を行う
		// もしクリックゲームが選択されたら
		if (request.getParameter("BUTTON").equals("クリックゲーム")) {
			// クリックゲーム画面フォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/click_game.jsp");
			dispatcher.forward(request, response);
		}
		else if (request.getParameter("BUTTON").equals("スペースキー連打ゲーム")) {
			// スペースキー連打ゲーム画面にフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/space_game.jsp");
			dispatcher.forward(request, response);
		}
		else if (request.getParameter("BUTTON").equals("文字クリックゲーム")) {
			// 文字クリックゲーム画面にフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/moji_game.jsp");
			dispatcher.forward(request, response);
		}
		else if (request.getParameter("BUTTON").equals("ヤギのご飯ゲーム")) {
			// ヤギのご飯ゲーム画面にフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/lamb_game1.jsp");
			dispatcher.forward(request, response);
		}


	}

}
