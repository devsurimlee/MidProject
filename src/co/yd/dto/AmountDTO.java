package co.yd.dto;

public class AmountDTO {
	String p_name;
	int amount_id;
	int p_id;
	String amount_size;
	String amount_color;
	int amount_count;
	
	// orderDetail에서 가져옴 Amount테이블에 없는 변수! 주문수량 체크용!
	int OrderProductCount;
	
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getAmount_id() {
		return amount_id;
	}
	public void setAmount_id(int amount_id) {
		this.amount_id = amount_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getAmount_size() {
		return amount_size;
	}
	public void setAmount_size(String amount_size) {
		this.amount_size = amount_size;
	}
	public String getAmount_color() {
		return amount_color;
	}
	public void setAmount_color(String amount_color) {
		this.amount_color = amount_color;
	}
	public int getAmount_count() {
		return amount_count;
	}
	public void setAmount_count(int amount_count) {
		this.amount_count = amount_count;
	}
	public int getOrderProductCount() {
		return OrderProductCount;
	}
	public void setOrderProductCount(int orderProductCount) {
		OrderProductCount = orderProductCount;
	}
	
}

