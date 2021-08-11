package kr.co.everyfarm.basket;

public class BasketBean {

	private int b_No;
	private String b_Id;
	private int b_Pno;
	private int b_Land;
	
	private String p_Img;
	private String p_Title;
	private String p_Manpay;
	private String p_Landprice;
	private int p_Landavailable;
	
	private String b_Seed;
	private int b_Totalprice;
	public int getB_No() {
		return b_No;
	}
	public void setB_No(int b_No) {
		this.b_No = b_No;
	}
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
	public int getB_Land() {
		return b_Land;
	}
	public void setB_Land(int b_Land) {
		this.b_Land = b_Land;
	}
	public String getP_Img() {
		return p_Img;
	}
	public void setP_Img(String p_Img) {
		this.p_Img = p_Img;
	}
	public String getP_Title() {
		return p_Title;
	}
	public void setP_Title(String p_Title) {
		this.p_Title = p_Title;
	}
	public String getP_Manpay() {
		return p_Manpay;
	}
	public void setP_Manpay(String p_Manpay) {
		this.p_Manpay = p_Manpay;
	}
	public String getP_Landprice() {
		return p_Landprice;
	}
	public void setP_Landprice(String p_Landprice) {
		this.p_Landprice = p_Landprice;
	}
	public int getP_Landavailable() {
		return p_Landavailable;
	}
	public void setP_Landavailable(int p_Landavailable) {
		this.p_Landavailable = p_Landavailable;
	}
	public String getB_Seed() {
		return b_Seed;
	}
	public void setB_Seed(String b_Seed) {
		this.b_Seed = b_Seed;
	}
	public int getB_Totalprice() {
		return b_Totalprice;
	}
	public void setB_Totalprice(int b_Totalprice) {
		this.b_Totalprice = b_Totalprice;
	}
	@Override
	public String toString() {
		return "BasketBean [b_No=" + b_No + ", b_Id=" + b_Id + ", b_Pno=" + b_Pno + ", b_Land=" + b_Land + ", p_Img="
				+ p_Img + ", p_Title=" + p_Title + ", p_Manpay=" + p_Manpay + ", p_Landprice=" + p_Landprice
				+ ", p_Landavailable=" + p_Landavailable + ", b_Seed=" + b_Seed + ", b_Totalprice=" + b_Totalprice
				+ "]";
	}
	

	
	
	
	
	
	
}