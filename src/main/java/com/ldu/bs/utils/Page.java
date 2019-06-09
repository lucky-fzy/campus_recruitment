package com.ldu.bs.utils;

import java.util.List;

public class Page<T> {

	//总条数
	private Integer total;
	//当前页
	private Integer currentPage=1;
	//页条数
	private Integer pageSize=10;
	//总页数
	@SuppressWarnings("unused")
	private Integer totalPages;
	//当前页的书数据
	private List<T> rows;
	//url
	private String url;

	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalPages() {
		Integer totalPages = total/pageSize;
		return total%pageSize == 0 ? totalPages : totalPages + 1;
	}
	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
}
