package ssm.cg.common.vo;

public class CommonVO {
	
	// ����¡
	private int page; 		// ���� ������
	private int pageSize; 	// �� �������� ������ ���ڵ�
	private String startRow; 	// ���� �ο�
	private String endRow; 	// ������ �ο�
	
	// �¶��� ��� �Խ���
	// �˻�
	private String search;	// �˻�Ű����
	private String keyword; // �˻���
	
	// ����
	private String orderBy;
	private String orderSc;
	
	
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

	
}
