package kr.co.everyfarm.board;

import java.util.Date;

public class ReviewVO {
	
	private int rev_No;
	private String rev_Id;
	private String rev_Title;
	private String rev_Cont;
	private String rev_Image;
	private int rev_Readcount;
	private Date rev_Date;
	private Float rev_Rate;
	public int getRev_No() {
		return rev_No;
	}
	public void setRev_No(int rev_No) {
		this.rev_No = rev_No;
	}
	public String getRev_Id() {
		return rev_Id;
	} 
	public void setRev_Id(String rev_Id) {
		this.rev_Id = rev_Id;
	}
	public String getRev_Title() {
		return rev_Title;
	}
	public void setRev_Title(String rev_Title) {
		this.rev_Title = rev_Title;
	}
	public String getRev_Cont() {
		return rev_Cont;
	}
	public void setRev_Cont(String rev_Cont) {
		this.rev_Cont = rev_Cont;
	}
	public String getRev_Image() {
		return rev_Image;
	}
	public void setRev_Image(String rev_Image) {
		this.rev_Image = rev_Image;
	}
	public int getRev_Readcount() {
		return rev_Readcount;
	}
	public void setRev_Readcount(int rev_Readcount) {
		this.rev_Readcount = rev_Readcount;
	}
	public Date getRev_Date() {
		return rev_Date;
	}
	public void setRev_Date(Date rev_Date) {
		this.rev_Date = rev_Date;
	}
	public Float getRev_Rate() {
		return rev_Rate;
	}
	public void setRev_Rate(Float rev_Rate) {
		this.rev_Rate = rev_Rate;
	}
	
	

}
