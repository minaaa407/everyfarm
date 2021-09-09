package kr.co.everyfarm.payment;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PaymentDAO {
	
	public List<PaymentBean> paylist();

	public List<PaymentBean> paylist1(Criteria cri);
	public int getPayTotalCount(Criteria cri);// paging
	
	public List<PaymentBean> farmerpaylist(String f_Id);
	// public List<PaymentBean> farmerpaylist(@Param("cri") Criteria cri, @Param("f_Id") String f_Id);
	
	public List<PaymentBean> sendmessage(int pay_orderno);
	
	public int payinsert(PaymentBean payment);

	public int update(PaymentBean payment);

	public int paydelete(List<String> deletelist);

	public Integer getinfo(int p_No);

	public List<PaymentBean> mypaylist(String m_Id);
	
	// modal test
	public PaymentBean getSearchData(PaymentBean paymentbean);
	
	List<PaymentBean> seedList();

}
