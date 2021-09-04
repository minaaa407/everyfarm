package kr.co.everyfarm.payment;

import java.util.List;

import kr.co.everyfarm.product.PageBeen;
import kr.co.everyfarm.product.ProductBean;

public interface PaymentDAO {
	public List<PaymentBean> paylist();

	public List<PaymentBean> farmerpaylist(String m_Id);
	
	public List<PaymentBean> farmerpaylistpageing(PageBeen pagebeen);
	public List<PaymentBean> farmerpaylistserachpageing(PageBeen pagebeen);
	public List<PaymentBean> farmerpaylistserachpageingcount(PageBeen pagebeen);

	public List<PaymentBean> sendmessage(int pay_orderno);
	
	public int payinsert(PaymentBean payment);

	// public int landupdate(@Param("FinalAvailableLand") int FinalAvailableLand, @Param("P_Id") int P_Id);

	public int update(PaymentBean payment);

	public int paydelete(int Orderno);


	public Integer getinfo(int p_No);

	public List<PaymentBean> mypaylist(String m_Id);
	
	// modal test
	public PaymentBean getSearchData(PaymentBean paymentbean);
	
	List<PaymentBean> seedList();

}
