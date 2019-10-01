package co.yd.dto;

import java.sql.Date;

//재고추가 테이블
public class Add_AmountDTO {
	private int amountId; //재고번호
	private Date warehousingDate; //입고날짜
	private int warehousedStocks; //입고수량
	
	public Add_AmountDTO() {
	}


	public int getAmountId() {
		return amountId;
	}


	public void setAmountId(int amountId) {
		this.amountId = amountId;
	}


	public Date getWarehousingDate() {
		return warehousingDate;
	}

	public void setWarehousingDate(Date warehousingDate) {
		this.warehousingDate = warehousingDate;
	}

	public int getWarehousedStocks() {
		return warehousedStocks;
	}

	public void setWarehousedStocks(int warehousedStocks) {
		this.warehousedStocks = warehousedStocks;
	}

}
