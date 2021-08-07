package kr.co.everyfarm.product;

import java.util.List;

public interface PaymentDao {
	public List<PaymentBean> list();
	public ProductBean list1(String p_id);

	public int insert(PaymentBean pay);
	public int update(PaymentBean pay);
	public int delete(int pay_Orderno);
}
