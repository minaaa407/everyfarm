package kr.co.everyfarm.payment;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.everyfarm.product.PageBeen;

public interface PaymentDAO {
	public List<PaymentBean> paylist();

	public List<PaymentBean> farmerpaylist(String m_Id);
	
	public List<PaymentBean> farmerpaylistpageing(PageBeen pagebeen);
	public List<PaymentBean> farmerpaylistserachpageing(PageBeen pagebeen);
	public List<PaymentBean> farmerpaylistserachpageingcount(PageBeen pagebeen);

	public int payinsert(PaymentBean payment);

	public int landupdate(@Param("FinalAvailableLand") int FinalAvailableLand, @Param("P_Id") int P_Id);

	public int update(PaymentBean payment);

	public int paydelete(int Orderno);


	public Integer getinfo(int p_No);

	public List<PaymentBean> mypaylist();
	
	
	// modal test
	public PaymentBean getSearchData(PaymentBean paymentbean);

}
