package co.yd.dto;

import java.sql.Date;

public class NoticeBoardDTO {
	private int nbId;
	private String nbTitle;
	private String nbContents;
	private Date nbDate;
	private int nbHit;
	
	public int getNbId() {
		return nbId;
	}
	public void setNbId(int nbId) {
		this.nbId = nbId;
	}
	public String getNbTitle() {
		return nbTitle;
	}
	public void setNbTitle(String nbTitle) {
		this.nbTitle = nbTitle;
	}
	public String getNbContents() {
		return nbContents;
	}
	public void setNbContents(String nbContents) {
		this.nbContents = nbContents;
	}
	public Date getNbDate() {
		return nbDate;
	}
	public void setNbDate(Date nbDate) {
		this.nbDate = nbDate;
	}
	public int getNbHit() {
		return nbHit;
	}
	public void setNbHit(int nbHit) {
		this.nbHit = nbHit;
	}
	
}
