package model;

import java.io.Serializable;

public class LoginUser implements Serializable {
	/*private String user_id;	// ログイン時のユーザID
	*/
	private String user_name; // ログイン時のユーザネーム

	public LoginUser() {
		this(null);
	}

	public LoginUser(String user_name) {
		/*this.user_id = user_id;*/
		this.user_name = user_name;
	}

	/*public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}*/

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


}
