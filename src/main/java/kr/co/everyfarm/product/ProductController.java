package kr.co.everyfarm.product;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.everyfarm.basket.BasketBean;
import kr.co.everyfarm.basket.BasketDAO;
import kr.co.everyfarm.user.MemberBean;

@Controller
public class ProductController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	
	
	//아래 박정빈
	
	@RequestMapping(value="/productlist")
	public String getProductlist(Model model, @ModelAttribute ("pagebeen") PageBeen pagebeen) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		List<ProductBean> productlist = dao.listserachpageingcount(pagebeen);
		int selecttotalindex = productlist.size();
		pagebeen.setTableindex(selecttotalindex);
		productlist = dao.listserachpageing(pagebeen);

		model.addAttribute("pagebeen",pagebeen);
		model.addAttribute("productlist",productlist);
		return "product/productList";
	}
	
	@RequestMapping(value="/productdetail")
	public String getProductlist(Model model, @RequestParam("productno") String productno
			,@ModelAttribute ("basketbean") BasketBean basketbean,HttpServletRequest request,
			MemberBean memberBean) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int p_No = Integer.parseInt(productno);
		ProductBean oneproduct = dao.onelist(p_No);
		HttpSession session = request.getSession();
		memberBean = (MemberBean)session.getAttribute("member");
		if(memberBean != null) {
			System.out.println(memberBean.getM_Id() + "로그인 아이디.");
			model.addAttribute("mid",memberBean.getM_Id());
		}else {
			model.addAttribute("mid","");
		}
		
		model.addAttribute("oneproduct",oneproduct);
		return "/product/productdetail";
	}
	
	
	
	@RequestMapping(value="/productbasketchoice")
	public String getProductbasketchoice(Model model, @ModelAttribute ("basketbean") BasketBean basketbean,
			HttpServletRequest request, MemberBean memberBean, HttpServletResponse response) throws IOException {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
	
		int pno = basketbean.getBasketbeanList().get(0).getB_Pno();
//		
//		BasketDAO basketdao = sqlSessionTemplate.getMapper(BasketDAO.class);
//		int basketTotalLand = basketdao.selectBasketLandTotal(pno);
//		int productAble = basketdao.selectProductAble(pno);
//		
//		int chooseLandTotal = 0;
//		for(int i=0 ; i < basketbean.getBasketbeanList().size() ; i++) {
//			chooseLandTotal += basketbean.getBasketbeanList().get(i).getB_Land();
//		}
//		
//		if(basketTotalLand > productAble) {
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
////			out.println("<script>alert('" + basketbean.getBasketbeanList().get(0).getP_Title() + "의 최대 수량은 " + productAble[0] +" 입니다. 수량을 조절해주세요.'); location.href='/basket';</script>");
//			out.flush();
//		}
////		

		//장바구니로 간다.
		HttpSession session = request.getSession();
		memberBean = (MemberBean)session.getAttribute("member");
		
			if(memberBean != null) {
				//member bean 존재시.
				//테이블에 저장한다.
				for(int i=0; i < basketbean.getBasketbeanList().size() ; i++) {
					if(basketbean.getBasketbeanList().get(i).getB_Land() != 0) {
						dao.insertbasket(basketbean.getBasketbeanList().get(i));
					}
				}
			}else {
				//memberbean 없을 때.
				//session에 저장한다.
				//변경 예정 장바구니 클릭시 로그인 페이지로 이동시킨다.
				session.setAttribute("nomemBasketSession", basketbean);
			}
			
		String url = "redirect:/productdetail"+"?productno="+pno; 	
		return url;
	}
	
	
	
