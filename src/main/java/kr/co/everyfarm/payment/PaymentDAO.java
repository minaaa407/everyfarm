package kr.co.everyfarm.payment;

import java.util.List;

public interface PaymentDAO {
	
	public List<PaymentBean> paylist();

	public List<PaymentBean> paylist1(Criteria cri);
	
	public int getPayTotalCount(Criteria cri);// paging
	
	public List<PaymentBean> farmerpaylist(String f_Id);
	// public List<PaymentBean> farmerpaylist(@Param("cri") Criteria cri, @Param("f_Id") String f_Id);
	
	// count
	public Integer countA(String date); public Integer countB(String date); public Integer countC(String date); public Integer countD(String date); public Integer countE(String date); 
	public Integer countF(String date); public Integer countG(String date); public Integer countH(String date); public Integer countI(String date); public Integer countJ(String date); 
	public Integer countK(String date); public Integer countL(String date); public Integer countM(String date); public Integer countN(String date); public Integer countO(String date); 
	
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
