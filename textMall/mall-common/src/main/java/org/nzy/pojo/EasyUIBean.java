package org.nzy.pojo;

import java.util.List;

public class EasyUIBean {
	
	private long total;
	private List<?> rows;
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	public EasyUIBean(long total, List<?> rows) {
		
		this.total = total;
		this.rows = rows;
	}
	public EasyUIBean() {
		
	}
	@Override
	public String toString() {
		return "EasyUIBean [total=" + total + ", rows=" + rows + "]";
	}
	
	
}
