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
	
	@RequestMapping(value="/testsession")
	public String testsession(Model model,@ModelAttribute ("pagebeen") PageBeen pagebeen) {
	//public String testsession(Model model,@RequestParam("id") String id,@RequestParam("name") String name,HttpSession session) {
		//session.setAttribute("id", id);
		//session.setAttribute("name", name);
		System.out.println(pagebeen.getSelectpage() + "selectpage깞은???");
		model.addAttribute("pagebeen",pagebeen);
		return "sessiontest";
	}

	
	@RequestMapping(value="/testlist")
	public String getProducttest(Model model) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<ProductBean> list = dao.list();
		model.addAttribute("productlist",list);
		return "product/test1";
	}
	@RequestMapping(value="/productlist2")
	public String getProducttest2(Model model) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<ProductBean> list = dao.list();
		model.addAttribute("productlist",list);
		return "product/productlist2";
	}
	
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
	public String getProductlist(Model model, @RequestParam("productno") String productno) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int p_No = Integer.parseInt(productno);
		ProductBean oneproduct = dao.onelist(p_No);
		
		model.addAttribute("oneproduct",oneproduct);
		return "product/productdetail";
	}
	
	
	@RequestMapping(value="/adminproductlist")
	public String getAdminProductList333(Model model) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<ProductBean> list = dao.list();
		model.addAttribute("productlist",list);
		return "product/productadminlist";
	}
	//아래 테스트 중....
	@RequestMapping(value="/adminproductlist2")
	public String getAdminProductList2(Model model, @ModelAttribute ("pagebeen") PageBeen pagebeen) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<ProductBean> productlist = dao.listserachpageingcount(pagebeen);
		System.out.println(productlist.size() + "출력 갯수");
		int selecttotalindex = productlist.size();
		pagebeen.setTableindex(selecttotalindex);
		productlist = dao.listserachpageing(pagebeen);
		model.addAttribute("pagebeen",pagebeen);
		model.addAttribute("productlist",productlist);
		return "product/productadminlist";
	}
	
	
	@RequestMapping(value="/adminproductqnalist")
	public String getAdminProductQna(Model model,@ModelAttribute ("pagebeen") PageBeen pagebeen) {
		ProductqnaDAO dao = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		List<ProductqnaBean> productqnalist = dao.list();
		int selecttotalindex = productqnalist.size();
		pagebeen.setTableindex(selecttotalindex);
		model.addAttribute("pagebeen",pagebeen);
		model.addAttribute("productqnalist",productqnalist);
		return "product/productadminqnaList";
	}
	
	
	
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
	public String getAdminlistform(Model model) {
		return "redirect:/adminproductlistform";
	}
	@RequestMapping(value = "/adminproductlistform")
	public String getAdminProductList(Model model) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<ProductBean> list = dao.list();
		model.addAttribute("productlist", list);
		return "product/productadminlistform";
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
