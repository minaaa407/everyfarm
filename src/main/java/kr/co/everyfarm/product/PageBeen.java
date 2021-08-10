package kr.co.everyfarm.product;

public class PageBeen {
	
	private int pagestart;//보여지는 페이지 시작 지점.
	private int pageend;//보여지는 페이지 번호 끝?
	private int endnumber;//limit에 따른 페이지 종료 숫자.
	private int selectpage; //사용자가 원하는 페이지 번호
	private int limit;//한페이지 been 출력 갯수
	private int offset;//offset select 시작 위치 selectpage-1 * limit로 처리하기.
	private int tableindex;//테이블 총 인덱스 수 db 총 갯수.
	private int pagingnumber;//하단 페이징 갯수.
	boolean pro;//이전 유무
	boolean post;//이후 유무
	String where;
	String wherecolumn;
	
	public int getSelectpage() {
		return selectpage;
	}
	public void setSelectpage(int selectpage) {
		
		pagestart = (int)(Math.floor((double)(selectpage-1)/pagingnumber)) ;
		pagestart = (pagestart * pagingnumber)+1;
		pageend = pagestart + pagingnumber -1;
		if(pagestart >= endnumber) {
			pagestart = endnumber;
		}
		if(pageend >= endnumber) {
			pageend = endnumber;
			post = false;
		}else {
			post = true;
		}
		if(pagestart == 1) {
			pro = false;
		}else {
			pro = true;
		}
		
		
		this.selectpage = selectpage;
	}


	public int getTableindex() {

		return tableindex;
	}


	public void setTableindex(int tableindex) {
		int result = (int)(Math.ceil((double)tableindex/limit));
		endnumber = result;
		
		pagestart = (int)(Math.floor((double)(selectpage-1)/pagingnumber)) ;
		pagestart = (pagestart * pagingnumber)+1;
		pageend = pagestart + pagingnumber -1;

		if(pagestart >= endnumber) {
			pagestart = endnumber;
		}
		if(pageend >= endnumber) {
			pageend = endnumber;

			post = false;
		}else {
			post = true;
		}
		if(pagestart == 1) {
			pro = false;
		}else {
			pro = true;
		}
		this.tableindex = tableindex;
	}
	
	public PageBeen() {
		this.pagestart = 1;
		this.selectpage = 1;
		this.limit = 3;
		this.offset = 0;
		this.pagingnumber = 5;
		this.pro = false;
		this.post = false;
		this.where = "p_Id";
		this.wherecolumn = "%%";
	}
	
	
	public boolean isPro() {
		return pro;
	}


	public void setPro(boolean pro) {
		this.pro = pro;
	}


	public boolean isPost() {
		return post;
	}


	public void setPost(boolean post) {
		this.post = post;
	}


	public String getWhere() {
		return where;
	}


	public void setWhere(String where) {
		this.where = where;
	}


	public String getWherecolumn() {
		return wherecolumn;
	}


	public void setWherecolumn(String wherecolumn) {
		this.wherecolumn = wherecolumn;
	}


	public int getOffset() {
		int a = getSelectpage()-1;//페이지 번호
		int b = getLimit();
		//현재 페이지와 몇개 출력 합쳐서 offset 만들기
		
		this.offset = a*b;
		return offset;
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

	public int getPagingnumber() {
		return pagingnumber;
	}
	public void setPagingnumber(int pagingnumber) {
		this.pagingnumber = pagingnumber;
	}
	
	
	
	
	
	
}