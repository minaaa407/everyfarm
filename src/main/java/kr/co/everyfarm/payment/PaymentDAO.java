package kr.co.everyfarm.payment;

import java.util.List;

public interface PaymentDAO {
	
	public List<PaymentBean> paylist();

	public List<PaymentBean> paylist1(Criteria cri);
	
	public int getPayTotalCount(Criteria cri);// paging
	
	public List<PaymentBean> farmerpaylist(String f_Id);
	// public List<PaymentBean> farmerpaylist(@Param("cri") Criteria cri, @Param("f_Id") String f_Id);
	
	// count
	public int countA(String date); public int countB(String date); public int countC(String date); public int countD(String date); public int countE(String date); 
	public int countF(String date); public int countG(String date); public int countH(String date); public int countI(String date); public int countJ(String date); 
	public int countK(String date); public int countL(String date); public int countM(String date); public int countN(String date); public int countO(String date); 
	
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
