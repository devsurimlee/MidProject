package co.yd.dto;

public class ProductDTO {
	int p_id;
	String p_name;
	int p_price;
	String p_size;
	String p_color;
	String p_detail;
	String p_category;
	String p_show_state;
	
	/// 베스트셀링용- 물품판매량
	int count_p_id;
	
	
	
	public int getP_id() {
		return p_id;
	}
	public int getCount_p_id() {
		return count_p_id;
	}
	public void setCount_p_id(int count_p_id) {
		this.count_p_id = count_p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
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
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public String getP_detail() {
		return p_detail;
	}
	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_show_state() {
		return p_show_state;
	}
	public void setP_show_state(String p_show_state) {
		this.p_show_state = p_show_state;
	}
	
	

}
