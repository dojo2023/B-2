package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsersDAO;
import model.LoginUser;
import model.Users;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String user_name = request.getParameter("user_name");
		String user_pw = request.getParameter("user_pw");

		// ログイン処理を行う
		UsersDAO uDao = new UsersDAO();
		if (uDao.isLoginOK(new Users(user_name, user_pw))) {	// ログイン成功
			// セッションスコープにユーザーネームを格納する
			HttpSession session = request.getSession();
			session.setAttribute("user_name", new LoginUser(user_name));

			// トップサーブレットにリダイレクトする
			response.sendRedirect("/BtwoB/TopServlet");
		}
		else {  // ログイン失敗
			// ここにポップアップ表示するかも

			// 結果ページにフォワードする
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
	        dispatcher.forward(request, response);
	    }
	}
}
