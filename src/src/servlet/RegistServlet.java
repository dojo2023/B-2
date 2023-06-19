package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDAO;
import model.Users;


@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String user_name = request.getParameter("user_name");
		String user_pw = request.getParameter("user_pw");

		// 登録処理を行う
		UsersDAO uDAO = new UsersDAO();
		if (uDAO.insert(new Users(user_name, user_pw))) {	// 登録成功
			System.out.println("登録成功");
			System.out.println(user_pw);
			// トップサーブレットにリダイレクトする
			response.sendRedirect("/BtwoB/LoginServlet");
		}
		else {												// 登録失敗
			System.out.println("登録失敗");
			// トップサーブレットにリダイレクトする
			response.sendRedirect("/BtwoB/LoginServlet");
		}
	}
}
