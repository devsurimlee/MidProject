package co.yd.dto;

public class CartDTO {
	
	private int CartId; //장바구니번호(인덱스)
	private String mId; //멤버아이디
	private int amountId; //재고번호
	private int orderProductCount; //주문수량 
	
	public CartDTO() {
	}

	public int getCartId() {
		return CartId;
	}

	public void setCartId(int cartId) {
		CartId = cartId;
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