//	@RequestMapping(value="/productpayment")
//	public String getproductpayment(Model model, @ModelAttribute ("basketbean") BasketBean basketbean) {
//		List<BasketBean> list = basketbean.getBasketbeanList();
//		int j = list.size();
//	      for(int i =0; i<j; i++) {
//	         if(list.get(i).getB_Land()<=0) {
//	            list.remove(i);
//	            j--;
//	            i--;
//	         }
//	      }
//	      basketbean.setBasketbeanList(list);
//		model.addAttribute("memBasketModel",basketbean);
//		return "/payment/payment";
//		
//	}
	
	
	

	
	
	/*
	
	@RequestMapping(value="/productbasketchoice")
	public String getProductbasketchoice(Model model, @ModelAttribute ("basketbean") BasketBean basketbean) {
		String id = basketbean.getBasketbeanList().get(0).getB_Id();
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		for(int i=0; i < basketbean.getBasketbeanList().size() ; i++) {
			if(basketbean.getBasketbeanList().get(i).getB_Land() != 0) {
				dao.insertbasket(basketbean.getBasketbeanList().get(i));
				System.out.println("동작?");
			}
		}
		model.addAttribute("basketbean",basketbean);
		return "/product/test1";
	}
	*/
	//위 사용 중...박정빈	
	

	
	@RequestMapping(value="/adminproductlist")
	public String getAdminProductList333(Model model) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<ProductBean> list = dao.list();
		model.addAttribute("productlist",list);
		return "product/productadminlist";
	}
	//아래 테스트 중....

	
	
	@RequestMapping(value="/productupdateform")
	public String getProductupdateform(Model model,@RequestParam("no") String no, @ModelAttribute ("productbean") ProductBean productbean) {
		int p_No = Integer.parseInt(no);
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		ProductBean productonelist = dao.onelist(p_No);
		model.addAttribute("productonelist",productonelist);
		model.addAttribute("productbean", productbean);
		System.out.println("여기는 동작되는가?");
		return "product/productupdateform";
	}
	
	@RequestMapping(value="/productupdate")
	public String getProductupdate(Model model, @ModelAttribute ("productbean") ProductBean productbean) {
	
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int a = dao.update(productbean);
		return "redirect:/productlist";
	}
	

	
	@RequestMapping(value="/productinsertform")
	public String getinsertform(Model model, @ModelAttribute ("productbean") ProductBean productbean) {
		
		model.addAttribute("productbean", productbean);
		
		return "product/productinsertform";
	}
	
	@RequestMapping(value="/productinsert")
	public String getinsert(Model model, @ModelAttribute ("productbean") ProductBean productbean) {
		String aaa = productbean.getP_Id();
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		System.out.println("tlfgod???");
		int productinsert = dao.insert(productbean);
		System.out.println(aaa + "출력확인");
		System.out.println(productinsert);
		return "redirect:/productlist";
	}
	
	
	
	@RequestMapping(value="/productqnalist")
	public String getProductqna(Model model) {
		ProductqnaDAO dao = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		List<ProductqnaBean> productqnalist = dao.list();
		model.addAttribute("productqnalist",productqnalist);
		return "product/productqnaList";
	}
	
	
	
	
	@RequestMapping(value="/productqnainsertform")
	public String getqnainsertform(Model model, @ModelAttribute ("productqna") ProductqnaBean productqna) {
		
		model.addAttribute("productqna", productqna);
		
		return "product/productqnainsertform";
	}
	
	
	
	//김주혁
	
	
	@RequestMapping(value = "/productqnainsert")
	public String getinsertqna(Model model, @ModelAttribute("productqna") ProductqnaBean productqna) {

		ProductqnaDAO dao = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		int productinsert = dao.insert(productqna);
		System.out.println(productinsert);
		return "redirect:/productqnalist";
	}

	@RequestMapping(value = "/ProductRegisterform")
	public String getRegisterform(Model model, @ModelAttribute("product") ProductBean productbean) {
		model.addAttribute("product", productbean);
		return "product/ProductRegisterform";
	}

	@RequestMapping(value = "/ProductRegister")
	public String getreginsert(Model model, @ModelAttribute("product") ProductBean productbean) {
		System.out.println(productbean);
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int productinsert = dao.insert(productbean);
		System.out.println(productinsert);
		return "redirect:/productadminlistform";
	}
	
	   @RequestMapping(value = "/productadminlistform")
	   public String getAdminProductList(Model model, @ModelAttribute("pagebeen") PageBeen pagebeen) {
	      ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);

	      /// List<ProductBean> list = dao.list();
	      int limit = 10;
	      pagebeen.setLimit(limit);
	      List<ProductBean> list = dao.listserachpageingcount(pagebeen);
	      int selecttotalindex = list.size();
	      pagebeen.setTableindex(selecttotalindex);
	      list = dao.listserachpageing(pagebeen);

	      model.addAttribute("productlist", list);

	      return "product/productadminlistform";
	   }                      

	   @RequestMapping("/proregdetailform")
	   public String getRegDetail(Model model, @RequestParam int p_No) {
	      ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
	      ProductBean productinfo = dao.info(p_No);
	      model.addAttribute("productinfo", p_No);
	      return "product/proregdetailform";
	   }
	
	
	
}
