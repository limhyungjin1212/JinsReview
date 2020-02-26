package com.lhj.model;

public class PageVO {
	//페이징의 시작 번호 
	private int startPage;
	//페이징의 끝 번호
	private int endPage;
	//페이징의 이전
	private boolean prev;
	//페이징의 다음
	private boolean next;
	
	private int total;
	private Criteria cri;
	
	public PageVO(Criteria cri , int total) { //매개변수 2개인 생성자
		 this.cri= cri;
		 this.total = total;
		 
		 //페이징의 끝 번호를 알 수 있게 계산 Math.ceil ->소수점 이하는 올림해주는 함수
		//getPageNum으로 현재 페이지를 받아오고. ex)2페이지면 2/10.0 -> 0.2 ->Math.ceil함수로 1이되고 *10으로 endPage는 10이된다
		 this.endPage =(int)(Math.ceil(cri.getPageNum()/10.0))*10;  
		 //시작 페이지는 끝페이지를 구한것에 -9
		 this.startPage = this.endPage-9;
		 //전체 게시글 수를 불러와서 ex)123개면 *1.0 = 123.0 /10 -> 12.3 ->Math.ceil함수로 13이된다. 총페이지
		 int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		 
		 //총페이지가 끝페이지보다 작다면 ex)총페이지는 13. endPage는 20일텐데 총페이지가 끝페이지보다 작으니 endPage를 끝페이지로만들어준다.
		 if(realEnd < this.endPage) {
			 this.endPage = realEnd; 
		 }
		 
		 this.prev = this.startPage>1;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}

	
	
}
