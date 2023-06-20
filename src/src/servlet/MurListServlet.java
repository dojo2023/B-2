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


@WebServlet("/MurListServlet")
public class MurListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// MurmursDAOのインスタンス化
		MurmursDAO mDao = new MurmursDAO();
		// MurmursDAOのget()メソッドを呼び出して、返ってきた愚痴の情報のリストを取得
		List<Murmurs> cardList = mDao.get();
		// 愚痴取得結果をリクエストスコープに格納する
		request.setAttribute("cardList", cardList);

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_list.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ここで得たパラメータをMurmursDAOでアップデートする
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String tag = request.getParameter("tag");
		String murmur = request.getParameter("murmur");
		boolean check = Boolean.parseBoolean(request.getParameter("check"));
		String created_at = request.getParameter("created_at");
		String update_at =  request.getParameter("update_at");

		// 削除処理を行う（trueをfalseに）
		MurmursDAO mDao = new MurmursDAO();
		if (mDao.update(new Murmurs(id, user_id, tag, murmur, check, created_at, update_at))) {	// 削除成功
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
