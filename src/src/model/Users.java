package model;
import java.io.Serializable;

public class Users implements Serializable {
	private String user_name;
	private String user_pw;

	public Users(String user_name, String user_pw) {
		this.user_name = user_name;
		this.user_pw = user_pw;
	}

	public Users() {
		this.user_name = "";
		this.user_pw = "";
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
}
