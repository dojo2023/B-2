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

@WebServlet("/GameCheckServlet")
public class GameCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}

		// MurmursDAOのインスタンス化
		MurmursDAO mDao = new MurmursDAO();
		// MurmursDAOのget()メソッドを呼び出して、返ってきた愚痴の情報のリストを取得
		//後でここはセッションスコープの値を取り出して入れる。
		//LoginUser lu = new LoginUser(1, "ラム");
		LoginUser lu = (LoginUser)session.getAttribute("id_name");

		//murmur_checkがtrue でかつ murmur_deleteがfalseのデータのmurmur_checkはfalseにする
		mDao.updateMurFalse(lu);

		List<Murmurs> cardList = mDao.get(lu);
		// 愚痴取得結果をリクエストスコープに格納する。画面表示の後も使うのでセッションスコープに格納
		session.setAttribute("cardList", cardList);
		// ゲーム選択/チェックボックス画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/game_check.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * ・チェックボックスにチェックがついたものをパラメータとして受け取る
		 * ・updateCheck()メソッドでcheckをtrue→falseに変更
		 * ・リクエストスコープに変更したあとの愚痴の情報を格納
		 * ---ここまでこのpostで記述
		 * ・文字クリックゲーム、ヤギのご飯ゲームはこの格納したリクエストスコープの愚痴を利用
		 * ・利用する際は、checkがfalse,deleteがtrueのものを表示
		 * ・その後、deleteをfalseにupdateするメソッドを使用する(まだ作成していない)
		 */
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}

		request.setCharacterEncoding("UTF-8");

		MurmursDAO mDao = new MurmursDAO();

		//セッションスコープから取り出す
		List<Murmurs> mm = (List<Murmurs>) session.getAttribute("cardList");

		for (Murmurs lists : mm) {//cardlistのlistがあるだけ回す
			int id = lists.getId();
			//全画面のチェックボックスのvalueを取得(チェックだとon)
			String checkbox = request.getParameter("checkbox" + id);//checkbox+cardList.id
			// チェックボックスをチェックしてないとnullになる
			// nullの処理を書かないとエラーになる
			if(checkbox == null) {
				checkbox = "";
			}

			// ログインしているユーザ かつ deleteがfalseの人の愚痴のid
			System.out.println(id);
			// ログインしているユーザ かつ deleteがfalseの人の愚痴のcheckboxの結果
			// チェックついてたら"on"ついてなかったらnull
			System.out.println(checkbox);

			// murmur_deleteがfalseのmurmur_checkはfalseに戻す

			if (checkbox.equals("on")) {
				System.out.println(mDao.updateCheck(id));
				mDao.updateCheck(id);
			}
		}

		LoginUser lu = (LoginUser)session.getAttribute("id_name");
		//ゲームで使う愚痴のデータセットをセッションスコープに保存する
		//murmur_checkがtrueでmurmur_deleteがFALSEのデータ
		// sessionスコープに保存しているユーザのuser_idとuser_nameを引数として渡す。
		// chTrueDeFalse()メソッドでcheckがtrue,deleteがfalseのmurmursの情報を取得。
		session.setAttribute("chTdeF", mDao.chTrueDeFalse(lu));

		// ボタンごとの画面遷移を行う
		if (request.getParameter("submit").equals("クリック破壊ゲーム")) {
			response.sendRedirect("/BtwoB/ClickGameServlet");
			return;
		} else if (request.getParameter("submit").equals("スペースキー連打ゲーム")) {
			response.sendRedirect("/BtwoB/SpaceGameServlet");
			return;
		} else if (request.getParameter("submit").equals("文字クリックゲーム")) {
			response.sendRedirect("/BtwoB/MojiGameServlet");
			return;
		} else if (request.getParameter("submit").equals("ヤギのご飯ゲーム")) {
			response.sendRedirect("/BtwoB/LambGame1Servlet");
			return;
		}
	}
}