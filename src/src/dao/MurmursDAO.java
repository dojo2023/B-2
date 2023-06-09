package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.LoginUser;
import model.Murmurs;

// データベースのMurmursテーブルにアクセスするクラス
// メソッドの引数「LoginUser lu」はuser_idを渡したいため、user_idとuser_nameが入っているLoginUserを渡してる
public class MurmursDAO {
	// 愚痴の取得メソッド
	// ログインしたユーザのuser_idを渡すことで、そのuser_idの人の愚痴の情報を取り出すことができる
	// TopServletのdoGet()メソッドでこのメソッドで呼び出してセッションスコープにいれた
	// このメソッドを呼び出すと、Murmurs（modelを見てもらったら分かるかも）のList型を戻り値として受け取ることができる
	public List<Murmurs> get(LoginUser lu) {
		Connection conn = null;
		List<Murmurs> cardList = new ArrayList<Murmurs>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select * from murmurs WHERE user_id = ? AND murmur_delete is false";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, String.valueOf(lu.getUser_id()));
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
				rs.getBoolean("MURMUR_DELETE"),
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

	// 直近1週間の愚痴取得メソッド
	// TopServletのdoGet()メソッドでこのメソッドで呼び出してリクエストスコープにいれた
	public List<Murmurs> getOneWeek(LoginUser lu) {
		Connection conn = null;
		List<Murmurs> weekList = new ArrayList<Murmurs>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select * from murmurs WHERE user_id = ? AND created_at > (current_date -7) AND murmur_delete is false";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, String.valueOf(lu.getUser_id()));
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
				rs.getBoolean("MURMUR_DELETE"),
				rs.getString("CREATED_AT"),
				rs.getString("UPDATE_AT")
				);
				weekList.add(card);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			weekList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			weekList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					weekList = null;
				}
			}
		}

		// 結果を返す
		return weekList;
	}

	// checkがfalseの愚痴の取得メソッド
	// このメソッドはcheckがtrue、deleteがfalseの愚痴を取得することができる
	// このメソッドはゲーム開始時（GameCheckServletのdoPostメソッド内（ゲーム開始のボタンが押されたとき））に
	// 呼び出して、結果をセッションスコープに入れる
	// よってチェックを付けた愚痴のみをゲームに表示することができる
	public List<Murmurs> chTrueDeFalse(LoginUser lu) {
		Connection conn = null;
		List<Murmurs> cardList = new ArrayList<Murmurs>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select * from MURMURS where USER_ID = ? and MURMUR_DELETE is false and MURMUR_CHECK is true";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, String.valueOf(lu.getUser_id()));

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
				rs.getBoolean("MURMUR_DELETE"),
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

	// 新しい順(登録した順)愚痴の取得メソッド
	// 愚痴一覧画面で並び替え選択して送信ボタン押したときに使用するメソッド
	// MurListServletのdoPostメソッド内で呼び出している
	public List<Murmurs> getNew(LoginUser lu) {
		Connection conn = null;
		List<Murmurs> cardList = new ArrayList<Murmurs>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select * from murmurs WHERE user_id = ? AND murmur_delete is false order by id desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, String.valueOf(lu.getUser_id()));
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
				rs.getBoolean("MURMUR_DELETE"),
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

	// 古い順愚痴の取得メソッド
	// getNewと同じ
	public List<Murmurs> getOld(LoginUser lu) {
		Connection conn = null;
		List<Murmurs> cardList = new ArrayList<Murmurs>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select * from murmurs WHERE user_id = ? AND murmur_delete is false order by id asc";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, String.valueOf(lu.getUser_id()));
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
				rs.getBoolean("MURMUR_DELETE"),
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

	// タグごとの愚痴の取得メソッド
	// getNew、getOldと同じ
	public List<Murmurs> getTag(LoginUser lu) {
		Connection conn = null;
		List<Murmurs> cardList = new ArrayList<Murmurs>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select * from murmurs WHERE user_id = ? AND murmur_delete is false order by tag desc";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, String.valueOf(lu.getUser_id()));
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
				rs.getBoolean("MURMUR_DELETE"),
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

	// 愚痴の登録メソッド
	// MurInServletメソッドで使用
	// 引数でログインしているuser_idと、選択したタグ（tag）と、入力した愚痴（murmur）をこのinsertメソッドに渡すことで
	// データベースにアクセスして登録することができる
	public boolean insert(int user_id, String tag, String murmur) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "insert into Murmurs (user_id, tag, murmur, created_at, update_at) values ( ?, ?, ?, now(), now())";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setString(1, String.valueOf(user_id));
			pStmt.setString(2, tag);
			pStmt.setString(3, murmur);

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

	// チェックボックス変更メソッド（falseからtrue）
	// 愚痴のid（オートインクリメント）を引数で渡すと、checkをfalseからtrueにupdateするメソッド
	// GameCheckServletのdoPostメソッドで使用
	// チェックボックスにチェックをつけてゲーム画面にsubmitするとcheckをfalseからtrueにupdateされる
	// こうすることでラムゲームで表示する愚痴をチェックつけたものだけにできる
	public boolean updateCheck(int id) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "update MURMURS set MURMUR_CHECK =true where ID= ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, id);


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

	// murmur_checkがtrue でかつ murmur_deleteがfalseのデータのmurmur_checkはfalseにするメソッド
	// ゲーム途中でやめて愚痴を完全に消さなかった時、またチェックボックスのところに表示させるためこのメソッドがある
	// GameCheckServletのdoGet()メソッドで使用
	public boolean updateMurFalse(LoginUser lu) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "update MURMURS set MURMUR_CHECK = false where USER_ID = ? and MURMUR_CHECK = true and MURMUR_DELETE = false";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, lu.getUser_id());

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

	// murmur_checkがtrue でかつ murmur_deleteがfalseのデータのmurmur_deleteをtrueにupdateするメソッド
	// ゲーム終了後に呼び出して愚痴を完全に削除する
	// 各ゲーム終了後のdoPost()メソッドで使用
	// これで、ゲーム終了後に出るモーダルで選択（submit）すると、このメソッドが呼ばれる
	public boolean updateDeleteTrue(LoginUser lu) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "update MURMURS set MURMUR_DELETE = true where USER_ID = ? and MURMUR_CHECK = true and MURMUR_DELETE = false";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, lu.getUser_id());

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

	// murmur_checkもmurmur_deleteもtrueにupdateするメソッド
	// 愚痴一覧画面の削除ボタンで使用すると完全にkillする
	// MurListServletのdoPost()メソッドで使用
	public boolean updateCheckDelete(int id) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "update MURMURS set MURMUR_CHECK = true, MURMUR_DELETE = true where ID= ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, id);


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

	// ユーザの愚痴の件数をカウントするメソッド(詳しく言えばuser_idが○○の人のmurmursテーブルに入ってる行数数えてるだけ)
	// 愚痴一覧表示のポップアップ表示条件に使用
	// MurListServletのdoGet()メソッドで使用
	public int murCount(LoginUser lu) {
		Connection conn = null;
		int result = 0;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

			// SQL文を準備する
			String sql = "select count (*) from murmurs where user_id = ? and murmur_check is false and murmur_delete is false";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を完成させる
			pStmt.setInt(1, lu.getUser_id());

			// SQL文を実行する
			ResultSet rs = pStmt.executeQuery();
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
