package co.yd.dto;

import java.sql.Date;

public class OrderDTO {
	private int orderId;
	private Date orderDate;
	private Date orderDeliveredDate;
	private String mId;
	private String orderName;
	private String orderAddress1;
	private String orderPostCode;
	private String orderPhoneNum;
	private int orderTotalPrice;
	private String orderDeliverState;
	private String orderAddress2;
	
	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getOrderDeliveredDate() {
		return orderDeliveredDate;
	}

	public void setOrderDeliveredDate(Date orderDeliveredDate) {
		this.orderDeliveredDate = orderDeliveredDate;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderAddress1() {
		return orderAddress1;
	}

	public void setOrderAddress1(String orderAddress1) {
		this.orderAddress1 = orderAddress1;
	}

	public String getOrderPostCode() {
		return orderPostCode;
	}

	public void setOrderPostCode(String orderPostCode) {
		this.orderPostCode = orderPostCode;
	}

	public String getOrderPhoneNum() {
		return orderPhoneNum;
	}

	public void setOrderPhoneNum(String orderPhoneNum) {
		this.orderPhoneNum = orderPhoneNum;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public String getOrderDeliverState() {
		return orderDeliverState;
	}

	public void setOrderDeliverState(String orderDeliverState) {
		this.orderDeliverState = orderDeliverState;
	}

	public String getOrderAddress2() {
		return orderAddress2;
	}

	public void setOrderAddress2(String orderAddress2) {
		this.orderAddress2 = orderAddress2;
	}

}
