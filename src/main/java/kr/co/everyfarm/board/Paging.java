
package kr.co.everyfarm.board;

import java.util.Arrays;

public class Paging {
	private int pageNum;

	private int amount;

	private int skip;
	
	private String keyword;
	
	private String type;

	private String[] typeArr;
	
	private String f_Id;
	
	private String m_Id;
	
	private String p_Id;
	
	public Paging() {
		this(1, 10);
		this.skip = 0;
	}

	public Paging(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum - 1) * amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {

		this.skip = (pageNum - 1) * this.amount;

		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {

		this.skip = (this.pageNum - 1) * amount;

		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	public String getF_Id() {
		return f_Id;
	}

	public void setF_Id(String f_Id) {
		this.f_Id = f_Id;
	}
	

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}
	
	

	public String getP_Id() {
		return p_Id;
	}

	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}

	@Override
	public String toString() {
		return "Paging [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", keyword=" + keyword
				+ ", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + ", f_Id=" + f_Id + ", m_Id=" + m_Id
				+ ", p_Id=" + p_Id + "]";
	}




}