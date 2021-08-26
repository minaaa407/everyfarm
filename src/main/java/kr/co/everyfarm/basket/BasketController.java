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
//		if(checkindex != null) {
//			model.addAttribute("checkindex", checkindex);
//			for(int i=0; i<checkindex.length; i++) {
//				System.out.println("여기까지 잘옴 : " + checkindex[i]);
//			}
//		}
		return "payment/basket";
	}
	
	@RequestMapping("/basketdelete")
	public String basketDelete(@RequestParam String[] bno, BasketBean basket, Model model, HttpServletRequest request) {
		
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		/* String[] chooseSt = request.getParameterValues("choose"); */
		for(int i=0 ; i<bno.length; i++) {
			System.out.println("BasketController bno i : " + bno[i]);
		}
		/* System.out.println("BasketController chooseSt: "+ chooseSt); */
//		int[] chooseInt = new int[chooseSt.length];
//		for(int i=0 ; i<chooseInt.length; i++) {
//			chooseInt[i] = Integer.parseInt(chooseSt[i]);
//		}
//		System.out.println("chooseInt : "+chooseInt);
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
	public String basketTopay(@ModelAttribute BasketBean basket, Model model, HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
//		@RequestParam int b_No, @RequestParam int b_Pno, @RequestParam int b_Land, @RequestParam String b_Seed
		
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
		System.out.println("memBasket : " + memBasket);
					
				
		List<BasketBean> equalPnoPlusAble = new ArrayList<BasketBean>();

		for(int i = 0; i < memBasket.size(); i++) {
			int pno = memBasket.get(i).getB_Pno();
			int able = memBasket.get(i).getP_Landavailable();
			boolean isIn = false;
			
			for(int j = 0; j < equalPnoPlusAble.size(); j++) {
				if(equalPnoPlusAble.get(j).getB_Pno() == pno) {
					equalPnoPlusAble.get(j).setP_Landavailable(equalPnoPlusAble.get(j).getP_Landavailable() + able);
					isIn = true;
				}
			}
			if(!isIn){
				 BasketBean hold = new BasketBean();
					hold.setB_Pno(pno);
					hold.setP_Landavailable(able);
					equalPnoPlusAble.add(hold);
			}
		}
		
		
		/*int[] basketPnoTotal = new int[pnoAbleBasket.size()];*/
		List<Integer> basketPnoAll = new ArrayList<Integer>();
		for(int i = 0; i < equalPnoPlusAble.size(); i++) {
			/*basketPnoTotal[i] = pnoAbleBasket.get(i).getB_Pno();*/
			basketPnoAll.add(equalPnoPlusAble.get(i).getB_Pno());
			System.out.println("BasketController equal : "+ equalPnoPlusAble.get(i).getB_Pno());
			System.out.println("BasketController all : " + basketPnoAll.get(i));
		}
		
		List<BasketBean> productGetAble = new ArrayList<BasketBean>();
		for(int i = 0; i < basketPnoAll.size(); i++) {
			BasketBean hold = new BasketBean();
			int pno = basketPnoAll.get(i);
			hold = dao.getAvailable(pno);
			productGetAble.add(hold);
		}
		
		
		for(int i = 0; i < productGetAble.size(); i++) {
			System.out.println("BasketController productGetAble : " + productGetAble.get(i).getB_Pno());
			System.out.println("BasketController equalPnoPlusAble : " + equalPnoPlusAble.get(i).getB_Pno());
		}
		
		
		String[] title = new String[equalPnoPlusAble.size()];
		int[] productAble = new int[equalPnoPlusAble.size()];
		int count = 0;
		int[] problemPno = new int[equalPnoPlusAble.size()];
		
		for(int i = 0; i < equalPnoPlusAble.size(); i++) {
			if(equalPnoPlusAble.get(i).getP_Landavailable() > productGetAble.get(i).getP_Landavailable()) {
				System.out.println("BasketController equalPnoPlusAble" +equalPnoPlusAble.get(i).getP_Landavailable());
				System.out.println("BasketController equalPnoPlusAble" +equalPnoPlusAble.get(i).getB_Pno());
				System.out.println("BasketController productGetAble" +productGetAble.get(i).getP_Landavailable());
				System.out.println("BasketController productGetAble" +productGetAble.get(i).getB_Pno());
				title[i] = productGetAble.get(i).getP_Title();
				productAble[i] = productGetAble.get(i).getP_Landavailable();
				problemPno[i] = productGetAble.get(i).getB_Pno();
				System.out.println("BasketController problemPno[i] :"+problemPno[i]);
				count++;
			}
		}
		  
		
		
//		for(int i = 0; i < equalPnoPlusAble.size(); i++) {
//			for(int j = 0; j < equalPnoPlusAble.size(); j++) {
//				if(equalPnoPlusAble.get(i).getB_Pno() == productGetAble.get(j).getB_Pno()) {
//					if(equalPnoPlusAble.get(i).getP_Landavailable() > productGetAble.get(i).getP_Landavailable()) {
//						System.out.println("equalPnoPlusAble" +equalPnoPlusAble.get(i).getP_Landavailable());
//						System.out.println("equalPnoPlusAble" +equalPnoPlusAble.get(i).getB_Pno());
//						System.out.println("productGetAble" +productGetAble.get(i).getP_Landavailable());
//						System.out.println("productGetAble" +productGetAble.get(i).getB_Pno());
//						title[i] = productGetAble.get(i).getP_Title();
//						productAble[i] = productGetAble.get(i).getP_Landavailable();
//						problemPno[i] = productGetAble.get(i).getB_Pno();
//						System.out.println("problemPno[i] "+problemPno[i]);
//						count++;
//				}
//			
//			}
//		  }
//		}
		
//		if(count > 0) {
//			List<BasketBean> seedAll = dao.getSeed(problemPno);
//			System.out.println("seedAll" + seedAll);
//			for(int i = 0; i < seedAll.size(); i++) {
//				System.out.println("seedAll : " + seedAll.get(i));
//			}
//		}
		
		
		
		System.out.println("BasketController Arrays : " + Arrays.toString(title));
		for(int i = 0; i < title.length; i++) {
			System.out.println("BasketController title" + title[i]);
		}
		
		
		
		/*
		 * int titlesize = title.length; System.out.println("titlesize : "+titlesize);
		 */
		
		if(count == 1) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('선택하신 상품 중 " + title[0] + " 상품 씨앗들의 수량을 조절해주세요! \\n" 
						+ title[0] + " 씨앗들의 총 수량은 " + productAble[0] +" 을 초과할 수 없습니다.'); location.href='/basket';</script>");
			out.close();
		} else if(count == 2 ) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('선택하신 상품 중 " + title[0] + ", " + title[1] + " 상품 씨앗들의 수량을 조절해주세요! \\n"
						+ title[0] + " 씨앗들의 총 수량은 " + productAble[0] + "을 초과할 수 없고, \\n" 
						+ title[1] + " 씨앗들의 총 수량은 "+ productAble[1] + "을 초과할 수 없습니다.'); location.href='/basket';</script>");
			out.close();
		
		} else if(count == 3 ) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('선택하신 상품 중 "  + title[0] + ", " + title[1] + ", " + title[2] + " 상품 씨앗들의 수량을 조절해주세요! \\n" 
						+ title[0] + " 씨앗들의 총 수량은 " + productAble[0] + "을, " 
						+ title[1] + " 씨앗들의 총 수량은 "+ productAble[1] + "을, \\n" 
						+ title[2] + " 씨앗들의 총 수량은 " + productAble[2]+ "을 초과할 수 없습니다.'); location.href='/basket';</script>");
			out.close();
		
		} else if(count > 0) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다음 상품의 최대 수량을 초과하셨습니다. 중복 상품에 유의하여 수량을 조절해주세요." + Arrays.toString(title) +"'); location.href='/basket';</script>");
			out.close();
		}
				
		model.addAttribute("Member", basketList);
		model.addAttribute("memBasket", memBasket);
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


		

