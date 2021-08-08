package kr.co.everyfarm.user;

import java.util.Date;

public class MemberVO {

	private String m_Id;
	private String m_Name;
	private String m_Pw;
	private String m_Addr;
	private String m_Tel;
	private String m_Birth;
	private Date m_Date;
	private String m_Profile;

	public String getM_Id() {
		return m_Id;
	}
	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}
	public String getM_Name() {
		return m_Name;
	}
	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}
	public String getM_Pw() {
		return m_Pw;
	}
	public void setM_Pw(String m_Pw) {
		this.m_Pw = m_Pw;
	}
	public String getM_Addr() {
		return m_Addr;
	}
	public void setM_Addr(String m_Addr) {
		this.m_Addr = m_Addr;
	}
	public String getM_Tel() {
		return m_Tel;
	}
	public void setM_Tel(String m_Tel) {
		this.m_Tel = m_Tel;
	}
	public String getM_Birth() {
		return m_Birth;
	}
	public void setM_Birth(String m_Birth) {
		this.m_Birth = m_Birth;
	}
	public Date getM_Date() {
		return m_Date;
	}
	public void setM_Date(Date m_Date) {
		this.m_Date = m_Date;
	}
	public String getM_Profile() {
		return m_Profile;
	}
	public void setM_Profile(String m_Profile) {
		this.m_Profile = m_Profile;
	}

	@Override
	public String toString() {
		return "MemberVO [m_Id=" + m_Id + ", m_Name=" + m_Name + ", m_Pw=" + m_Pw + ", m_Addr=" + m_Addr + ", m_Tel="
				+ m_Tel + ", m_Birth=" + m_Birth + ", m_Date=" + m_Date + ", m_Profile=" + m_Profile + "]";
	}

}
