package kr.co.everyfarm.payment;

import java.util.Date;

public class BpaymentBean {

	private String bpay_Name;
	private String bpay_Pw;
	private String bpay_Email;
	private String bpay_Address;
	private String bpay_Method;
	private String bpay_Deliverymemo;
	private String bpay_Seed;
	private int bpay_Tel;
	private int bpay_Orderno;
	private int bpay_No;
	private int bpay_Land;
	private int bpay_Totalprice;
	private Date bpay_Date;
	
	public String getBpay_Name() {
		return bpay_Name;
	}
	public void setBpay_Name(String bpay_Name) {
		this.bpay_Name = bpay_Name;
	}
	public String getBpay_Pw() {
		return bpay_Pw;
	}
	public void setBpay_Pw(String bpay_Pw) {
		this.bpay_Pw = bpay_Pw;
	}
	public String getBpay_Email() {
		return bpay_Email;
	}
	public void setBpay_Email(String bpay_Email) {
		this.bpay_Email = bpay_Email;
	}
	public String getBpay_Address() {
		return bpay_Address;
	}
	public void setBpay_Address(String bpay_Address) {
		this.bpay_Address = bpay_Address;
	}
	public String getBpay_Method() {
		return bpay_Method;
	}
	public void setBpay_Method(String bpay_Method) {
		this.bpay_Method = bpay_Method;
	}
	public String getBpay_Deliverymemo() {
		return bpay_Deliverymemo;
	}
	public void setBpay_Deliverymemo(String bpay_Deliverymemo) {
		this.bpay_Deliverymemo = bpay_Deliverymemo;
	}
	public String getBpay_Seed() {
		return bpay_Seed;
	}
	public void setBpay_Seed(String bpay_Seed) {
		this.bpay_Seed = bpay_Seed;
	}
	public int getBpay_Tel() {
		return bpay_Tel;
	}
	public void setBpay_Tel(int bpay_Tel) {
		this.bpay_Tel = bpay_Tel;
	}
	public int getBpay_Orderno() {
		return bpay_Orderno;
	}
	public void setBpay_Orderno(int bpay_Orderno) {
		this.bpay_Orderno = bpay_Orderno;
	}
	public int getBpay_No() {
		return bpay_No;
	}
	public void setBpay_No(int bpay_No) {
		this.bpay_No = bpay_No;
	}
	public int getBpay_Land() {
		return bpay_Land;
	}
	public void setBpay_Land(int bpay_Land) {
		this.bpay_Land = bpay_Land;
	}
	public int getBpay_Totalprice() {
		return bpay_Totalprice;
	}
	public void setBpay_Totalprice(int bpay_Totalprice) {
		this.bpay_Totalprice = bpay_Totalprice;
	}
	public Date getBpay_Date() {
		return bpay_Date;
	}
	public void setBpay_Date(Date bpay_Date) {
		this.bpay_Date = bpay_Date;
	}
	
	@Override
	public String toString() {
		return "BpaymentBean [bpay_Name=" + bpay_Name + ", bpay_Pw=" + bpay_Pw + ", bpay_Email=" + bpay_Email
				+ ", bpay_Address=" + bpay_Address + ", bpay_Method=" + bpay_Method + ", bpay_Deliverymemo="
				+ bpay_Deliverymemo + ", bpay_Seed=" + bpay_Seed + ", bpay_Tel=" + bpay_Tel + ", bpay_Orderno="
				+ bpay_Orderno + ", bpay_No=" + bpay_No + ", bpay_Land=" + bpay_Land + ", bpay_Totalprice="
				+ bpay_Totalprice + ", bpay_Date=" + bpay_Date + "]";
	}
	
}
