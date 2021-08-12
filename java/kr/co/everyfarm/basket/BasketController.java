package kr.co.everyfarm.basket;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.everyfarm.user.MemberBean;

@Controller
public class BasketController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping("/basket")
	public String getBasketList(Model model, HttpServletRequest request) {
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		
		if(member == null) {
			MemberBean nomem = (MemberBean) request.getSession().getAttribute("nomemBasketSession");
			List<BasketBean> nomembasketList = dao.listAll(nomem);
			model.addAttribute("nomembasketList", nomembasketList);
			request.setAttribute("nomembasketList", nomembasketList);
			
		} else {
			List<BasketBean> basketList = dao.listAll(member);
			model.addAttribute("basketList", basketList);
			request.setAttribute("basketList", basketList);
		}
		
		return "payment/basket";
	}
	
	@RequestMapping("/basketdelete")
	public String basketDelete(BasketBean basket, Model model, HttpServletRequest request) {
		
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		String[] chooseSt = request.getParameterValues("choose");
		for(int i=0 ; i<chooseSt.length; i++) {
			System.out.println("chooseSt i : " + chooseSt[i]);
		}
		System.out.println("chooseSt: "+ chooseSt);
//		int[] chooseInt = new int[chooseSt.length];
//		for(int i=0 ; i<chooseInt.length; i++) {
//			chooseInt[i] = Integer.parseInt(chooseSt[i]);
//		}
//		System.out.println("chooseInt : "+chooseInt);
		List<String> deletenolist = Arrays.asList(chooseSt);
		System.out.println("deletenolist: "+deletenolist);
		int basketdelete = dao.delete(deletenolist);
		return "redirect:/basket";
	}
}


