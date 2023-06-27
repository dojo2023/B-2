package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GamecountsDAO;
import dao.MurmursDAO;
import model.LoginUser;


@WebServlet("/LambGame2Servlet")
public class LambGame2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/lamb_game2.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}
		request.setCharacterEncoding("UTF-8");

		LoginUser lu = (LoginUser)session.getAttribute("id_name");
		MurmursDAO mDao = new MurmursDAO();
		mDao.updateDeleteTrue(lu);

		// ゲームカウントをするためにinsert
		GamecountsDAO gcDao = new GamecountsDAO();
		gcDao.gameInsert(lu);

		/*System.out.println(gcDao.gameInsert(lu));*/

		// ゲームをカウントする
		gcDao.gameCount(lu);

		System.out.println(lu.getUser_name() + "のゲームプレイ回数 =" + gcDao.gameCount(lu));


		// ボタンごとの画面遷移を行う
		if (request.getParameter("SUBMIT").equals("はい")) {
			response.sendRedirect("/BtwoB/GameCheckServlet");
			return;
		} else {
			response.sendRedirect("/BtwoB/TopServlet");
			return;
		}


	}

}
