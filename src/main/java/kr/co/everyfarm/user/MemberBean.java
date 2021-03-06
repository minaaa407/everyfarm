package kr.co.everyfarm.user;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {

	@NotEmpty(message = "필수 입력 항목입니다.")
	@Email(message = "이메일  형식에 맞지 않습니다.")
	private String m_Id;

	@NotEmpty(message = "필수 입력 항목입니다.")
	private String m_Name;

	@NotEmpty(message = "필수 입력 항목입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*\\W)(?=\\S+$).{8,20}", message = "비밀번호는 영문 소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 비밀번호여야 합니다.")
	@Size(min = 8, max = 20, message = "8자 ~ 20자로 작성해주세요.")
	private String m_Pw;

	@NotEmpty(message = "필수 입력 항목입니다.")
	private String m_Addr;

	@NotEmpty(message = "필수 입력 항목입니다.")
	private String m_Tel;

	@NotEmpty(message = "필수 입력 항목입니다.")
	private String m_Birth;

	private Date m_Date;

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

	@Override
	public String toString() {
		return "MemberVO [m_Id=" + m_Id + ", m_Name=" + m_Name + ", m_Pw=" + m_Pw + ", m_Addr=" + m_Addr + ", m_Tel="
				+ m_Tel + ", m_Birth=" + m_Birth + ", m_Date=" + m_Date + "]";
	}
}
