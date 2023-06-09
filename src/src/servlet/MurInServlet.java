package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MurmursDAO;
import model.LoginUser;

@WebServlet("/MurInServlet")
public class MurInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_in.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}

		// ここで得たパラメータ(tagとmurmur)をMurmursDAOでインサートするするため
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String tag = request.getParameter("TAG");
		String murmur = request.getParameter("MURMUR");

		System.out.println(tag);
//		int user_id = 1;
		// MurmursDAOのget()メソッドを呼び出して、返ってきた愚痴の情報のリストを取得
		LoginUser lu = (LoginUser)session.getAttribute("id_name");

		// 登録処理を行う
		MurmursDAO mDao = new MurmursDAO();
		// もし入力完了ボタンが押されたら
		if (request.getParameter("SUBMIT").equals("入力完了")) {
			// もし入力された文字が空文字だったら
			if (murmur.equals("")) {
				// 一番下に表示する（あとで）
				String errorMessage = "愚痴を入力してね！";
				request.setAttribute("errorMessage", errorMessage);

				// エラーメッセージを表示するためのフォワード先を設定
			    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_in.jsp");
			    dispatcher.forward(request, response);
			}
			// もし愚痴の内容を登録することができていたら
			else if (mDao.insert(lu.getUser_id(), tag, murmur)) {	// 登録成功
				System.out.println("愚痴登録成功");
				// TopServletにリダイレクトする
				response.sendRedirect("/BtwoB/TopServlet");
				return;
			}
			// それ以外なら（登録に失敗したら）
			else {	// 登録失敗
				System.out.println("愚痴登録失敗");
				// TopServletにリダイレクトする
				response.sendRedirect("/BtwoB/TopServlet");
				return;
			}
		}
		// それ以外なら（戻るボタン押されたら）
		else {
			// TopServletにリダイレクトする
			response.sendRedirect("/BtwoB/TopServlet");
			return;
		}

	}
}
