package model;

import java.io.Serializable;

public class Eyecatches implements Serializable {
	private int id;
	private String tag;
	private String message;
	private String created_at;
	private String update_at;

	public Eyecatches(int id, String tag, String message, String created_at, String update_at) {
		this.id = id;
		this.tag = tag;
		this.message = message;
		this.created_at = created_at;
		this.update_at = update_at;
	}

	public Eyecatches() {
		this.id = 0;
		this.tag = "";
		this.message = "";
		this.created_at = "";
		this.update_at = "";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
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
