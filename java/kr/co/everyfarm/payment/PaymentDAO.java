package kr.co.everyfarm.payment;

import java.util.List;

import kr.co.everyfarm.product.ProductBean;

public interface PaymentDAO {
	public List<PaymentBean> paylist();
	public List<BpaymentBean> bpaylist();
	
	public int payinsert(PaymentBean payment);
	public int bpayinsert(BpaymentBean bpayment);
	public int update(PaymentBean payment);
	
	public int paydelete(int Orderno);
	public int bpaydelete(int Orderno);
	
	
	public ProductBean getinfo(String p_id);
}
