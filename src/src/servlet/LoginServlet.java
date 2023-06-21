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
			// ログイン成功確認用
			System.out.println("ログイン成功");
			// ログインできた時にloginInfo()メソッドを呼び出す
			// 取り出して来たuser_nameとuser_pwをloginInfoに渡すことで、user_idとuser_nameを取り出した
			// 取り出したuser_idとuser_nameをセッションスコープに保存した
			System.out.println(user_name + user_pw);
			HttpSession session = request.getSession();
			session.setAttribute("id_name" ,uDao.loginInfo(new Users(user_name, user_pw)));

			// セッションスコープに保存されているかデバッグ
			System.out.println(uDao.loginInfo(new Users(user_name, user_pw)));

			// トップサーブレットにリダイレクトする
			response.sendRedirect("/BtwoB/TopServlet");
		}
		else {  // ログイン失敗
			// ここにポップアップ表示するかも
			// ログイン失敗確認用
			System.out.println("ログイン失敗");

			// 結果ページにフォワードする
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
	        dispatcher.forward(request, response);
	    }
	}
}
