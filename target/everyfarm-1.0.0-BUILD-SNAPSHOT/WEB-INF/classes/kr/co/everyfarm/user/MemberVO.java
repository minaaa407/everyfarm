package kr.co.everyfarm.user;

import java.util.Date;

public class MemberVO {

	private String M_Id;
	private String M_Name;
	private String M_Pw;
	private String M_Addr;
	private String M_Tel;
	private String M_Birth;
	private Date M_Date;
	private String M_Profile;

	public String getM_Id() {
		return M_Id;
	}

	public void setM_Id(String m_Id) {
		M_Id = m_Id;
	}

	public String getM_Name() {
		return M_Name;
	}

	public void setM_Name(String m_Name) {
		M_Name = m_Name;
	}

	public String getM_Pw() {
		return M_Pw;
	}

	public void setM_Pw(String m_Pw) {
		M_Pw = m_Pw;
	}

	public String getM_Addr() {
		return M_Addr;
	}

	public void setM_Addr(String m_Addr) {
		M_Addr = m_Addr;
	}

	public String getM_Tel() {
		return M_Tel;
	}

	public void setM_Tel(String m_Tel) {
		M_Tel = m_Tel;
	}

	public String getM_Birth() {
		return M_Birth;
	}

	public void setM_Birth(String m_Birth) {
		M_Birth = m_Birth;
	}

	public Date getM_Date() {
		return M_Date;
	}

	public void setM_Date(Date m_Date) {
		M_Date = m_Date;
	}

	public String getM_Profile() {
		return M_Profile;
	}

	public void setM_Profile(String m_Profile) {
		M_Profile = m_Profile;
	}

	@Override
	public String toString() {
		return "MemberVO [M_Id=" + M_Id + ", M_Name=" + M_Name + ", M_Pw=" + M_Pw + ", M_Addr=" + M_Addr + ", M_Tel="
				+ M_Tel + ", M_Birth=" + M_Birth + ", M_Date=" + M_Date + ", M_Profile=" + M_Profile + "]";
	}
	
}
