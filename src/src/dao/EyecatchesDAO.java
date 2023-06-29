package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.LoginUser;
import model.TagPercentage;

public class EyecatchesDAO {
	// メソッド①　タグの割合をリスト形式で持ってくる
	// getPercent()メソッドにLoginUserの変数を引数として渡すことで処理を行ってTagPercentageのリスト型で戻り値を設定してる
	public List<TagPercentage> getPercent(LoginUser lu) {
		Connection conn = null;
		List<TagPercentage> tagPersentList = new ArrayList<TagPercentage>();

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
				tagPersentList.add(card);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			tagPersentList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			tagPersentList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					tagPersentList = null;
				}
			}
		}

		// 結果を返す
		return tagPersentList;
	}

	// メソッド②　tag=? でEyecatchesのメッセージをもらうメソッド
	// ランダムでもらえたら嬉しい
	// 一番order（愚痴の数）が多いタグを引数で渡すことで、アイキャッチのメッセージをランダムで貰うメソッド
	// SQLは変数として渡されたタグでselectされて、ランダムで並び変えた1番上のメッセージを取得している
	public String getMessage(String tag) {
		Connection conn = null;
		String result = "ぼくはラムだよ！ これからよろしく！";

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
//			String sql = "select * from eyecatches where tag = '?' order by rand() limit 1";
			String sql = "select * from eyecatches where tag = ? order by rand() limit 1";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1,tag);

			// SQL文を実行し、引数で渡したタグのメッセージを取得する
			// String型で帰ってくる
			ResultSet rs = pStmt.executeQuery();
			rs.next();
			result = rs.getString("message");


		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		// 結果を返す
		return result;
	}
}
