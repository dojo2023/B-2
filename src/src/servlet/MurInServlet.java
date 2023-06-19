package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MurmursDAO;
import model.Murmurs;

@WebServlet("/MurInServlet")
public class MurInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_in.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ここで得たパラメータをMurmursDAOでインサートする
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String tag = request.getParameter("tag");
		String murmur = request.getParameter("murmur");
		boolean check = Boolean.parseBoolean(request.getParameter("check"));
		String created_at = request.getParameter("created_at");
		String update_at =  request.getParameter("update_at");

		// 登録処理を行う
		MurmursDAO mDao = new MurmursDAO();
		if (mDao.insert(new Murmurs(id, user_id, tag, murmur, check, created_at, update_at))) {	// 登録成功
			System.out.println("愚痴登録成功");
			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
			dispatcher.forward(request, response);
		}
		else {	// 登録失敗
			System.out.println("愚痴登録失敗");
			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
			dispatcher.forward(request, response);
		}
	}
}
