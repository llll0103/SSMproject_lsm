package ssm.cg.common.vo;

public class oaCommonVO {
	
	// ����¡
	private int page; 		// ���� ������
	private int pageSize; 	// �� �������� ������ ���ڵ�
	private String startRow; 	// ���� �ο�
	private String endRow; 	// ������ �ο�
	
	private String rowNo; 
	private String totalCount;
	
	
	// �¶��� ��� �Խ���
	// �˻�
	private String search;	// �˻�Ű����
	private String keyword; // �˻���
	
	// ����
	private String orderBy;
	private String orderSc;
	
	//e��Ʈ������ �񱳰���������ȣ�� �����������ȣ ����
	private String brpageNo;
	private String cgpageNo;
	
	//e��Ʈ������ ���μ���,�񱳰�,��� �г⸶�� �˻��Ҷ� ����ϴ� ������
	private String cdyearNo;
	private String bryearNo;
	private String cgyearNo;
	
	// get, set
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getStartRow() {
		return startRow;
	}
	public void setStartRow(String startRow) {
		this.startRow = startRow;
	}
	public String getEndRow() {
		return endRow;
	}
	public void setEndRow(String endRow) {
		this.endRow = endRow;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getOrderSc() {
		return orderSc;
	}
	public void setOrderSc(String orderSc) {
		this.orderSc = orderSc;
	}
	public String getRowNo() {
		return rowNo;
	}
	public void setRowNo(String rowNo) {
		this.rowNo = rowNo;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getBrpageNo() {
		return brpageNo;
	}
	public void setBrpageNo(String brpageNo) {
		this.brpageNo = brpageNo;
	}
	public String getCgpageNo() {
		return cgpageNo;
	}
	public void setCgpageNo(String cgpageNo) {
		this.cgpageNo = cgpageNo;
	}
	public String getCdyearNo() {
		return cdyearNo;
	}
	public void setCdyearNo(String cdyearNo) {
		this.cdyearNo = cdyearNo;
	}
	public String getBryearNo() {
		return bryearNo;
	}
	public void setBryearNo(String bryearNo) {
		this.bryearNo = bryearNo;
	}
	public String getCgyearNo() {
		return cgyearNo;
	}
	public void setCgyearNo(String cgyearNo) {
		this.cgyearNo = cgyearNo;
	}
	
	

	
	
}
