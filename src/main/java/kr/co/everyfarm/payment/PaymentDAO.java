package kr.co.everyfarm.payment;

import java.util.List;

public interface PaymentDAO {
	public List<PaymentBean> paylist();
	public List<BpaymentBean> bpaylist();
	
	public int payinsert(PaymentBean payment);
	public int bpayinsert(BpaymentBean bpayment);
	
	public int landupdate(PaymentBean payment);
	public int update(PaymentBean payment);
	
	public int paydelete(int Orderno);
	public int bpaydelete(int Orderno);
	
	public Integer getinfo(int p_No);
}
