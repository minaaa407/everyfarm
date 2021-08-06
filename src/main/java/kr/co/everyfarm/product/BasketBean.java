package kr.co.everyfarm.product;

public class BasketBean {

	private String b_Id;
	private int b_Pno;
	private int b_Seedcount;
	private int b_Totalprice;
	
	public String getB_Id() {
		return b_Id;
	}
	public void setB_Id(String b_Id) {
		this.b_Id = b_Id;
	}
	public int getB_Pno() {
		return b_Pno;
	}
	public void setB_Pno(int b_Pno) {
		this.b_Pno = b_Pno;
	}
	public int getB_Seedcount() {
		return b_Seedcount;
	}
	public void setB_Seedcount(int b_Seedcount) {
		this.b_Seedcount = b_Seedcount;
	}
	public int getB_Totalprice() {
		return b_Totalprice;
	}
	public void setB_Totalprice(int b_Totalprice) {
		this.b_Totalprice = b_Totalprice;
	}
	
	@Override
	public String toString() {
		return "BasketBean [b_Id=" + b_Id + ", b_Pno=" + b_Pno + ", b_Seedcount=" + b_Seedcount + ", b_Totalprice="
				+ b_Totalprice + "]";
	}

	
	
	
}