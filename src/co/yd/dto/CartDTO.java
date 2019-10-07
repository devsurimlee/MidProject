package co.yd.dto;

public class CartDTO {
	
	private int cartId; //장바구니번호(인덱스)
	private String mId; //멤버아이디
	private int amountId; //재고번호
	private int orderProductCount; //주문수량 
	
	// 테이블 조인용
	private int p_id;
	private String amount_size;
	private String amount_color;
	private int amount_count;
	private String p_name;
	private int p_price;
	private String p_detail;
	private int a_count;
	
	
	
	public CartDTO() {
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




	public int getA_count() {
		return a_count;
	}




	public void setA_count(int a_count) {
		this.a_count = a_count;
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




	public String getP_detail() {
		return p_detail;
	}




	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}




	public int getCartId() {
		return cartId;
	}


	public void setCartId(int cartId) {
		this.cartId = cartId;
	}


	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getAmountId() {
		return amountId;
	}

	public void setAmountId(int amountId) {
		this.amountId = amountId;
	}

	public int getOrderProductCount() {
		return orderProductCount;
	}

	public void setOrderProductCount(int orderProductCount) {
		this.orderProductCount = orderProductCount;
	}
	
}
