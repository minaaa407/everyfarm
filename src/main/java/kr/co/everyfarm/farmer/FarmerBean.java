package kr.co.everyfarm.farmer;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class FarmerBean {

	@NotEmpty(message = "필수 입력 항목입니다.")
	@Email(message = "이메일  형식에 맞지 않습니다.")
	private String f_Id;
	
	@NotEmpty(message = "필수 입력 항목입니다.")
	private String f_Name;
	
	@NotEmpty(message = "필수 입력 항목입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*\\W)(?=\\S+$).{8,20}", message = "비밀번호는 영문 소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	private String f_Pw;

	@NotEmpty(message = "필수 입력 항목입니다.")
	private String f_Addr;
	
	@NotEmpty(message = "필수 입력 항목입니다.")
	private String f_Tel;
	
	@NotEmpty(message = "필수 입력 항목입니다.")
	private String f_Birth;

	private Float f_Rate;
	
	private Date f_Date;
	
	@NotEmpty(message = "필수 입력 항목입니다.")
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
	public String getF_Auth() {
		return f_Auth;
	}
	public void setF_Auth(String f_Auth) {
		this.f_Auth = f_Auth;
	}
	
	@Override
	public String toString() {
		return "FarmerBean [f_Id=" + f_Id + ", f_Name=" + f_Name + ", f_Pw=" + f_Pw + ", f_Addr=" + f_Addr + ", f_Tel="
				+ f_Tel + ", f_Birth=" + f_Birth + ", f_Rate=" + f_Rate + ", f_Date=" + f_Date + ", f_Auth=" + f_Auth
				+ "]";
	}
	
}
