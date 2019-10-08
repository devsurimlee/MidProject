package co.yd.dto;

import java.sql.Date;

public class QnaBoardDTO {
	private int qbId; //QnA board ID
	private String mId;
	private String mName;
	private String qbTitle;
	private String qbContents;
	private Date qbDate;
	private int qbHit;
	private int qbOrigin;
	private int qbPw;
	
	public int getQbId() {
		return qbId;
	}
	public void setQbId(int qbId) {
		this.qbId = qbId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getQbTitle() {
		return qbTitle;
	}
	public void setQbTitle(String qbTitle) {
		this.qbTitle = qbTitle;
	}
	public String getQbContents() {
		return qbContents;
	}
	public void setQbContents(String qbContents) {
		this.qbContents = qbContents;
	}
	public Date getQbDate() {
		return qbDate;
	}
	public void setQbDate(Date qbDate) {
		this.qbDate = qbDate;
	}
	public int getQbHit() {
		return qbHit;
	}
	public void setQbHit(int qbHit) {
		this.qbHit = qbHit;
	}
	public int getQbOrigin() {
		return qbOrigin;
	}
	public void setQbOrigin(int qbOrigin) {
		this.qbOrigin = qbOrigin;
	}
	public int getQbPw() {
		return qbPw;
	}
	public void setQbPw(int qbPw) {
		this.qbPw = qbPw;
	}
}
