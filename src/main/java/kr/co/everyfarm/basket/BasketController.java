package kr.co.everyfarm.basket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.everyfarm.user.MemberBean;

@Controller
public class BasketController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping("/basket")
	public String getBasketList(Model model, HttpServletRequest request) {
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		List<BasketBean> basketList = dao.listAll(member);
		model.addAttribute("basketList", basketList);
		request.setAttribute("basketList", basketList);

		return "payment/basket";
	}
	
	@RequestMapping("/basketdelete")
	public String basketDelete(@RequestParam String[] bno, BasketBean basket, Model model, HttpServletRequest request) {
		
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		for(int i=0 ; i<bno.length; i++) {
			System.out.println("BasketController bno i : " + bno[i]);
		}
		
		List<String> deletenolist = Arrays.asList(bno);
		System.out.println("BasketController deletenolist: "+deletenolist);
		int basketdelete = dao.delete(deletenolist);
		return "redirect:/basket";
	}
	
	@RequestMapping("/basketalldelete")
	public String basketAllDelete(Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		int basketalldelete = dao.deleteAll(member);
		return "redirect:/basket";
	}
	
	@RequestMapping("/basketzerodelete")
	public String basketZeroDelete(Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		int basketzerodelete = dao.deleteZeroBasket(member);
		return "redirect:/basket";
	}
	
	@RequestMapping("/basketTopayment")
	public String basketTopay(@ModelAttribute BasketBean basket, Model model, HttpServletRequest request) {
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		MemberBean basketList = dao.payList(member);
		
		String[] chooseSt = request.getParameterValues("choose");
		int[] chooseInt = new int[chooseSt.length];
		for(int i=0 ; i<chooseInt.length; i++) {
			chooseInt[i] = Integer.parseInt(chooseSt[i]);
		}
		int[] basketno = new int[basket.getBasketbeanList().size()];
		for(int j=0 ; j<basket.getBasketbeanList().size(); j++) {
			basketno[j] = basket.getBasketbeanList().get(j).getB_No();
		}
		List<BasketBean> memBasket = new ArrayList<BasketBean>();
		for(int i=0 ; i<chooseSt.length; i++) {
			for(int j=0 ; j<basket.getBasketbeanList().size(); j++) {
				if(chooseInt[i] == basketno[j]) {
					memBasket.add(basket.getBasketbeanList().get(j));
				}
			}
		}
		
		model.addAttribute("Member", basketList);
		System.out.println("BasketController 1 : "+ basketList);
		model.addAttribute("memBasket", memBasket);
		System.out.println("BasketController : " + memBasket);
		return "payment/payment";
	}
	
	@RequestMapping("/basketUpdate")
	public String basketUpdate(@RequestParam int bno, @RequestParam int land, @RequestParam int price, 
			@RequestParam int[] checkindex, BasketBean basket, Model model, HttpServletRequest request, RedirectAttributes redirectuse) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		System.out.println("들어옴");
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		String id = member.getM_Id();
		basket.setB_Id(id);
		basket.setB_No(bno);
		basket.setB_Land(land);
		basket.setB_Totalprice(price);
		int update = dao.update(basket);
		String referer = request.getHeader("Referer");
		redirectuse.addFlashAttribute("checkindex", checkindex);
		return "redirect:"+ referer;

	}
	
	@RequestMapping("/basketSeedUpdate")
	public String basketSeedUpdate(@RequestParam int bno, @RequestParam String seed, @RequestParam int[] checkindex,
			BasketBean basket, Model model, HttpServletRequest request, RedirectAttributes redirectuse) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		String id = member.getM_Id();
		basket.setB_Id(id);
		basket.setB_No(bno);
		basket.setB_Seed(seed);
		int seedupdate = dao.seedupdate(basket);
		String referer = request.getHeader("Referer");
		redirectuse.addFlashAttribute("checkindex", checkindex);
		return "redirect:"+ referer;
	}
	
	@RequestMapping("/paytest")
	public String basketPayTest(Model model, HttpServletRequest request) {
		 	String name = "이지원";
		    String email = "jw@jw";
		    String phone = "010-010";
		    String address = "서울시";
		    String totalPrice = "1000";
		    request.setAttribute("name", name);
		    request.setAttribute("email", email);
		    request.setAttribute("phone", phone);
		    request.setAttribute("address", address);
		    request.setAttribute("totalPrice", totalPrice);
		    
		return "payment/Pay";
	}
	
	@RequestMapping("/test")
	public String test(Model model, HttpServletRequest request) {
		return "payment/basket1";
	}
	
}


		

