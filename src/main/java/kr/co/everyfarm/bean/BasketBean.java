package kr.co.everyfarm.bean;

public class BasketBean {

	private String b_Id;
	private String b_Title;
	private String b_Mainimg;
	private String b_Main;
	private String b_Sub;
	private int b_Pno;
	private int b_Land;
	private int b_Landprice;
	private int b_Seedprice;
	private int b_Seedcount;
	private int b_Totalprice;
	private int b_Manpay;
	private int b_Delivery;
	
	public String getB_Id() {
		return b_Id;
	}
	public void setB_Id(String b_Id) {
		this.b_Id = b_Id;
	}
	public String getB_Title() {
		return b_Title;
	}
	public void setB_Title(String b_Title) {
		this.b_Title = b_Title;
	}
	public String getB_Mainimg() {
		return b_Mainimg;
	}
	public void setB_Mainimg(String b_Mainimg) {
		this.b_Mainimg = b_Mainimg;
	}
	public String getB_Main() {
		return b_Main;
	}
	public void setB_Main(String b_Main) {
		this.b_Main = b_Main;
	}
	public String getB_Sub() {
		return b_Sub;
	}
	public void setB_Sub(String b_Sub) {
		this.b_Sub = b_Sub;
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
	public int getB_Landprice() {
		return b_Landprice;
	}
	public void setB_Landprice(int b_Landprice) {
		this.b_Landprice = b_Landprice;
	}
	public int getB_Seedprice() {
		return b_Seedprice;
	}
	public void setB_Seedprice(int b_Seedprice) {
		this.b_Seedprice = b_Seedprice;
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
	public int getB_Manpay() {
		return b_Manpay;
	}
	public void setB_Manpay(int b_Manpay) {
		this.b_Manpay = b_Manpay;
	}
	public int getB_Delivery() {
		return b_Delivery;
	}
	public void setB_Delivery(int b_Delivery) {
		this.b_Delivery = b_Delivery;
	}
	
	@Override
	public String toString() {
		return "BasketBean [b_Id=" + b_Id + ", b_Title=" + b_Title + ", b_Mainimg=" + b_Mainimg + ", b_Main=" + b_Main
				+ ", b_Sub=" + b_Sub + ", b_Pno=" + b_Pno + ", b_Land=" + b_Land + ", b_Landprice=" + b_Landprice
				+ ", b_Seedprice=" + b_Seedprice + ", b_Seedcount=" + b_Seedcount + ", b_Totalprice=" + b_Totalprice
				+ ", b_Manpay=" + b_Manpay + ", b_Delivery=" + b_Delivery + "]";
	}
	
}
