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



	}

}
