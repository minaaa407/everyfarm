package kr.co.everyfarm.payment;

import java.util.List;

import kr.co.everyfarm.product.ProductBean;

public interface PaymentDAO {
	public List<PaymentBean> list();
	public int insert(PaymentBean pay);
	public int update(PaymentBean pay);
	public int delete(int pay_Orderno);
	
	
	public ProductBean getinfo(String p_id);
}
