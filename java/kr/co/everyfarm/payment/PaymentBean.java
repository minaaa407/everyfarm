package kr.co.everyfarm.payment;

import java.util.Date;

public class PaymentBean {
	
	private String pay_Id;
	private String pay_Method;
	private String pay_Seed;
	private String pay_Deliverymemo;
	private int pay_Land;
	private int pay_No;
	private int pay_Orderno;
	private int pay_Totalprice;
	private Date pay_Date;
	
	private String p_Id;
	private int p_No;
	private String p_Title;
	private String p_Img;
	
	private String m_Name;
	
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
	public String getP_Img() {
		return p_Img;
	}
	public void setP_Img(String p_Img) {
		this.p_Img = p_Img;
	}
	public String getM_Name() {
		return m_Name;
	}
	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}
	public String getPay_Id() {
		return pay_Id;
	}
	public void setPay_Id(String pay_Id) {
		this.pay_Id = pay_Id;
	}
	public String getPay_Method() {
		return pay_Method;
	}
	public void setPay_Method(String pay_Method) {
		this.pay_Method = pay_Method;
	}
	public String getPay_Seed() {
		return pay_Seed;
	}
	public void setPay_Seed(String pay_Seed) {
		this.pay_Seed = pay_Seed;
	}
	public String getPay_Deliverymemo() {
		return pay_Deliverymemo;
	}
	public void setPay_Deliverymemo(String pay_Deliverymemo) {
		this.pay_Deliverymemo = pay_Deliverymemo;
	}
	public int getPay_Land() {
		return pay_Land;
	}
	public void setPay_Land(int pay_Land) {
		this.pay_Land = pay_Land;
	}
	public int getPay_No() {
		return pay_No;
	}
	public void setPay_No(int pay_No) {
		this.pay_No = pay_No;
	}
	public int getPay_Orderno() {
		return pay_Orderno;
	}
	public void setPay_Orderno(int pay_Orderno) {
		this.pay_Orderno = pay_Orderno;
	}
	public int getPay_Totalprice() {
		return pay_Totalprice;
	}
	public void setPay_Totalprice(int pay_Totalprice) {
		this.pay_Totalprice = pay_Totalprice;
	}
	public Date getPay_Date() {
		return pay_Date;
	}
	public void setPay_Date(Date pay_Date) {
		this.pay_Date = pay_Date;
	}
	
	@Override
	public String toString() {
		return "PaymentBean [pay_Id=" + pay_Id + ", pay_Method=" + pay_Method + ", pay_Seed=" + pay_Seed
				+ ", pay_Deliverymemo=" + pay_Deliverymemo + ", pay_Land=" + pay_Land + ", pay_No=" + pay_No
				+ ", pay_Orderno=" + pay_Orderno + ", pay_Totalprice=" + pay_Totalprice + ", pay_Date=" + pay_Date
				+ ", p_Id=" + p_Id + ", p_No=" + p_No + ", p_Title=" + p_Title + ", p_Img=" + p_Img + ", m_Name="
				+ m_Name + "]";
	}
	
}
