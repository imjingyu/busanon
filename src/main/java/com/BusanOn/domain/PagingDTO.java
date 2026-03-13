package com.BusanOn.domain;

public class PagingDTO {
//	ㄴ
	private int startPage, endPage;
	private boolean prev, next;
	
	private int total;
	
	private int pageNum;
	private int amount;
	
	public PagingDTO(int pageNum, int total) {
		this.pageNum = pageNum;
		this.amount = 10;
//		this.cri = cri;
		this.total = total;
		
		//시작페이지, 마지막페이지 계산
		this.endPage = (int)(Math.ceil(pageNum / 10.0)) * 10;
		this.startPage = this.endPage -9;
		
		
		int realEnd = (int)(Math.ceil(total * 1.0) / amount);
		if((int)(Math.ceil(total * 1.0) % amount) != 0) {
			realEnd += 1;
		};
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		//이전, 다음 버튼 표출 여부 결정
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalPage() {
		return total;
	}

	public void setTotalPage(int total) {
		this.total = total;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "PagingDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
}
