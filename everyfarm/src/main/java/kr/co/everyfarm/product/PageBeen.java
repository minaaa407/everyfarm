package kr.co.everyfarm.product;

public class PageBeen {
	
	int pagestart =0;
	int pageend = 0;
	int endnumber = 0;
	int selectpage = 1; //사용자가 원하는 페이지 번호
	int limit = 3;//한페이지 출력 갯수
	int offset = 0;//offset select 시작 위치 selectpage-1 * limit로 처리하기.
	public int getOffset() {
		int a = getSelectpage()-1;
		int b = getLimit();
		//현재 페이지와 몇개 출력 합쳐서 offset 만들기
		return a*b;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	public int getPagestart() {
		return pagestart;
	}
	public void setPagestart(int pagestart) {
		this.pagestart = pagestart;
	}
	public int getPageend() {
		return pageend;
	}
	public void setPageend(int pageend) {
		this.pageend = pageend;
	}
	public int getEndnumber() {
		return endnumber;
	}
	public void setEndnumber(int endnumber) {
		this.endnumber = endnumber;
	}

	public int getSelectpage() {
		return selectpage;
	}
	public void setSelectpage(int selectpage) {
		this.selectpage = selectpage;
	}

	
	
	
	
	
	
}
