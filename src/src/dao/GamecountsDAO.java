package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.LoginUser;


public class GamecountsDAO {
	// ゲームをしたユーザのuser_idと時間を登録するメソッド
	public boolean gameInsert(LoginUser lu) {
	    Connection conn = null;
	    boolean result = false;

	    try {
	      // JDBCドライバの読み込み
	      Class.forName("org.h2.Driver");

	      // DBに接続
	      conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

	      // SQL文を用意
	      String sql = "insert into gamecounts (user_id, created_at, update_at) values ( ?, now(), now())";
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
	        if(conn != null) {
	          try {
	            conn.close();
	          }
	          catch (SQLException e) {
	            e.printStackTrace();
	          }
	        }
	    }

	    return result;
	  }

	// ユーザのゲーム回数をカウントするメソッド
	  public int gameCount(LoginUser lu) {
	    Connection conn = null;
	    int result;
	    result = 0;

	    try {
	      // JDBCドライバの読み込み
	    	Class.forName("org.h2.Driver");

	      // DBに接続
	      conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

	      // SQL文を用意
	      String sql = "select count (*) from gamecounts where user_id = ?";
	      PreparedStatement pStmt = conn.prepareStatement(sql);

	      // SQL文を完成させる
	      pStmt.setInt(1, lu.getUser_id());

	      // SQL文を実行
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
	        if(conn != null) {
	          try {
	            conn.close();
	          }
	          catch (SQLException e) {
	            e.printStackTrace();
	          }
	        }
	    }

	    return result;

	  }
	}


	/*public class GamecountsDAO {
		// ゲームをしたユーザのuser_idと時間を登録するメソッド
			public boolean gameInsert(LoginUser lu) {
				Connection conn = null;
				boolean result = false;

				try {
					// JDBCドライバを読み込む
					Class.forName("org.h2.Driver");

					// データベースに接続する
					conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

					// SQL文を準備する
					String sql = "insert into gamecounts (user_id, created_at, update_at) values ( ?, now(), now())";
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

			// ユーザのゲーム回数をカウントするメソッド
			public int gameCount(LoginUser lu) {
				Connection conn = null;
				int result = 0;

				try {
					// JDBCドライバを読み込む
					Class.forName("org.h2.Driver");

					// データベースに接続する
					conn = DriverManager.getConnection("jdbc:h2:file:C:\\dojo6Data\\B2", "sa", "");

					// SQL文を準備する
					String sql = "select count (*) from gamecounts where user_id = ?";
					PreparedStatement pStmt = conn.prepareStatement(sql);

					// SQL文を完成させる
					pStmt.setString(1, String.valueOf(lu.getUser_id()));

					// SQL文を実行する
					ResultSet rs = pStmt.executeQuery();
	//					rs.last();
	//					result = rs.getRow();
	//					rs.beforeFirst();
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

	}*/
