package kr.co.everyfarm.basket;


import java.util.HashMap;
import java.util.List;

import kr.co.everyfarm.product.ProductBean;
import kr.co.everyfarm.user.MemberBean;

public interface BasketDAO {
	
		public List <BasketBean> listAll(MemberBean member);
		
		public MemberBean payList(MemberBean member);
		
		public String[] pnoList(MemberBean member);
		
		public BasketBean getAvailable(int pno);
		
		public List <BasketBean> getSeed(int[] problemPno);
		
		public int insert(BasketBean basket);

		public int update(BasketBean basket);
		
		public int seedupdate(BasketBean basket);

		public int delete(List<String> deletenolist);
		
		public int deleteAll(MemberBean member);
		
		public int deleteZeroBasket(MemberBean member);
		
		
	}



