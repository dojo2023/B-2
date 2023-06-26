package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MurmursDAO;


@WebServlet("/MurListServlet")
public class MurListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*// MurmursDAOのインスタンス化
		MurmursDAO mDao = new MurmursDAO();
		// MurmursDAOのget()メソッドを呼び出して、返ってきた愚痴の情報のリストを取得
		LoginUser lu = new LoginUser(1, "ラム");
		List<Murmurs> cardList = mDao.get(lu);
		// 愚痴取得結果をリクエストスコープに格納する
		request.setAttribute("cardList", cardList);*/
		
		// もしorderがnullだったら
		if (request.getParameter("order") == null) {
			
		}
		else {

		}


		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_list.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ここで得たパラメータをMurmursDAOでアップデートする
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));

		// 表示する順番変える処理
		if (request.getParameter("order").equals("new")) {
			// メソッドにid渡してorder byで順番変えた結果もらう

			// リクエストスコープに入れる？

			// このサーブレットリダイレクト？

		}
		else if (request.getParameter("order").equals("old")) {

		}
		else if (request.getParameter("order").equals("tag")) {

		}




		// 削除処理を行う（trueをfalseに）
		MurmursDAO mDao = new MurmursDAO();
		if (mDao.updateCheckDelete(id)) {	// 削除成功
			System.out.println("愚痴削除成功");
			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_list.jsp");
			dispatcher.forward(request, response);
		}
		else {	// 削除失敗
			System.out.println("愚痴削除失敗");
			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_list.jsp");
			dispatcher.forward(request, response);
		}
	}
}
