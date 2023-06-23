package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MurmursDAO;

@WebServlet("/MurInServlet")
public class MurInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_in.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ここで得たパラメータ(tagとmurmur)をMurmursDAOでインサートする
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String tag = request.getParameter("TAG");
		String murmur = request.getParameter("MURMUR");

		System.out.println(tag);

		// あとでセッションスコープに入れたuser_idを使うのでここは編集します！！！
		int user_id = 1;

		// 登録処理を行う
		MurmursDAO mDao = new MurmursDAO();
		if (request.getParameter("SUBMIT").equals("入力完了")) {
			if (murmur.equals("")) {
				// 一番下に表示する（あとで）
				String errorMessage = "愚痴を入力してね！";
				request.setAttribute("errorMessage", errorMessage);

				// エラーメッセージを表示するためのフォワード先を設定
			    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_in.jsp");
			    dispatcher.forward(request, response);
			}
			else if (mDao.insert(user_id, tag, murmur)) {	// 登録成功
				System.out.println("愚痴登録成功");
				// TopServletにリダイレクトする
				response.sendRedirect("/BtwoB/TopServlet");
				return;
			}
			else {	// 登録失敗
				System.out.println("愚痴登録失敗");
				// TopServletにリダイレクトする
				response.sendRedirect("/BtwoB/TopServlet");
				return;
			}
		}
		else {
			// TopServletにリダイレクトする
			response.sendRedirect("/BtwoB/TopServlet");
			return;
		}

	}
}
