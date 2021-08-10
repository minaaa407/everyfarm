package kr.co.everyfarm.payment;

import java.util.Date;

public class PaymentBean {
	
	private String pay_Id;
	private String pay_Method;
	private String pay_seed;
	private String pay_Deliverymemo;
	private int pay_Land;
	private int pay_No;
	private int pay_Orderno;
	private int pay_Totalprice;
	private Date pay_Date;
	
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
	public String getPay_seed() {
		return pay_seed;
	}
	public void setPay_seed(String pay_seed) {
		this.pay_seed = pay_seed;
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
		return "PaymentBean [pay_Id=" + pay_Id + ", pay_Method=" + pay_Method + ", pay_seed=" + pay_seed
				+ ", pay_Deliverymemo=" + pay_Deliverymemo + ", pay_Land=" + pay_Land + ", pay_No=" + pay_No
				+ ", pay_Orderno=" + pay_Orderno + ", pay_Totalprice=" + pay_Totalprice + ", pay_Date=" + pay_Date
				+ "]";
	}
	
}
