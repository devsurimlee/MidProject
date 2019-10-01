package co.yd.dto;

//재고테이블
public class AmountDTO {
	private int amountId; //재고번호(인덱스)
	private int productId; //상품번호
	private String amountSize; 
	private String amountColor;
	private int amountCount; //재고수량
	
	public AmountDTO() {
	}

	public int getAmountId() {
		return amountId;
	}

	public void setAmountId(int amountId) {
		this.amountId = amountId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getAmountSize() {
		return amountSize;
	}

	public void setAmountSize(String amountSize) {
		this.amountSize = amountSize;
	}

	public String getAmountColor() {
		return amountColor;
	}

	public void setAmountColor(String amountColor) {
		this.amountColor = amountColor;
	}

	public int getAmountCount() {
		return amountCount;
	}

	public void setAmountCount(int amountCount) {
		this.amountCount = amountCount;
	}
	
}
