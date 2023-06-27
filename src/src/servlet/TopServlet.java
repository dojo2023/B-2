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

		// MurmursDAOのget()メソッドを呼び出して、返ってきた愚痴の情報のリストを取得
		LoginUser lu = (LoginUser)session.getAttribute("id_name");
		List<Murmurs> cardList = mDao.get(lu);
		// 愚痴取得結果をセッションスコープに格納する
		session.setAttribute("cardList", cardList);

//		// EyecatchesDAOのインスタンス化
//		EyecatchesDAO eDao = new EyecatchesDAO();
//		// EyecatchesDAOのget()メソッドを呼び出して、返ってきたタグの割合リストを取得
//		List<TagPercentage> cardList = eDao.get();
//		// 取得結果をリクエストスコープに格納する
//		request.setAttribute("cardList", cardList);

		// EyecatchesDAOのインスタンス化
		EyecatchesDAO eDao = new EyecatchesDAO();
		// EyecatchesDAOのgetPercent()メソッドを呼び出して、返ってきたタグの割合リストを取得
		List<TagPercentage> tagPersentList = eDao.getPercent(lu);

		/*	// メッセージをリクエストスコープに格納
			String message = eDao.getMessage(tagPersentList.get(0).getTag());
			request.setAttribute("message", message);*/

		// リストを宣言する
//		List<percentage_of_orders> PoOList = new ArrayList<percentage_of_orders>();

		String tag = null;
		int murNum = 0;
		for (TagPercentage tagPList : tagPersentList) {
		    if (tagPList.getOrders() > murNum) {
		        murNum = tagPList.getOrders();
		        tag = tagPList.getTag();
		    }
		    else if (tagPList.getOrders() == murNum) {
		    	tag = "その他";
		    }


		    // PoOListにPerentage_of_orders()を入れていく
//		    PoOList.add(tagPList.getPercentage_of_orders());
		}

		System.out.println(tag);



		// リクエストスコープにPercentage_of_ordersが入ったリストを格納
		// セッションスコープに一番ordersが多いタグのmessageを保存する
		System.out.println(tagPersentList);
		session.setAttribute("tagPersentList", tagPersentList);

		System.out.println(eDao.getMessage(tag));
		session.setAttribute("eyecatch", eDao.getMessage(tag));


		// ログインしたらポップアップを表示する
		request.setAttribute("showPopup", true);
		int x= (Integer)session.getAttribute("top_count");
		x++;
		session.setAttribute("top_count", x);
		int y= (Integer)session.getAttribute("top_count");
		System.out.println(y);
		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
		dispatcher.forward(request, response);
	}


	/*	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




			}
	*/
}
