package kr.co.everyfarm.board;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class QnABean {

	private int q_No;
	private String q_Id;
	
	@NotEmpty(message="필수 입력 항목입니다.")
	private String q_Title;
	private MultipartFile q_Img;
	
	@NotEmpty(message="필수 입력 항목입니다.")
	private String q_Content;
	private Date q_Date;
	private Boolean q_Secret;
	private Boolean q_Answer;
	private int q_Pno;
	private String q_Ptitle;
	private String q_Pid;
	private Date q_Magdate;
	private String q_Magcontent;
	
	
	public int getQ_No() {
		return q_No;
	}
	public void setQ_No(int q_No) {
		this.q_No = q_No;
	}
	public String getQ_Id() {
		return q_Id;
	}
	public void setQ_Id(String q_Id) {
		this.q_Id = q_Id;
	}
	public String getQ_Title() {
		return q_Title;
	}
	public void setQ_Title(String q_Title) {
		this.q_Title = q_Title;
	}
	public MultipartFile getQ_Img() {
		return q_Img;
	}
	public void setQ_Img(MultipartFile q_Img) {
		this.q_Img = q_Img;
	}
	public String getQ_Content() {
		return q_Content;
	}
	public void setQ_Content(String q_Content) {
		this.q_Content = q_Content;
	}
	public Date getQ_Date() {
		return q_Date;
	}
	public void setQ_Date(Date q_Date) {
		this.q_Date = q_Date;
	}
	public Boolean getQ_Secret() {
		return q_Secret;
	}
	public void setQ_Secret(Boolean q_Secret) {
		this.q_Secret = q_Secret;
	}
	public Boolean getQ_Answer() {
		return q_Answer;
	}
	public void setQ_Answer(Boolean q_Answer) {
		this.q_Answer = q_Answer;
	}
	public int getQ_Pno() {
		return q_Pno;
	}
	public void setQ_Pno(int q_Pno) {
		this.q_Pno = q_Pno;
	}
	public String getQ_Ptitle() {
		return q_Ptitle;
	}
	public void setQ_Ptitle(String q_Ptitle) {
		this.q_Ptitle = q_Ptitle;
	}
	public String getQ_Pid() {
		return q_Pid;
	}
	public void setQ_Pid(String q_Pid) {
		this.q_Pid = q_Pid;
	}
	public Date getQ_Magdate() {
		return q_Magdate;
	}
	public void setQ_Magdate(Date q_Magdate) {
		this.q_Magdate = q_Magdate;
	}
	public String getQ_Magcontent() {
		return q_Magcontent;
	}
	public void setQ_Magcontent(String q_Magcontent) {
		this.q_Magcontent = q_Magcontent;
	}
	
	@Override
	public String toString() {
		return "QnABean [q_No=" + q_No + ", q_Id=" + q_Id + ", q_Title=" + q_Title + ", q_Img=" + q_Img + ", q_Content="
				+ q_Content + ", q_Date=" + q_Date + ", q_Secret=" + q_Secret + ", q_Answer=" + q_Answer + ", q_Pno="
				+ q_Pno + ", q_Ptitle=" + q_Ptitle + ", q_Pid=" + q_Pid + ", q_Magdate=" + q_Magdate + ", q_Magcontent="
				+ q_Magcontent + "]";
	}
	
	
	
	
	
	
	
	
	
}