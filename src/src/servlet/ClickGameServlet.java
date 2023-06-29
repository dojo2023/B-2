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


@WebServlet("/ClickGameServlet")
public class ClickGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/click_game.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}
		// setCharacterEncoding()メソッドはリクエストボディに含まれるデータの文字コードを指定した値（UTF-8）に書き換えるメソッド
		request.setCharacterEncoding("UTF-8");

		// sessionスコープに入ってるuser_idとuser_nameを取得（ログイン時に"id_nameと名付けてる"）
		LoginUser lu = (LoginUser)session.getAttribute("id_name");
		// MurmursDAOをインスタンス化
		MurmursDAO mDao = new MurmursDAO();
		// deleteをtrueにする
		mDao.updateDeleteTrue(lu);

		// GamecountsDAOをインスタンス化
		GamecountsDAO gcDao = new GamecountsDAO();
		// ゲームカウントをするためにinser()メソッドに
		gcDao.gameInsert(lu);

		/*System.out.println(gcDao.gameInsert(lu));*/

		// ゲームをカウントするgameCount()メソッド使用
		gcDao.gameCount(lu);
		// ログインしてるユーザのゲームプレイ回数デバッグしてる（コンソール表示）
		System.out.println(lu.getUser_name() + "のゲームプレイ回数 =" + gcDao.gameCount(lu));

		// ボタンごとの画面遷移を行う
		// request.getParameter("SUBMIT").equals("はい")
		// →click_game.jspでformで囲ったsubmitボタンでnameがSUBMITのボタンのvalueが"はい"だったらtrue
		// if文の条件式の結果はtureかfalseしかない
		if (request.getParameter("SUBMIT").equals("はい")) {
			response.sendRedirect("/BtwoB/GameCheckServlet");
			return;
		} else {
			response.sendRedirect("/BtwoB/TopServlet");
			return;
		}
	}

}
