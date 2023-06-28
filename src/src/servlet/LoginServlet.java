package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LogincountsDAO;
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
			// ログイン成功確認用
			System.out.println("ログイン成功");
			// ログインできた時にloginInfo()メソッドを呼び出す
			// 取り出して来たuser_nameとuser_pwをloginInfoに渡すことで、user_idとuser_nameを取り出した
			// 取り出したuser_idとuser_nameをセッションスコープに保存した
			System.out.println("user_name =" + user_name + "user_pw =" + user_pw);
			HttpSession session = request.getSession();
			session.setAttribute("id_name" ,uDao.loginInfo(new Users(user_name, user_pw)));
			request.setAttribute("showPopup", true);
			// セッションスコープに保存されているかデバッグ
			System.out.println(uDao.loginInfo(new Users(user_name, user_pw)));

			// LogincountsDAOをインスタンス化
			LogincountsDAO loDAO = new LogincountsDAO();
			// sessionスコープに格納しているuser_idとuser_nameを取得
			LoginUser lu = (LoginUser)session.getAttribute("id_name");
			// ログイン回数を数えるためにログイン履歴を残すinsert()メソッドを呼び出す
			loDAO.loginInsert(lu);
			// ログイン回数をカウントするメソッド
			loDAO.loginCount(lu);
			// 本来は称号に使用するが間に合わないためコンソールに表示させる
			System.out.println(user_name + "のログイン回数 =" + loDAO.loginCount(lu));

			// top_countはアイキャッチ1回だけ表示する判定に使用する
			Integer top_count = 0;
			session.setAttribute("top_count",top_count);

			Integer murList_count = 0;
			session.setAttribute("murList_count",murList_count);

			// トップサーブレットにリダイレクトする
			response.sendRedirect("/BtwoB/TopServlet");
		}
		// もしログインが失敗していたら？
		else if (uDao.isLoginOK(new Users(user_name, user_pw)) == false) {  // ログイン失敗
			// ここにポップアップ表示するかも
			request.setAttribute("showPopup", true);

			// ログイン失敗確認用
			System.out.println("ログイン失敗");

			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			  dispatcher.forward(request, response);
		}

	}
}
