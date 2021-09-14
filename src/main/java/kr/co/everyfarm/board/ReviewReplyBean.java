package kr.co.everyfarm.board;

import java.util.Date;

public class ReviewReplyBean {

	private int rep_No;
	private int rep_Subno;
	private int rev_No;
	private String rep_Id;
	private String rep_Cont;
	private String rep_Secret;
	private Date rep_Date;
	public int getRep_No() {
		return rep_No;
	}
	public void setRep_No(int rep_No) {
		this.rep_No = rep_No;
	}
	public int getRep_Subno() {
		return rep_Subno;
	}
	public void setRep_Subno(int rep_Subno) {
		this.rep_Subno = rep_Subno;
	}
	public int getRev_No() {
		return rev_No;
	}
	public void setRev_No(int rev_No) {
		this.rev_No = rev_No;
	}
	public String getRep_Id() {
		return rep_Id;
	}
	public void setRep_Id(String rep_Id) {
		this.rep_Id = rep_Id;
	}
	public String getRep_Cont() {
		return rep_Cont;
	}
	public void setRep_Cont(String rep_Cont) {
		this.rep_Cont = rep_Cont;
	}
	public String getRep_Secret() {
		return rep_Secret;
	}
	public void setRep_Secret(String rep_Secret) {
		this.rep_Secret = rep_Secret;
	}
	public Date getRep_Date() {
		return rep_Date;
	}
	public void setRep_Date(Date rep_Date) {
		this.rep_Date = rep_Date;
	}
	@Override
	public String toString() {
		return "ReviewReplyBean [rep_No=" + rep_No + ", rep_Subno=" + rep_Subno + ", rev_No=" + rev_No + ", rep_Id="
				+ rep_Id + ", rep_Cont=" + rep_Cont + ", rep_Secret=" + rep_Secret + ", rep_Date=" + rep_Date + "]";
	}
	
	
}
