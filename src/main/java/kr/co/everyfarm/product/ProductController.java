package kr.co.everyfarm.product;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.everyfarm.basket.BasketBean;
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
			HttpServletRequest request,MemberBean memberBean) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int pno = basketbean.getBasketbeanList().get(0).getB_Pno();

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
	
	
	
	@RequestMapping(value="/productpayment")
	public String getproductpayment(Model model, @ModelAttribute ("basketbean") BasketBean basketbean) {
		List<BasketBean> list = basketbean.getBasketbeanList();
		
		int j = list.size();
		for(int i =0; i<j; i++) {
			if(list.get(i).getB_Land()<=0) {
				list.remove(i);
				j--;
				i--;
			}
		}
		basketbean.setBasketbeanList(list);
	
		model.addAttribute("memBasketModel",basketbean);
		return "/product/test1";
		
	}
	//테스트 해당 아래 사항 죽음
	
	@RequestMapping(value="/productlist2")
	public String getProductlist2(Model model, @ModelAttribute ("pagebeen") PageBeen pagebeen) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		
		List<ProductBean> productlist = dao.listserachpageingcount(pagebeen);
		int selecttotalindex = productlist.size();
		pagebeen.setTableindex(selecttotalindex);
		productlist = dao.listserachpageing(pagebeen);

		
		model.addAttribute("pagebeen",pagebeen);
		model.addAttribute("productlist",productlist);
		return "product/productList2";
	}
	
	@RequestMapping(value="/testlist2")
	@ResponseBody
	public Map<String, Object> gettestlist2(Model model, PageBeen pagebeen) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		
		List<ProductBean> productlist = dao.listserachpageingcount(pagebeen);
		int selecttotalindex = productlist.size();
		pagebeen.setTableindex(selecttotalindex);
		productlist = dao.listserachpageing(pagebeen);
		
		map.put("productlist", productlist);
		map.put("pagebeen", pagebeen);
		
		
		
		return map;
	
	}
	
	//테스트 해당 아래 사항 죽임.
	
	
	
	
	//관리자 덧글 불러오기.
	@RequestMapping(value="/productqnaadminlist")
	public String getadmintProductpnalist(Model model, @ModelAttribute ("pagebeen") PageBeen pagebeen) {
		ProductqnaDAO dao = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		//where 조건 집어 넣기.
		if(!( pagebeen.getWhere().contains("c_") )){
			pagebeen.setWhere("c_Id");
			pagebeen.setWhere2("c_Id");
			pagebeen.setOrderby("c_Seq");
			pagebeen.setLimit(10);
		}
		
		
		int count = dao.listserachcount();
		pagebeen.setTableindex(count);
		List<ProductqnaBean> productqnalist = dao.listserachpageing(pagebeen);
		
		
		System.out.println(pagebeen.getWhere() + "where 값은???");
		System.out.println(pagebeen.getWherecolumn() + " wherecolumn 값은?");
		System.out.println(pagebeen.getWhere2() + "where2 값은???");
		System.out.println(pagebeen.getWherecolumn2() + " wherecolumn2 값은?");
		
		model.addAttribute("productqnalist",productqnalist);
		model.addAttribute("pagebeen",pagebeen);
		
		return "product/productqnaadminlist";
	}
	
	

	
	
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
	
	
	
	// 김주혁

		@RequestMapping(value = "/productqnainsert")
		public String getinsertqna(Model model, @ModelAttribute("productqna") ProductqnaBean productqna) {

			ProductqnaDAO dao = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
			int productinsert = dao.insert(productqna);
			System.out.println(productinsert);
			return "redirect:/productqnalist";
		}

		@RequestMapping(value = "/proRegisterForm")
		public String getRegisterform(Model model, @ModelAttribute("product") ProductBean productbean) {
			model.addAttribute("product", productbean);
			return "product/proRegisterForm";
		}

		@RequestMapping(value = "/proLandListForm")
		public String getLandListform(Model model, @ModelAttribute("product") ProductBean productbean) {
			model.addAttribute("product", productbean);
			return "product/proLandListForm";
		}

		@RequestMapping(value = "/ProductRegister", method = RequestMethod.POST) // 농장등록 여기서 동작함.
		public String getreginsert(Model model, @ModelAttribute("product") ProductBean productbean,
				@RequestParam(value = "p_Img1", required = false) MultipartFile mRequest,
				@RequestParam(value = "p_Subimg12", required = false) MultipartFile mRequest2,
				@RequestParam(value = "p_Subimg22", required = false) MultipartFile mRequest3,
				@RequestParam(value = "p_Subimg32", required = false) MultipartFile mRequest4,
				@RequestParam(value = "p_Subimg42", required = false) MultipartFile mRequest5,
				@RequestParam(value = "p_Imgdetail12", required = false) MultipartFile mRequest6,
				@RequestParam(value = "p_Imgdetail22", required = false) MultipartFile mRequest7,
				@RequestParam(value = "p_Imgdetail32", required = false) MultipartFile mRequest8,
				@RequestParam(value = "p_Imgdetail42", required = false) MultipartFile mRequest9) {
			MultipartFile[] ab = { mRequest, mRequest2, mRequest3, mRequest4, mRequest5, mRequest6, mRequest7, mRequest8,
					mRequest9 };
			
			productbean.setP_Accept("N");
			ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);//dao
			int pnomax = dao.listmaxpno();
			String path = "D:\\final\\.metadata\\.plugins\\org.eclipse.wst.server.core\\"
							+ "tmp0\\wtpwebapps\\everyfarm\\resources\\upload\\product\\"+pnomax + "\\";
			
			//String pathSet = request.getSession().getServletContext().getResourcePaths("/");
			
			//path = "resources"+File.separator+"upload"+File.separator+"product"+File.separator + pnomax + File.separator;

			File Folder = new File(path);
			if (!Folder.exists()) {
				try{
				    Folder.mkdir(); //폴더 생성합니다.
				    System.out.println("폴더가 생성되었습니다.");
			        } 
			        catch(Exception e){
				    e.getStackTrace();
				}        
		         }else {
				System.out.println("이미 폴더가 생성되어 있습니다.");
			}
			
			
			String safeFile;
			String originFileName;
			long fileSize;
			productbean.setP_Img(mRequest.getOriginalFilename());
			productbean.setP_Subimg1(mRequest2.getOriginalFilename());
			productbean.setP_Subimg2(mRequest3.getOriginalFilename());
			productbean.setP_Subimg3(mRequest4.getOriginalFilename());
			productbean.setP_Subimg4(mRequest5.getOriginalFilename());
			productbean.setP_Imgdetail1(mRequest6.getOriginalFilename());
			productbean.setP_Imgdetail2(mRequest7.getOriginalFilename());
			productbean.setP_Imgdetail3(mRequest8.getOriginalFilename());
			productbean.setP_Imgdetail4(mRequest9.getOriginalFilename());
			for (int i = 0; i < ab.length; i++) {
				originFileName = ab[i].getOriginalFilename(); // 원본 파일 명
				fileSize = ab[i].getSize(); // 파일 사이즈
				safeFile = path + originFileName;
				try {
					//ab[i].transferTo(new File(safeFile));
					if(fileSize > 100) {
						ab[i].transferTo(new File(safeFile));
					}
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			dao.insert(productbean);
			return "redirect:/proAdminListForm";
		}

		@RequestMapping(value = "/proAdminListForm")
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

			return "product/proAdminListForm";
		}

		@RequestMapping("/proRegDetailForm")
		public String getRegDetail(Model model, @RequestParam int p_No) {
			System.out.println(p_No);
			ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
			ProductBean productinfo = dao.info(p_No);
			System.out.println(productinfo.toString());
			model.addAttribute("productinfo", productinfo);
			return "product/proRegDetailForm";

		}
}