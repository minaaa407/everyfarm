package kr.co.everyfarm.product;

public class PaymentBean {
	
	private String pay_Id;
	private String pay_Method;
	private int pay_No;
	private int pay_Orderno;
	private int pay_seedcount;
	private int pay_Totalprice;
	private int pay_Admin;
	
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
	public int getPay_seedcount() {
		return pay_seedcount;
	}
	public void setPay_seedcount(int pay_seedcount) {
		this.pay_seedcount = pay_seedcount;
	}
	public int getPay_Totalprice() {
		return pay_Totalprice;
	}
	public void setPay_Totalprice(int pay_Totalprice) {
		this.pay_Totalprice = pay_Totalprice;
	}
	public int getPay_Admin() {
		return pay_Admin;
	}
	public void setPay_Admin(int pay_Admin) {
		this.pay_Admin = pay_Admin;
	}
	
	@Override
	public String toString() {
		return "PaymentBean [pay_Id=" + pay_Id + ", pay_Method=" + pay_Method + ", pay_No=" + pay_No + ", pay_Orderno="
				+ pay_Orderno + ", pay_seedcount=" + pay_seedcount + ", pay_Totalprice=" + pay_Totalprice
				+ ", pay_Admin=" + pay_Admin + "]";
	}
	
	
}
