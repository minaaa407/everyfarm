package kr.co.everyfarm.payment;

import java.util.List;

import kr.co.everyfarm.product.Product;

public interface PaymentDao {
	public List<PaymentBean> list();
	public int insert(PaymentBean pay);
	public int update(PaymentBean pay);
	public int delete(int pay_Orderno);
	
	
	public Product getinfo(String p_id);
}
