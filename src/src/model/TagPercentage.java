package model;

import java.io.Serializable;

public class TagPercentage implements Serializable {
	private String tag;
	private int orders;
	private int percentage_of_orders;

	public TagPercentage (String tag, int orders, int percentage_of_orders) {
		this.tag = tag;
		this.orders = orders;
		this.percentage_of_orders = percentage_of_orders;
	}

	public TagPercentage() {
		this.tag = "";
		this.orders = 0;
		this.percentage_of_orders = 0;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getOrders() {
		return orders;
	}

	public void setOrders(int orders) {
		this.orders = orders;
	}

	public int getPercentage_of_orders() {
		return percentage_of_orders;
	}

	public void setPercentage_of_orders(int percentage_of_orders) {
		this.percentage_of_orders = percentage_of_orders;
	}


}
// 追加
// 追加2