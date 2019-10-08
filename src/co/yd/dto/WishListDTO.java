package co.yd.dto;

public class WishListDTO {
	private int wishList_id;
	private String m_id;
	private int p_id;
	
	//다중테이블용
	private String p_name;
	private int p_price;
	private String p_color;
	private String p_size;
	private String p_detail;
	
	
	
	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_color() {
		return p_color;
	}

	public void setP_color(String p_color) {
		this.p_color = p_color;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}

	public WishListDTO() {
	}

	public int getWishList_id() {
		return wishList_id;
	}

	public void setWishList_id(int wishList_id) {
		this.wishList_id = wishList_id;
	}


	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
}
