package co.yd.dto;

public class MemberDTO {
	private String mId;
	private String mPw;
	private String mName;
	private String mEmail;
	private String mPhone;
	private String mAddress1;
	private String mAddress2;
	private String mPostcode;
	private String gGrade;
	private String mSalt;
	private int sumOrder;
	
	public int getSumOrder() {
		return sumOrder;
	}
	public void setSumOrder(int sumOrder) {
		this.sumOrder = sumOrder;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmPostcode() {
		return mPostcode;
	}
	public void setmPostcode(String mPostcode) {
		this.mPostcode = mPostcode;
	}
	public String getgGrade() {
		return gGrade;
	}
	public void setgGrade(String gGrade) {
		this.gGrade = gGrade;
	}
	public String getmSalt() {
		return mSalt;
	}
	public void setmSalt(String mSalt) {
		this.mSalt = mSalt;
	}
	public String getmAddress1() {
		return mAddress1;
	}
	public void setmAddress1(String mAddress1) {
		this.mAddress1 = mAddress1;
	}
	public String getmAddress2() {
		return mAddress2;
	}
	public void setmAddress2(String mAddress2) {
		this.mAddress2 = mAddress2;
	}
	
}
