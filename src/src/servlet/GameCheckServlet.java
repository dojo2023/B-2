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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// MurmursDAOのインスタンス化
		MurmursDAO mDao = new MurmursDAO();
		// MurmursDAOのget()メソッドを呼び出して、返ってきた愚痴の情報のリストを取得
		String id= "1"; //後でここはセッションスコープの値を取り出して入れる。
		List<Murmurs> cardList = mDao.get(id);
		// 愚痴取得結果をリクエストスコープに格納する
		request.setAttribute("cardList", cardList);
		// ゲーム選択/チェックボックス画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/game_check.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * ・チェックボックスにチェックがついたものをパラメータとして受け取る
		 * ・updateCheck()メソッドでcheckをtrue→falseに変更
		 * ・リクエストスコープに変更したあとの愚痴の情報を格納
		 * ---ここまでこのpostで記述
		 * ・文字クリックゲーム、ヤギのご飯ゲームはこの格納したリクエストスコープの愚痴を利用
		 * ・利用する際は、checkがfalse,deleteがtrueのものを表示
		 * ・その後、deleteをfalseにupdateするメソッドを使用する(まだ作成していない)
		 */

		//チェックボックスがオンかオフかを確認したい
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		for() {//cardlistのlistがあるだけ回す for in ,for on
		String checkbox = request.getParameter("checkbox1");//checkbox+cardList.id
		MurmursDAO mDao = new MurmursDAO();
		if(checkbox == "on") {
			mDao.updateCheck("1");
		}
		// ボタンごとの画面遷移を行う







		MurmursDAO mDao = new MurmursDAO();
		int i;
		for (i = 1; i <= mDao.count(new Murmurs(Integer.parseInt(request.getParameter("ID" + i)),Integer.parseInt(request.getParameter("USER_ID" + i)),request.getParameter("TAG" + i),
				request.getParameter("MURMUR" + i),Boolean.parseBoolean(request.getParameter("MURMUR_CHECK" + i)),Boolean.parseBoolean(request.getParameter("MURMUR_DELETE" + i)),
				request.getParameter("CREATED_AT" + i),request.getParameter("UPDATE_AT" + i))); i++) {

			if (request.getParameter("checkbox" + i).equals("on")) {
				// checkboxにチェックを入れたもののパラメータは「on」で返ってくる
				System.out.println(request.getParameter("checkbox"));
				// もしチェックボックスにチェックがついてたら（onだったら）
				// updateCheckメソッドに渡してcheckをtrue→falseにする
				mDao.updateCheck(new Murmurs(Integer.parseInt(request.getParameter("ID" + i)),Integer.parseInt(request.getParameter("USER_ID" + i)),request.getParameter("TAG" + i),
						request.getParameter("MURMUR" + i),Boolean.parseBoolean(request.getParameter("MURMUR_CHECK" + i)),Boolean.parseBoolean(request.getParameter("MURMUR_DELETE" + i)),
						request.getParameter("CREATED_AT" + i),request.getParameter("UPDATE_AT" + i)));
				i++;
			}
		}
		// もしクリックゲームが選択されたら
		if (request.getParameter("submit").equals("クリック破壊ゲーム")) {



			// LoginUserのコンストラクタにログインしているユーザのuser_idとuser_nameを渡す
			// getCheckFalseメソッドでそのuser_idの人かつcheckがfalseのものをスコープに保存
			session.setAttribute("id_checkfalse" ,mDao.getCheckFalse(new LoginUser(1, "ラム")));
			System.out.println(mDao.getCheckFalse(new LoginUser(1, "ラム")));
			// ClickGameServletにリダイレクトする
			// でもjava.lang.NullPointerExceptionになる
			response.sendRedirect("/BtwoB/ClickGameServlet");
			return;
		}
		else if (request.getParameter("submit").equals("スペースキー連打ゲーム")) {
			MurmursDAO mDao = new MurmursDAO();
			int i;
			for (i = 1; i <= mDao.count(new Murmurs(Integer.parseInt(request.getParameter("ID" + i)),Integer.parseInt(request.getParameter("USER_ID" + i)),request.getParameter("TAG" + i),
					request.getParameter("MURMUR" + i),Boolean.parseBoolean(request.getParameter("MURMUR_CHECK" + i)),Boolean.parseBoolean(request.getParameter("MURMUR_DELETE" + i)),
					request.getParameter("CREATED_AT" + i),request.getParameter("UPDATE_AT" + i))); i++) {

				if (request.getParameter("checkbox" + i).equals("on")) {
					// もしチェックボックスにチェックがついてたら（onだったら）
					// updateCheckメソッドに渡してcheckをtrue→falseにする
					mDao.updateCheck(new Murmurs(Integer.parseInt(request.getParameter("ID" + i)),Integer.parseInt(request.getParameter("USER_ID" + i)),request.getParameter("TAG" + i),
							request.getParameter("MURMUR" + i),Boolean.parseBoolean(request.getParameter("MURMUR_CHECK" + i)),Boolean.parseBoolean(request.getParameter("MURMUR_DELETE" + i)),
							request.getParameter("CREATED_AT" + i),request.getParameter("UPDATE_AT" + i)));
					i++;
				}
			}

			HttpSession session = request.getSession();
			// LoginUserのコンストラクタにログインしているユーザのuser_idとuser_nameを渡す
			// getCheckFalseメソッドでそのuser_idの人かつcheckがfalseのものをスコープに保存
			session.setAttribute("id_checkfalse" ,mDao.getCheckFalse(new LoginUser(1, "ラム")));
			System.out.println(mDao.getCheckFalse(new LoginUser(1, "ラム")));
			// SpaceGameServletにリダイレクトする
			// でもjava.lang.NullPointerExceptionになる
			response.sendRedirect("/BtwoB/SpaceGameServlet");
			return;
		}
		else if (request.getParameter("submit").equals("文字クリックゲーム")) {
			MurmursDAO mDao = new MurmursDAO();
			int i;
			for (i = 1; i <= mDao.count(new Murmurs(Integer.parseInt(request.getParameter("ID" + i)),Integer.parseInt(request.getParameter("USER_ID" + i)),request.getParameter("TAG" + i),
					request.getParameter("MURMUR" + i),Boolean.parseBoolean(request.getParameter("MURMUR_CHECK" + i)),Boolean.parseBoolean(request.getParameter("MURMUR_DELETE" + i)),
					request.getParameter("CREATED_AT" + i),request.getParameter("UPDATE_AT" + i))); i++) {

				if (request.getParameter("checkbox" + i).equals("on")) {
					// もしチェックボックスにチェックがついてたら（onだったら）
					// updateCheckメソッドに渡してcheckをtrue→falseにする
					mDao.updateCheck(new Murmurs(Integer.parseInt(request.getParameter("ID" + i)),Integer.parseInt(request.getParameter("USER_ID" + i)),request.getParameter("TAG" + i),
							request.getParameter("MURMUR" + i),Boolean.parseBoolean(request.getParameter("MURMUR_CHECK" + i)),Boolean.parseBoolean(request.getParameter("MURMUR_DELETE" + i)),
							request.getParameter("CREATED_AT" + i),request.getParameter("UPDATE_AT" + i)));
					i++;
				}
			}

			HttpSession session = request.getSession();
			// LoginUserのコンストラクタにログインしているユーザのuser_idとuser_nameを渡す
			// getCheckFalseメソッドでそのuser_idの人かつcheckがfalseのものをスコープに保存
			session.setAttribute("id_checkfalse" ,mDao.getCheckFalse(new LoginUser(1, "ラム")));
			System.out.println(mDao.getCheckFalse(new LoginUser(1, "ラム")));
			// MojiGameServletにリダイレクトする
			// でもjava.lang.NullPointerExceptionになる
			response.sendRedirect("/BtwoB/MojiGameServlet");
			return;
		}
		else if (request.getParameter("button").equals("ヤギのご飯ゲーム")) {
			MurmursDAO mDao = new MurmursDAO();
			int i;
			for (i = 1; i <= mDao.count(new Murmurs(Integer.parseInt(request.getParameter("ID" + i)),Integer.parseInt(request.getParameter("USER_ID" + i)),request.getParameter("TAG" + i),
					request.getParameter("MURMUR" + i),Boolean.parseBoolean(request.getParameter("MURMUR_CHECK" + i)),Boolean.parseBoolean(request.getParameter("MURMUR_DELETE" + i)),
					request.getParameter("CREATED_AT" + i),request.getParameter("UPDATE_AT" + i))); i++) {

				if (request.getParameter("checkbox" + i).equals("on")) {
					// もしチェックボックスにチェックがついてたら（onだったら）
					// updateCheckメソッドに渡してcheckをtrue→falseにする
					mDao.updateCheck(new Murmurs(Integer.parseInt(request.getParameter("ID" + i)),Integer.parseInt(request.getParameter("USER_ID" + i)),request.getParameter("TAG" + i),
							request.getParameter("MURMUR" + i),Boolean.parseBoolean(request.getParameter("MURMUR_CHECK" + i)),Boolean.parseBoolean(request.getParameter("MURMUR_DELETE" + i)),
							request.getParameter("CREATED_AT" + i),request.getParameter("UPDATE_AT" + i)));
					i++;
				}
			}

			HttpSession session = request.getSession();
			// LoginUserのコンストラクタにログインしているユーザのuser_idとuser_nameを渡す
			// getCheckFalseメソッドでそのuser_idの人かつcheckがfalseのものをスコープに保存
			session.setAttribute("id_checkfalse" ,mDao.getCheckFalse(new LoginUser(1, "ラム")));
			System.out.println(mDao.getCheckFalse(new LoginUser(1, "ラム")));
			// LambGame1Servletにリダイレクトする
			// でもjava.lang.NullPointerExceptionになる
			response.sendRedirect("/BtwoB/LambGame1Servlet");
			return;
		}
	}
}
