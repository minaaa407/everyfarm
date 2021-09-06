package kr.co.everyfarm.user;

import java.util.Date;

public class EmailBean {

	private String e_Id;

	private int e_Num;

	private Date e_Date;
	
	public EmailBean() {}
	
	public EmailBean(String e_Id, int e_Num) {
		this.e_Id = e_Id;
		this.e_Num = e_Num;
	}

	public String getE_Id() {
		return e_Id;
	}

	public void setE_Id(String e_Id) {
		this.e_Id = e_Id;
	}

	public int getE_Num() {
		return e_Num;
	}

	public void setE_Num(int e_Num) {
		this.e_Num = e_Num;
	}

	public Date getE_Date() {
		return e_Date;
	}

	public void setE_Date(Date e_Date) {
		this.e_Date = e_Date;
	}

	@Override
	public String toString() {
		return "EmailBean [e_Id=" + e_Id + ", e_Num=" + e_Num + ", e_Date=" + e_Date + "]";
	}

}
