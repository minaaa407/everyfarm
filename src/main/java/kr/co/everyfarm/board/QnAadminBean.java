package kr.co.everyfarm.board;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class QnAadminBean {

	private int qa_No;
	private String qa_Id;
	
	private String qa_Title;
	private MultipartFile qa_Img;
	
	private String qa_Content;
	private Date qa_Date;
	private Boolean qa_Secret;
	private Boolean qa_Answer;
	private Date qa_Addate;
	private String qa_Adcontent;
	
	
	public int getQa_No() {
		return qa_No;
	}
	public void setQa_No(int qa_No) {
		this.qa_No = qa_No;
	}
	public String getQa_Id() {
		return qa_Id;
	}
	public void setQa_Id(String qa_Id) {
		this.qa_Id = qa_Id;
	}
	public String getQa_Title() {
		return qa_Title;
	}
	public void setQa_Title(String qa_Title) {
		this.qa_Title = qa_Title;
	}
	public MultipartFile getQa_Img() {
		return qa_Img;
	}
	public void setQa_Img(MultipartFile qa_Img) {
		this.qa_Img = qa_Img;
	}
	public String getQa_Content() {
		return qa_Content;
	}
	public void setQa_Content(String qa_Content) {
		this.qa_Content = qa_Content;
	}
	public Date getQa_Date() {
		return qa_Date;
	}
	public void setQa_Date(Date qa_Date) {
		this.qa_Date = qa_Date;
	}
	public Boolean getQa_Secret() {
		return qa_Secret;
	}
	public void setQa_Secret(Boolean qa_Secret) {
		this.qa_Secret = qa_Secret;
	}
	public Boolean getQa_Answer() {
		return qa_Answer;
	}
	public void setQa_Answer(Boolean qa_Answer) {
		this.qa_Answer = qa_Answer;
	}
	public Date getQa_Addate() {
		return qa_Addate;
	}
	public void setQa_Addate(Date qa_Addate) {
		this.qa_Addate = qa_Addate;
	}
	public String getQa_Adcontent() {
		return qa_Adcontent;
	}
	public void setQa_Adcontent(String qa_Adcontent) {
		this.qa_Adcontent = qa_Adcontent;
	}
	
	
	@Override
	public String toString() {
		return "QnAadminBean [qa_No=" + qa_No + ", qa_Id=" + qa_Id + ", qa_Title=" + qa_Title + ", qa_Img=" + qa_Img
				+ ", qa_Content=" + qa_Content + ", qa_Date=" + qa_Date + ", qa_Secret=" + qa_Secret + ", qa_Answer="
				+ qa_Answer + ", qa_Addate=" + qa_Addate + ", qa_Adcontent=" + qa_Adcontent + "]";
	}
	
	
	
	
}
