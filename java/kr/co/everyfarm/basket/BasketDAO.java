package kr.co.everyfarm.basket;

import java.util.ArrayList;
import java.util.List;

import kr.co.everyfarm.user.MemberBean;

public interface BasketDAO {
	
		public List <BasketBean> listAll(MemberBean member);
		
		public String[] pnoList(MemberBean member);
		
		public int insert(BasketBean basket);

		public int update(BasketBean basket);

		public int delete(List<String> deletenolist);
		
		
	}



