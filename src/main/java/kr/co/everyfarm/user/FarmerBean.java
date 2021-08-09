package kr.co.everyfarm.user;

import java.util.Date;

public class FarmerVO {

	private String f_Id;
	private String f_Name;
	private String f_Pw;
	private String f_Addr;
	private String f_Tel;
	private String f_Birth;
	private Float f_Rate;
	private Date f_Date;
	private String f_Profile;
	private String f_Auth;
	
	public String getF_Id() {
		return f_Id;
	}
	public void setF_Id(String f_Id) {
		this.f_Id = f_Id;
	}
	public String getF_Name() {
		return f_Name;
	}
	public void setF_Name(String f_Name) {
		this.f_Name = f_Name;
	}
	public String getF_Pw() {
		return f_Pw;
	}
	public void setF_Pw(String f_Pw) {
		this.f_Pw = f_Pw;
	}
	public String getF_Addr() {
		return f_Addr;
	}
	public void setF_Addr(String f_Addr) {
		this.f_Addr = f_Addr;
	}
	public String getF_Tel() {
		return f_Tel;
	}
	public void setF_Tel(String f_Tel) {
		this.f_Tel = f_Tel;
	}
	public String getF_Birth() {
		return f_Birth;
	}
	public void setF_Birth(String f_Birth) {
		this.f_Birth = f_Birth;
	}
	public Float getF_Rate() {
		return f_Rate;
	}
	public void setF_Rate(Float f_Rate) {
		this.f_Rate = f_Rate;
	}
	public Date getF_Date() {
		return f_Date;
	}
	public void setF_Date(Date f_Date) {
		this.f_Date = f_Date;
	}
	public String getF_Profile() {
		return f_Profile;
	}
	public void setF_Profile(String f_Profile) {
		this.f_Profile = f_Profile;
	}
	public String getF_Auth() {
		return f_Auth;
	}
	public void setF_Auth(String f_Auth) {
		this.f_Auth = f_Auth;
	}
	
	@Override
	public String toString() {
		return "FarmerVO [f_Id=" + f_Id + ", f_Name=" + f_Name + ", f_Pw=" + f_Pw + ", f_Addr=" + f_Addr + ", f_Tel="
				+ f_Tel + ", f_Birth=" + f_Birth + ", f_Rate=" + f_Rate + ", f_Date=" + f_Date + ", f_Profile="
				+ f_Profile + ", f_Auth=" + f_Auth + "]";
	}
}
