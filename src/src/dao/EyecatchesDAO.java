package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.LoginUser;

public class EyecatchesDAO {
	// メソッド①　タグの割合をリスト形式で持ってくる
	public List<TagPercentage> getPercent(LoginUser lu) {
		Connection conn = null;
		List<TagPercentage> cardList = new ArrayList<TagPercentage>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select tag, count(tag) as orders, count(*) * 100.0 / sum(count(*)) over() as percentage_of_orders from murmurs where user_id = ? group by tag order by orders desc;\r\n";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, String.valueOf(lu.getUser_id()));
			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				TagPercentage card = new TagPercentage(
				rs.getString("TAG"),
				rs.getInt("ORDERS"),
				rs.getInt("PERCENTAGE_OF_ORDERS")
				);
				cardList.add(card);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			cardList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			cardList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					cardList = null;
				}
			}
		}

		// 結果を返す
		return cardList;
	}

	// メソッド②　tag=? でEyecatchesのメッセージをもらうメソッド
	//ランダムでもらえたら嬉しい

}
