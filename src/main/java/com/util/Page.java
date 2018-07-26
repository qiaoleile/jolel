package com.util;

public class Page {
	private int pageIndex = 1;
	private int pageSize = 10;
	private int begin = 0;

	public Page() {

		super();
	}

	public Page(int pageIndex, int pageSize) {
		if (pageIndex > 0) {
			this.pageIndex = pageIndex;
		}

		if (pageSize > 0) {
			this.pageSize = pageSize;
		}

		// 因为最终是给MySQL使用，所以起始数从0开始
		this.begin = (pageIndex - 1) * pageSize;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

}
