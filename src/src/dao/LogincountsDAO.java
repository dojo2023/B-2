package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.LoginUser;

public class LogincountsDAO {
	// ユーザのログインしたuser_idと時間を登録するメソッド
	public boolean loginInsert(LoginUser lu) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "insert into logincounts (user_id, created_at, update_at) values ( ?, now(), now())";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, String.valueOf(lu.getUser_id()));

			// SQL文を実行する
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
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

	// ユーザのログイン回数をカウントするメソッド
	public int loginCount(LoginUser lu) {
		Connection conn = null;
		int result = 0;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select count (*) from logincounts where user_id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, String.valueOf(lu.getUser_id()));

			// SQL文を実行する
			ResultSet rs = pStmt.executeQuery();
//				rs.last();
//				result = rs.getRow();
//				rs.beforeFirst();
			rs.next();
			result = rs.getInt(1);

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
