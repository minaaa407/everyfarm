package kr.co.everyfarm.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	@RequestMapping(value="/productlist")
	public String getProduct(Model model) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<Product> list = dao.list();
		model.addAttribute("productlist",list);
		return "product/productList";
	}
	
	@RequestMapping(value="/testlist")
	public String getProducttest(Model model) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<Product> list = dao.list();
		model.addAttribute("productlist",list);
		return "product/test1";
	}
	
	
	
	@RequestMapping(value="/productupdateform")
	public String getProductupdateform(Model model,@RequestParam("no") String no, @ModelAttribute ("product") Product product) {
		int p_No = Integer.parseInt(no);
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		Product productonelist = dao.onelist(p_No);
		model.addAttribute("productonelist",productonelist);
		model.addAttribute("product", product);
		System.out.println("여기는 동작되는가?");
		return "product/productupdateform";
	}
	
	@RequestMapping(value="/productupdate")
	public String getProductupdate(Model model, @ModelAttribute ("product") Product product) {
	
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int a = dao.update(product);
		return "redirect:/productlist";
	}
	

	
	@RequestMapping(value="/productinsertform")
	public String getinsertform(Model model, @ModelAttribute ("product") Product product) {
		
		model.addAttribute("product", product);
		
		return "product/productinsertform";
	}
	
	@RequestMapping(value="/productinsert")
	public String getinsert(Model model, @ModelAttribute ("product") Product product) {
		String aaa = product.getP_Id();
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		System.out.println("tlfgod???");
		int productinsert = dao.insert(product);
		System.out.println(aaa + "출력확인");
		System.out.println(productinsert);
		return "redirect:/productlist";
	}
	
	
	
	@RequestMapping(value="/productqnalist")
	public String getProductqna(Model model) {
		ProductqnaDAO dao = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		List<Productqna> productqnalist = dao.list();
		model.addAttribute("productqnalist",productqnalist);
		return "product/productqnaList";
	}
	
	
	@RequestMapping(value="/productqnainsertform")
	public String getqnainsertform(Model model, @ModelAttribute ("productqna") Productqna productqna) {
		
		model.addAttribute("productqna", productqna);
		
		return "product/productqnainsertform";
	}
	
	@RequestMapping(value="/productqnainsert")
	public String getinsertqna(Model model, @ModelAttribute ("productqna") Productqna productqna) {
	
		ProductqnaDAO dao = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		int productinsert = dao.insert(productqna);
		System.out.println(productinsert);
		return "redirect:/productqnalist";
	}
	
	@RequestMapping(value="/ProductRegisterform")
	public String getRegisterform(Model model, @ModelAttribute ("product") Product product) {
		
		model.addAttribute("product", product);
		
		return "product/ProductRegisterform";
	}
	
	@RequestMapping(value="/ProductAdminReg")
	public String getAdminRegform(Model model, @ModelAttribute ("product") Product product) {
		
		model.addAttribute("product", product);
		
		return "product/ProductAdminReg";
	}

	
	
	//@RequestMapping("/mb/empInfo")
	//public String productinsert(Model model, @RequestParam int empno) {
	//	System.out.println("동작된거야?");
//		EmpDAO dao = sqlSessionTemplate.getMapper(EmpDAO.class);
//		System.out.println(empno+"번호 뭐여?");
//		Emp emp = dao.info(empno);
//		model.addAttribute("empInfo", emp);
//		return "mb/empInfo";
//	}
	
}


/*
@Controller
public class MemberController {
	
	@RequestMapping(value = "/user/{var}")
	public String User(@PathVariable("var") String var) {
		String returnUrl = "";
		if(var.equals("login")) {
			returnUrl = "member/loginForm";
		}else if(var.equals("sign")) {
			returnUrl = "member/signUp";
		}
		return returnUrl;
	}
}
*/
