package ssm.cd.vo;

public class Value_SettingVO {
	private String vsNo;
	private String ssNo;
	private String vsFirst;
	private String vsSecond;
	private String vsThird;
	private String vsInsertdate;
	private String vsUpdatedate;
	
	@Override
	public String toString() {
		return "Value_SettingVO [vsNo=" + vsNo + ", ssNo=" + ssNo
				+ ", vsFirst=" + vsFirst + ", vsSecond=" + vsSecond
				+ ", vsThird=" + vsThird + ", vsInsertdate=" + vsInsertdate
				+ ", updatedate=" + vsUpdatedate + "]";
	}
	
	public String getVsNo() {
		return vsNo;
	}
	public void setVsNo(String vsNo) {
		this.vsNo = vsNo;
	}
	public String getSsNo() {
		return ssNo;
	}
	public void setSsNo(String ssNo) {
		this.ssNo = ssNo;
	}
	
	public String getVsFirst() {
		
		return vsFirst;
	}
	public void setVsFirst(String vsFirst) {
		System.out.println("vsFirst>>>"+vsFirst);
		this.vsFirst = vsFirst;
	}
	public String getVsSecond() {
		
		return vsSecond;
	}
	public void setVsSecond(String vsSecond) {
		System.out.println("vsSecond>>>"+vsSecond);
		this.vsSecond = vsSecond;
	}
	public String getVsThird() {
		return vsThird;
	}
	public void setVsThird(String vsThird) {
		System.out.println("vsthird>>>"+vsThird);
		this.vsThird = vsThird;
	}
	public String getVsInsertdate() {
		return vsInsertdate;
	}
	public String getVsUpdatedate() {
		return vsUpdatedate;
	}

	public void setVsUpdatedate(String vsUpdatedate) {
		this.vsUpdatedate = vsUpdatedate;
	}

	public void setVsInsertdate(String vsInsertdate) {
		this.vsInsertdate = vsInsertdate;
	}

}
