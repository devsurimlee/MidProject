package co.yd.dto;

import java.sql.Date;

public class AddAmountDTO {
	int amount_id;
	Date aa_Date;
	int aa_Count;
	public int getAmount_id() {
		return amount_id;
	}
	public void setAmount_id(int amount_id) {
		this.amount_id = amount_id;
	}
	public Date getAa_Date() {
		return aa_Date;
	}
	public void setAa_Date(Date aa_Date) {
		this.aa_Date = aa_Date;
	}
	public int getAa_Count() {
		return aa_Count;
	}
	public void setAa_Count(int aa_Count) {
		this.aa_Count = aa_Count;
	}
	

}
