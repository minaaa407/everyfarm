package kr.co.everyfarm.admin;

import java.util.Date;

public class AdminBean {
	
	private String a_Id;
	private String a_Pw;
	private String a_Name;
	private String a_Email;
	private Date a_Date;
	
	public String getA_Id() {
		return a_Id;
	}
	public void setA_Id(String a_Id) {
		this.a_Id = a_Id;
	}
	public String getA_Pw() {
		return a_Pw;
	}
	public void setA_Pw(String a_Pw) {
		this.a_Pw = a_Pw;
	}
	public String getA_Name() {
		return a_Name;
	}
	public void setA_Name(String a_Name) {
		this.a_Name = a_Name;
	}
	public String getA_Email() {
		return a_Email;
	}
	public void setA_Email(String a_Email) {
		this.a_Email = a_Email;
	}
	public Date getA_Date() {
		return a_Date;
	}
	public void setA_Date(Date a_Date) {
		this.a_Date = a_Date;
	}

	@Override
	public String toString() {
		return "AdminBean [a_Id=" + a_Id + ", a_Pw=" + a_Pw + ", a_Name=" + a_Name + ", a_Email=" + a_Email
				+ ", a_Date=" + a_Date + "]";
	}
}