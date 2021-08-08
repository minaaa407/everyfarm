package kr.co.everyfarm.user;

import java.util.Date;

public class FarmerVO {

	private String F_Id;
	private String F_Name;
	private String F_Pw;
	private String F_SubAddr;
	private String F_MainAddr;
	private String F_DetailAddr;
	private String F_Tel;
	private String F_Birth;
	private Float F_Rate;
	private Date F_Date;
	private String F_Profile;
	private String F_Auth;

	public String getF_Id() {
		return F_Id;
	}

	public void setF_Id(String f_Id) {
		F_Id = f_Id;
	}

	public String getF_Name() {
		return F_Name;
	}

	public void setF_Name(String f_Name) {
		F_Name = f_Name;
	}

	public String getF_Pw() {
		return F_Pw;
	}

	public void setF_Pw(String f_Pw) {
		F_Pw = f_Pw;
	}

	public String getF_SubAddr() {
		return F_SubAddr;
	}

	public void setF_SubAddr(String f_SubAddr) {
		F_SubAddr = f_SubAddr;
	}

	public String getF_MainAddr() {
		return F_MainAddr;
	}

	public void setF_MainAddr(String f_MainAddr) {
		F_MainAddr = f_MainAddr;
	}

	public String getF_DetailAddr() {
		return F_DetailAddr;
	}

	public void setF_DetailAddr(String f_DetailAddr) {
		F_DetailAddr = f_DetailAddr;
	}

	public String getF_Tel() {
		return F_Tel;
	}

	public void setF_Tel(String f_Tel) {
		F_Tel = f_Tel;
	}

	public String getF_Birth() {
		return F_Birth;
	}

	public void setF_Birth(String f_Birth) {
		F_Birth = f_Birth;
	}

	public Float getF_Rate() {
		return F_Rate;
	}

	public void setF_Rate(Float f_Rate) {
		F_Rate = f_Rate;
	}

	public Date getF_Date() {
		return F_Date;
	}

	public void setF_Date(Date f_Date) {
		F_Date = f_Date;
	}

	public String getF_Profile() {
		return F_Profile;
	}

	public void setF_Profile(String f_Profile) {
		F_Profile = f_Profile;
	}

	public String getF_Auth() {
		return F_Auth;
	}

	public void setF_Auth(String f_Auth) {
		F_Auth = f_Auth;
	}

	@Override
	public String toString() {
		return "FarmerVO [F_Id=" + F_Id + ", F_Name=" + F_Name + ", F_Pw=" + F_Pw + ", F_SubAddr=" + F_SubAddr
				+ ", F_MainAddr=" + F_MainAddr + ", F_DetailAddr=" + F_DetailAddr + ", F_Tel=" + F_Tel + ", F_Birth="
				+ F_Birth + ", F_Rate=" + F_Rate + ", F_Date=" + F_Date + ", F_Profile=" + F_Profile + ", F_Auth="
				+ F_Auth + "]";
	}
}
