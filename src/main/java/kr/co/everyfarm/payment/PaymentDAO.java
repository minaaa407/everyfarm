package kr.co.everyfarm.payment;

import java.util.List;

import kr.co.everyfarm.board.PagingBean;
import kr.co.everyfarm.board.QnABean;
import kr.co.everyfarm.product.PageBeen;

public interface PaymentDAO {
	
	public void rownum();
	
	public int countPayment();
	
	public List<PaymentBean> paylist();

	public List<PaymentBean> paylist1(Criteria cri);
	public int getPayTotalCount(Criteria cri);// paging
	
	public List<PaymentBean> searchName(PaymentBean paymentbean);
	public List<PaymentBean> searchNamePaging(PagingBean pagingbean);
	public List<PaymentBean> searchAllPaging(PagingBean pagingbean);
	
	public List<PaymentBean> farmerpaylist(String m_Id);
	
	public List<PaymentBean> farmerpaylistpageing(PageBeen pagebeen);
	public List<PaymentBean> farmerpaylistserachpageing(PageBeen pagebeen);
	public List<PaymentBean> farmerpaylistserachpageingcount(PageBeen pagebeen);

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
