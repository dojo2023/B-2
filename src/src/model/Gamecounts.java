package model;

import java.io.Serializable;

public class Gamecounts implements Serializable{
	private int id;
	private int user_id;
	private String created_at;
	private String update_at;

	public Gamecounts(int id, int user_id, String created_at, String update_at) {
		this.id = id;
		this.user_id = user_id;
		this.created_at = created_at;
		this.update_at = update_at;
	}

	public Gamecounts() {
		this.id = 0;
		this.user_id = 0;
		this.created_at = "";
		this.update_at = "";
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUpdate_at() {
		return update_at;
	}

	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}



}
