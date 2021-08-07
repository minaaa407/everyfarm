package kr.co.everyfarm.user;

import java.util.Date;

public class MemberBean {

	private String M_Id;
	private String M_Name;
	private String M_Pw;
	private String M_SubAddr;
	private String M_MainAddr;
	private String M_DetailAddr;
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
	public String getM_SubAddr() {
		return M_SubAddr;
	}
	public void setM_SubAddr(String m_SubAddr) {
		M_SubAddr = m_SubAddr;
	}
	public String getM_MainAddr() {
		return M_MainAddr;
	}
	public void setM_MainAddr(String m_MainAddr) {
		M_MainAddr = m_MainAddr;
	}
	public String getM_DetailAddr() {
		return M_DetailAddr;
	}
	public void setM_DetailAddr(String m_DetailAddr) {
		M_DetailAddr = m_DetailAddr;
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
		return "MemberVO [M_Id=" + M_Id + ", M_Name=" + M_Name + ", M_Pw=" + M_Pw + ", M_SubAddr=" + M_SubAddr
				+ ", M_MainAddr=" + M_MainAddr + ", M_DetailAddr=" + M_DetailAddr + ", M_Tel=" + M_Tel + ", M_Birth="
				+ M_Birth + ", M_Date=" + M_Date + ", M_Profile=" + M_Profile + "]";
	}
}
