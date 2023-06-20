package model;

import java.io.Serializable;

public class Murmurs implements Serializable {
	private int id;
	private int user_id;
	private String tag;
	private String murmur;
	private boolean murmur_check;
	private boolean murmur_delete;
	private String created_at;
	private String update_at;

	public Murmurs(int id, int user_id, String tag, String murmur, boolean murmur_check, boolean murmur_delete,String created_at,
			String update_at) {
		this.id = id;
		this.user_id = user_id;
		this.tag = tag;
		this.murmur = murmur;
		this.murmur_check = murmur_check;
		this.murmur_delete = murmur_delete;
		this.created_at = created_at;
		this.update_at = update_at;
	}

	public Murmurs() {
		this.id = 0;
		this.user_id = 0;
		this.tag = "";
		this.murmur = "";
		this.murmur_check = true;
		this.murmur_delete = true;
		this.created_at = "";
		this.update_at = "";
	}

	public boolean isMurmur_delete() {
		return murmur_delete;
	}

	public void setMurmur_delete(boolean murmur_delete) {
		this.murmur_delete = murmur_delete;
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

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getMurmur() {
		return murmur;
	}

	public void setMurmur(String murmur) {
		this.murmur = murmur;
	}

	public boolean isMurmur_check() {
		return murmur_check;
	}

	public void setMurmur_check(boolean murmur_check) {
		this.murmur_check = murmur_check;
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
