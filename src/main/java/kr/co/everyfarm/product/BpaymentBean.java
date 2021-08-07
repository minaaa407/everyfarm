package kr.co.everyfarm.product;

public class BpaymentBean {

	private int bpay_Orderno;
	private int bpay_No;
	private int bpay_Seedcount;
	private int bpay_Totalprice;
	private int bpay_Admin;
	private String bpay_Name;
	private String bpay_Pw;
	private String bpay_Email;
	private String bpay_Address;
	private String bpay_Tel;
	private String bpay_Method;
	
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
	public int getBpay_Seedcount() {
		return bpay_Seedcount;
	}
	public void setBpay_Seedcount(int bpay_Seedcount) {
		this.bpay_Seedcount = bpay_Seedcount;
	}
	public int getBpay_Totalprice() {
		return bpay_Totalprice;
	}
	public void setBpay_Totalprice(int bpay_Totalprice) {
		this.bpay_Totalprice = bpay_Totalprice;
	}
	public int getBpay_Admin() {
		return bpay_Admin;
	}
	public void setBpay_Admin(int bpay_Admin) {
		this.bpay_Admin = bpay_Admin;
	}
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
	public String getBpay_Tel() {
		return bpay_Tel;
	}
	public void setBpay_Tel(String bpay_Tel) {
		this.bpay_Tel = bpay_Tel;
	}
	public String getBpay_Method() {
		return bpay_Method;
	}
	public void setBpay_Method(String bpay_Method) {
		this.bpay_Method = bpay_Method;
	}
	
	@Override
	public String toString() {
		return "bpayment [bpay_Orderno=" + bpay_Orderno + ", bpay_No=" + bpay_No + ", bpay_Seedcount=" + bpay_Seedcount
				+ ", bpay_Totalprice=" + bpay_Totalprice + ", bpay_Admin=" + bpay_Admin + ", bpay_Name=" + bpay_Name
				+ ", bpay_Pw=" + bpay_Pw + ", bpay_Email=" + bpay_Email + ", bpay_Address=" + bpay_Address
				+ ", bpay_Tel=" + bpay_Tel + ", bpay_Method=" + bpay_Method + "]";
	}
}
