package kr.co.everyfarm.payment;

import java.util.List;

import kr.co.everyfarm.board.Paging;

public interface PaymentDAO {
	
	public List<PaymentBean> paylist();

	public List<PaymentBean> paylist1(Criteria cri);
	
	public int getPayTotalCount(Criteria cri);// paging
	
	public int getPayFarmerCount(Criteria cri);// paging
	
	public List<PaymentBean> farmerpaylist(String f_Id);
	
	public List<PaymentBean> farmerpaylist1(Criteria cri);
	
	// count
	public Integer countA(String date); public Integer countB(String date); public Integer countC(String date); public Integer countD(String date); public Integer countE(String date); 
	public Integer countF(String date); public Integer countG(String date); public Integer countH(String date); public Integer countI(String date); public Integer countJ(String date); 
	public Integer countK(String date); public Integer countL(String date); public Integer countM(String date); public Integer countN(String date); public Integer countO(String date); 
	
	public PaymentBean paydetailadmin(int Orderno);
	
	public PaymentBean paydetailfarmer(int Orderno);
	
	public int payinsert(PaymentBean payment);

	public int update(PaymentBean payment);

	public int paydelete(List<String> deletelist);

	public PaymentBean mypaylist(Paging paging);
	
	public List<PaymentBean> mypayListuser(String m_Id);
	
	// modal test
	public PaymentBean getSearchData(PaymentBean paymentbean);
	
	List<PaymentBean> seedList();

}
