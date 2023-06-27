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

import dao.EyecatchesDAO;
import dao.MurmursDAO;
import model.LoginUser;
import model.Murmurs;
import model.TagPercentage;

@WebServlet("/TopServlet")
public class TopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id_name") == null) {
			response.sendRedirect("/BtwoB/LoginServlet");
			return;
		}

		// MurmursDAOのインスタンス化
		MurmursDAO mDao = new MurmursDAO();
		// sessionスコープに格納しているuser_idとuser_nameを取得
		LoginUser lu = (LoginUser)session.getAttribute("id_name");

		// MurmursDAOのget()メソッドを呼び出して、ログインしているuser_idの愚痴の情報のリストを取得し、cardListに入れる
		List<Murmurs> cardList = mDao.get(lu);
		// 愚痴取得結果を「cardList」って名前をつけてcardListをセッションスコープに格納する
		session.setAttribute("cardList", cardList);

		// だけど直近1週間分の愚痴を取得したいので、別のgetOneWeek()メソッドを使って1週間の愚痴を取得する
		List<Murmurs> weekList = mDao.getOneWeek(lu);
		// 1週間の愚痴取得結果を「weekList」って名前をつけてweekListをリクエストスコープに格納する
		// top.jspでしか表示しないのでリクエストスコープに入れた
		request.setAttribute("weekList", weekList);

		// EyecatchesDAOのインスタンス化
		EyecatchesDAO eDao = new EyecatchesDAO();
		// EyecatchesDAOのgetPercent()メソッドを呼び出して、ログインしているuser_idのタグの割合のリストを取得し、tagPersentListに入れる
		List<TagPercentage> tagPersentList = eDao.getPercent(lu);
		System.out.println(tagPersentList);
		// タグの割合リストを「tagPersentList」って名前をつけてtagPersentListをリクエストスコープに格納する
		session.setAttribute("tagPersentList", tagPersentList);

		// 一番愚痴の数が多いタグを見つけるためのfor文
		// orders（愚痴の数）が一番多いもののタグでtagを上書きしている
		String tag = null;
		int murNum = 0;
		for (TagPercentage tagPList : tagPersentList) {
		    if (tagPList.getOrders() > murNum) {
		        murNum = tagPList.getOrders();
		        tag = tagPList.getTag();
		    }
//		    else if (tagPList.getOrders() == murNum) {
//		    	tag = "その他";
//		    }
		    else {
		    	tag = "その他";
		    }
		}

		System.out.println(tag);
		System.out.println(eDao.getMessage(tag));
		// 一番ordersが多い（一番割合が大きい）アイキャッチのメッセージをセッションスコープに入れる
		session.setAttribute("eyecatch", eDao.getMessage(tag));

		// ログインしたらポップアップを表示する
		request.setAttribute("showPopup", true);
		// ポップアップをログインしたあとだけ表示するためにtop.jspが1回目に表示したときのみアイキャッチを表示するのに判定するためのtop_count
		int x= (Integer)session.getAttribute("top_count");
		x++;
		session.setAttribute("top_count", x);
		// この下2行はちゃんとインクリメントした値がsessionスコープに入っているか確認するためのデバッグ
		int y= (Integer)session.getAttribute("top_count");
		System.out.println(y);

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
		dispatcher.forward(request, response);
	}
}
