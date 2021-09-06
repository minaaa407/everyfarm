package kr.co.everyfarm.board;

import java.util.List;

public class PagingBean {
	
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage = 5;
//	private List<Integer> q_No;
	private String q_Ptitle;
	private String q_Content;
	private Boolean q_Answer;
	private String f_Id;
	
	
	public String getF_Id() {
		return f_Id;
	}
	public void setF_Id(String f_Id) {
		this.f_Id = f_Id;
	}
	public String getQ_Ptitle() {
		return q_Ptitle;
	}
	public void setQ_Ptitle(String q_Ptitle) {
		this.q_Ptitle = q_Ptitle;
	}
	public String getQ_Content() {
		return q_Content;
	}
	public void setQ_Content(String q_Content) {
		this.q_Content = q_Content;
	}
	public Boolean getQ_Answer() {
		return q_Answer;
	}
	public void setQ_Answer(Boolean q_Answer) {
		this.q_Answer = q_Answer;
	}
	//	public List<Integer> getQ_No() {
//		return q_No;
//	}
//	public void setQ_No(List<Integer> q_No) {
//		this.q_No = q_No;
//	}
	public PagingBean() {
	}
	public PagingBean(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}	
	public int setCntPage() {
		return cntPage;
	}
	public void getCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	@Override
	public String toString() {
		return "PagingBean [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total="
				+ total + ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + ", q_Ptitle=" + q_Ptitle + ", q_Content=" + q_Content + ", q_Answer="
				+ q_Answer + ", f_Id=" + f_Id + "]";
	}
	
	
	
	
	
}