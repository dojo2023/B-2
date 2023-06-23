package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.LoginUser;
import model.Users;

public class UsersDAO {
	// ログイン出来たらtrueを返すメソッド
	public boolean isLoginOK(Users users) {
		Connection conn = null;
		boolean loginResult = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SELECT文を準備する
			String sql = "select count(*) from USERS where USER_NAME = ? and USER_PW = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, users.getUser_name());
			pStmt.setString(2,users.getUser_pw());

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーNAMEとパスワードが一致するユーザーがいたかどうかをチェックする
			rs.next();
			if (rs.getInt("count(*)") == 1) {
				loginResult = true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			loginResult = false;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			loginResult = false;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					loginResult = false;
				}
			}
		}

		// 結果を返す
		return loginResult;
	}

	//データの登録メソッド
	public boolean insert(Users card) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "insert into USERS (user_name, user_pw, created_at, update_at) values (?, ?, now(), now())";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる

			if (card.getUser_name() != null && !card.getUser_name().equals("")) {
				pStmt.setString(1, card.getUser_name());
			}
			else {
				pStmt.setString(1, null);
			}
			if (card.getUser_pw() != null && !card.getUser_pw().equals("")) {
				pStmt.setString(2, card.getUser_pw());
			}
			else {
				pStmt.setString(2, null);
			}

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


	// user_nameとuser_pwからuser_idとuser_nameを取り出すメソッド
	// user_idは特定の人の愚痴を取り出すときにつかったりする
	// user_nameはヘッダーに名前表示するのに使う
	// LoginServlet.javaでuser_idとuser_nameをセッションスコープに保存
	public LoginUser loginInfo(Users users) {
		Connection conn = null;
		LoginUser lu = new LoginUser();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select USER_ID, USER_NAME from USERS where USER_NAME = ? and USER_PW = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			if (users.getUser_name() != null) {
				pStmt.setString(1, users.getUser_name());
			}
			else {
				pStmt.setString(1, "");
			}
			if (users.getUser_pw() != null) {
				pStmt.setString(2, users.getUser_pw());
			}
			else {
				pStmt.setString(2, "");
			}

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			if(rs.next()) {
				//データあり
				lu = new LoginUser();
				lu.setUser_id(rs.getInt("user_id"));
				lu.setUser_name(rs.getString("user_name"));
				//lu = new LoginUser(rs.getInt("user_id"), rs.getString("user_name"));
			}else {
				//データなし
			}

			// LoginUserにuser_idとuser_nameを格納
			// ここが問題!!!!!!!!!

		}
		catch (SQLException e) {
			e.printStackTrace();
			lu = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			lu = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					lu = null;
				}
			}
		}

		// 結果を返す
		return lu;
	}
}
