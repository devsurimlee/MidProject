package co.yd.dto;

public class GradeDTO {
	private String gradeName; //등급명
	private int gradeDiscount; //등급별 할인액
	private int gradeStandard; //등급기준금액
	
	public GradeDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getGradeDiscount() {
		return gradeDiscount;
	}

	public void setGradeDiscount(int gradeDiscount) {
		this.gradeDiscount = gradeDiscount;
	}

	public int getGradeStandard() {
		return gradeStandard;
	}

	public void setGradeStandard(int gradeStandard) {
		this.gradeStandard = gradeStandard;
	}
}
