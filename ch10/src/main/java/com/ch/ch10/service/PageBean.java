package com.ch.ch10.service;


public class PageBean {
	private int currentPage;	private int rowPerPage;
	private int total;			private int totalPage;
	private int pagePerBlock = 10;
	private int startPage;		private int endPage;
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public PageBean(int currentPage, int rowPerPage, int total) {
		this.currentPage = currentPage; this.rowPerPage = rowPerPage;
		this.total = total;
		//                          (double)457/10=> 45.7 => 46.0
		totalPage = (int)(Math.ceil((double)total/rowPerPage));
		//            15  -  (       15 - 1=> 14 % 10 => 4 ) 11부터
		startPage = currentPage - (currentPage - 1) % pagePerBlock;
		//         11       + 10 => 21 - 1 = 20    !! ~ 20사이
		endPage = startPage + pagePerBlock - 1;
		//    460    457  endPage가 totalPage보다 클 수 없으므호 457로 변경
		if (endPage > totalPage) endPage = totalPage;
	}
}