package co.yd.dto;

public class OrderDetailDTO {
	private int orderDetailId;
	private int orderId;
	private int productId;
	private int amountId;
	private int orderProductCount; //주문수량
	//// 추가
	private String pName;
	private String aSize;
	private String aColor;
	private String pPrice;
	
	public OrderDetailDTO() {
	}

	public int getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
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
	
	// 추가
	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getaSize() {
		return aSize;
	}

	public void setaSize(String aSize) {
		this.aSize = aSize;
	}

	public String getaColor() {
		return aColor;
	}

	public void setaColor(String aColor) {
		this.aColor = aColor;
	}

	public String getpPrice() {
		return pPrice;
	}

	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
}
