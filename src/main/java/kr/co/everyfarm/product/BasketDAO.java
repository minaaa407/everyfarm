package kr.co.everyfarm.product;

import java.util.List;

public interface BasketDAO {
	
		public List <BasketBean> list();

		public int insert(BasketBean basket);

		public int update(BasketBean basket);

		public int delete(BasketBean basket);
		
		
//		public List <BpaymentBean> bpaymentList();
//
//		public int bpaymentinsert(BpaymentBean bpayment);
//
//		public int bpaymentupdate(BpaymentBean bpayment);
//
//		public int bpaymentdelete(BpaymentBean bpayment);
//		
//			
//		public List <PaymentBean> paymentList();
//
//		public int paymentinsert(PaymentBean payment);
//
//		public int paymentupdate(PaymentBean payment);
//
//		public int paymentdelete(PaymentBean payment);
		
		
		
		
	}



