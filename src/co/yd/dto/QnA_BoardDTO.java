package co.yd.dto;

import java.sql.Date;

public class QnA_BoardDTO {
	private int QB_id; //QnA board ID
	private String m_id;
	private String QB_title;
	private String QB_contents;
	private Date QB_date;
	private int QB_hit;
	private int QB_origin;
	
	public QnA_BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getQB_id() {
		return QB_id;
	}

	public void setQB_id(int qB_id) {
		QB_id = qB_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getQB_title() {
		return QB_title;
	}

	public void setQB_title(String qB_title) {
		QB_title = qB_title;
	}

	public String getQB_contents() {
		return QB_contents;
	}

	public void setQB_contents(String qB_contents) {
		QB_contents = qB_contents;
	}

	public Date getQB_date() {
		return QB_date;
	}

	public void setQB_date(Date qB_date) {
		QB_date = qB_date;
	}

	public int getQB_hit() {
		return QB_hit;
	}

	public void setQB_hit(int qB_hit) {
		QB_hit = qB_hit;
	}

	public int getQB_origin() {
		return QB_origin;
	}

	public void setQB_origin(int qB_origin) {
		QB_origin = qB_origin;
	}
}
