package kr.co.everyfarm.product;

import java.sql.Date;

public class Product {
	
	private String p_Id;
	private int p_No;
	private String p_Title;
	private String p_Content;
	private String p_Image;
	private String p_Imagedetail;
	private int p_Land;
	private int p_Landprice;
	private String p_Main;
	private String p_Sub;
	private String p_Seedprice;
	private String p_Seedcount;
	private int p_Manpay;
	private int p_Delivery;
	private Date p_Date;
	private String p_Accept;
	
	public String getP_Id() {
		return p_Id;
	}
	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}
	public int getP_No() {
		return p_No;
	}
	public void setP_No(int p_No) {
		this.p_No = p_No;
	}
	public String getP_Title() {
		return p_Title;
	}
	public void setP_Title(String p_Title) {
		this.p_Title = p_Title;
	}
	public String getP_Content() {
		return p_Content;
	}
	public void setP_Content(String p_Content) {
		this.p_Content = p_Content;
	}
	public String getP_Image() {
		return p_Image;
	}
	public void setP_Image(String p_Image) {
		this.p_Image = p_Image;
	}
	public String getP_Imagedetail() {
		return p_Imagedetail;
	}
	public void setP_Imagedetail(String p_Imagedetail) {
		this.p_Imagedetail = p_Imagedetail;
	}
	public int getP_Land() {
		return p_Land;
	}
	public void setP_Land(int p_Land) {
		this.p_Land = p_Land;
	}
	public int getP_Landprice() {
		return p_Landprice;
	}
	public void setP_Landprice(int p_Landprice) {
		this.p_Landprice = p_Landprice;
	}
	public String getP_Main() {
		return p_Main;
	}
	public void setP_Main(String p_Main) {
		this.p_Main = p_Main;
	}
	public String getP_Sub() {
		return p_Sub;
	}
	public void setP_Sub(String p_Sub) {
		this.p_Sub = p_Sub;
	}
	
	public String getP_Seedprice() {
		return p_Seedprice;
	}
	public void setP_Seedprice(String p_Seedprice) {
		this.p_Seedprice = p_Seedprice;
	}
	public String getP_Seedcount() {
		return p_Seedcount;
	}
	public void setP_Seedcount(String p_Seedcount) {
		this.p_Seedcount = p_Seedcount;
	}
	public int getP_Manpay() {
		return p_Manpay;
	}
	public void setP_Manpay(int p_Manpay) {
		this.p_Manpay = p_Manpay;
	}
	public int getP_Delivery() {
		return p_Delivery;
	}
	public void setP_Delivery(int p_Delivery) {
		this.p_Delivery = p_Delivery;
	}
	public Date getP_Date() {
		return p_Date;
	}
	public void setP_Date(Date p_Date) {
		this.p_Date = p_Date;
	}
	public String getP_Accept() {
		return p_Accept;
	}
	public void setP_Accept(String p_Accept) {
		this.p_Accept = p_Accept;
	}
	@Override
	public String toString() {
		return "Product [p_Id=" + p_Id + ", p_No=" + p_No + ", p_Title=" + p_Title + ", p_Content=" + p_Content
				+ ", p_Image=" + p_Image + ", p_Imagedetail=" + p_Imagedetail + ", p_Land=" + p_Land + ", p_Landprice="
				+ p_Landprice + ", p_Main=" + p_Main + ", p_Sub=" + p_Sub + ", p_Seedprice=" + p_Seedprice
				+ ", p_Manpay=" + p_Manpay + ", p_Delivery=" + p_Delivery + ", p_Date=" + p_Date + ", p_Accept="
				+ p_Accept + "]";
	}

	

	
	
	
}
