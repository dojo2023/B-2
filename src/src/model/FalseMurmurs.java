package model;

public class FalseMurmurs {
	private int uesr_id;
	private String murmur;

	public FalseMurmurs(int uesr_id, String murmur) {
		this.uesr_id = uesr_id;
		this.murmur = murmur;
	}

	public FalseMurmurs() {
		this(0,null);
	}

	public int getUesr_id() {
		return uesr_id;
	}
	public void setUesr_id(int uesr_id) {
		this.uesr_id = uesr_id;
	}
	public String getMurmur() {
		return murmur;
	}
	public void setMurmur(String murmur) {
		this.murmur = murmur;
	}


}
