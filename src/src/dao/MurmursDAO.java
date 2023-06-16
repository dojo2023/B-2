package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Murmurs;

public class MurmursDAO {
	// 愚痴の取得メソッド
	public List<Murmurs> get() {
		Connection conn = null;
		List<Murmurs> cardList = new ArrayList<Murmurs>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select * from murmurs";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Murmurs card = new Murmurs(
				rs.getInt("ID"),
				rs.getInt("USER_ID"),
				rs.getString("TAG"),
				rs.getString("MURMUR"),
				rs.getBoolean("MURMUR_CHECK"),
				rs.getString("CREATED_AT"),
				rs.getString("UPDATE_AT")
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
}
