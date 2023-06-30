package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MurmursDAO;
import model.LoginUser;
import model.Murmurs;

@WebServlet("/MurListServlet")
public class MurListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}

		// sessionスコープからuser_idとuser_nameを取り出す
		LoginUser lu = (LoginUser)session.getAttribute("id_name");
		// MurmursDAOのインスタンス化
		MurmursDAO mDao = new MurmursDAO();
		// ログインしているユーザの愚痴の件数を取得、ポップアップに使用する
		// ポップアップについてmur_list.jsp222行目で使用
		System.out.println("愚痴の件数=" + mDao.murCount(lu));
		// sessionスコープに愚痴の件数を"mur_count"と名前をつけて保存
		session.setAttribute("mur_count", mDao.murCount(lu));

		// LoginServletのdoPost()メソッドの中で0を入れたsessionスコープを取り出した
		int x= (Integer)session.getAttribute("murList_count");
		x++;
		// インクリメント（1増やして）して、同じ名前にしてもう一回sessionスコープに入れた
		// こうすることでこのdoGet()メソッドが呼ばれたとき、インクリメントされていく
		// で、ページが何回読み込まれたか分かる
		session.setAttribute("murList_count", x);

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mur_list.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}
		// ここで得たパラメータをMurmursDAOでアップデートする
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");

		// セッションスコープに入ってるuser_idを使用
		//LoginUser lu = new LoginUser(1, "ラム");
		LoginUser lu = (LoginUser)session.getAttribute("id_name");

		MurmursDAO mDao = new MurmursDAO();
		if (request.getParameter("SUBMIT").equals("決定")) {
			// 表示する順番変える処理
			if (request.getParameter("ORDER").equals("新しい順")) {
				// メソッドにuser_id渡してorder byで順番変えた結果もらう
				List<Murmurs> cardList = mDao.getNew(lu);
				// リクエストスコープに入れる
				request.setAttribute("cardList", cardList);
				// doGetメソッド呼び出し
				doGet(request,response);
			}
			else if (request.getParameter("ORDER").equals("古い順")) {
				// メソッドにuser_id渡してorder byで順番変えた結果もらう
				List<Murmurs> cardList = mDao.getOld(lu);
				// リクエストスコープに入れる？
				request.setAttribute("cardList", cardList);
				// doGetメソッド呼び出し
				doGet(request,response);
			}
			else if (request.getParameter("ORDER").equals("タグ")) {
				// メソッドにuser_id渡してorder byで順番変えた結果もらう
				List<Murmurs> cardList = mDao.getTag(lu);
				// リクエストスコープに入れる？
				request.setAttribute("cardList", cardList);
				// doGetメソッド呼び出し
				doGet(request,response);
			}
		}
		else if (request.getParameter("SUBMIT").equals("はい")) {
			response.sendRedirect("/BtwoB/GameCheckServlet");
			return;
		}
//		else if (request.getParameter("SUBMIT").equals("いいえ")){
//			// doGetメソッド呼び出し
//			doGet(request,response);
//		}
		else {
			int id = Integer.parseInt(request.getParameter("ID"));
			// 削除処理を行う（trueをfalseに）
			if (mDao.updateCheckDelete(id)) {	// 削除成功
				System.out.println("愚痴削除成功");
				List<Murmurs> cardList = mDao.get(lu);
				// 愚痴取得結果をリクエストスコープに格納する
				request.setAttribute("cardList", cardList);
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
}
