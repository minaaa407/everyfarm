package kr.co.everyfarm.product;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	@Autowired
	ServletContext servletContext;
	// 아래 박정빈

	@RequestMapping(value="/productlist")
	   public String getProductlist(Model model, @ModelAttribute ("pagebeen") PageBeen pagebeen) {
	      ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
	      DecimalFormat decFormat = new DecimalFormat("###,###");
	      List<ProductBean> productlist = dao.listserachpageingcount(pagebeen);
	      int no = 0;
	      int selecttotalindex = dao.listacceptcount();
	      pagebeen.setTableindex(selecttotalindex);
	      productlist = dao.listserachacceptpageing(pagebeen);
	      
	      float[] rateArray = new float[productlist.size()];
	      String[] pricecomma = new String[productlist.size()];
	      for(int i=0; i< productlist.size(); i++) {
	    	 no = productlist.get(i).getP_No();
	    	 rateArray[i] = dao.productfrate(no);
	    	 pricecomma[i] =decFormat.format( productlist.get(i).getP_Landprice());
	      }
	      
	
	      
	      model.addAttribute("rateArray", rateArray);
	      model.addAttribute("pricecomma", pricecomma);
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
	      //product id 값 가져오고 그 다음  farmer 평점 가져오기.
	      
	      HttpSession session = request.getSession();
	      memberBean = (MemberBean)session.getAttribute("member");//Farmer,admin,member 처리.
	      //rate 가져오기.
	      float f_rate = dao.productfrate(p_No);
	      //view 카운터 올리기
	      int p_View = dao.viewpno(p_No);
	      p_View= p_View+1;
	      ProductBean productbean = new ProductBean();
	      productbean.setP_No(p_No);
	      productbean.setP_View(p_View);
	      dao.updateview(productbean);
	      //view 카운터 올리기
	      
	      if(memberBean != null) {
	         
	         model.addAttribute("mid",memberBean.getM_Id());
	      }else {
	         model.addAttribute("mid","");
	      }
	      //아래 댓글
	      ProductqnaDAO dao2 = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
	      PageBeen pagebeen = new PageBeen();
	      int qnacount = dao2.productqnalistcount(productno);
	      pagebeen.setLimit(10);
	      pagebeen.setTableindex(qnacount);
	      pagebeen.setWherecolumn(productno);
	      List<ProductqnaBean> qnalist = dao2.productqnalist(pagebeen);
	      
	      model.addAttribute("p_No",p_No);
	      model.addAttribute("pagebeen",pagebeen);
	      model.addAttribute("qnalist",qnalist);
	      model.addAttribute("f_rate",f_rate);
	      model.addAttribute("oneproduct",oneproduct);
	      
	      return "/product/productdetail";
	      
	   }
	   
	   
	   
	   @RequestMapping(value="/productbasketchoice")
	   public String getProductbasketchoice(Model model, @ModelAttribute ("basketbean") BasketBean basketbean,
	         HttpServletRequest request,MemberBean memberBean) {
	      
	      List<BasketBean> list = basketbean.getBasketbeanList();
	      int j = list.size();
	      ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
	      //int pno = basketbean.getBasketbeanList().get(0).getB_Pno();
	      for(int i =0; i<j; i++) {
	         if(list.get(i).getB_Land()<=0) {
	            list.remove(i);
	            j--;
	            i--;
	         }
	      }
	      //장바구니로 간다.
	      
	      
	            for(int i=0; i < basketbean.getBasketbeanList().size() ; i++) {
	               if(basketbean.getBasketbeanList().get(i).getB_Land() != 0) {
	                  //dao.insertbasket(basketbean.getBasketbeanList().get(i));
	               }
	            }
	      basketbean.setBasketbeanList(list);
	      model.addAttribute("basketbean",basketbean);
	      //String url = "redirect:/productdetail"+"?productno="+pno;    
	      return "/product/test1";
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
	// 테스트 해당 아래 사항 죽음

	@RequestMapping(value = "/productlist2")
	public String getProductlist2(Model model, @ModelAttribute("pagebeen") PageBeen pagebeen) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);

		List<ProductBean> productlist = dao.listserachpageingcount(pagebeen);
		int selecttotalindex = productlist.size();
		pagebeen.setTableindex(selecttotalindex);
		productlist = dao.listserachpageing(pagebeen);

		model.addAttribute("pagebeen", pagebeen);
		model.addAttribute("productlist", productlist);
		return "product/productList2";
	}
	
	
	@RequestMapping(value = "/productlistpage")
	@ResponseBody
	public Map<String, Object> getproductlistpage(Model model, PageBeen pagebeen) {

		Map<String, Object> map = new HashMap<String, Object>();
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		DecimalFormat decFormat = new DecimalFormat("###,###");

		List<ProductBean> productlist = dao.listserachpageingcount(pagebeen);
		int no = 0;
		int selecttotalindex = dao.listacceptcount();
		
		pagebeen.setTableindex(selecttotalindex);
		productlist = dao.listserachacceptpageing(pagebeen);

	      
	      
	      
	      float[] rateArray = new float[productlist.size()];
	      String[] pricecomma = new String[productlist.size()];
	      for(int i=0; i< productlist.size(); i++) {
	    	 no = productlist.get(i).getP_No();
	    	 rateArray[i] = dao.productfrate(no);
	    	 pricecomma[i] =decFormat.format( productlist.get(i).getP_Landprice());
	      }
	    
	    map.put("pricecomma", pricecomma);
	    map.put("rateArray", rateArray);  
		map.put("productlist", productlist);
		map.put("pagebeen", pagebeen);

		return map;

	}
	
	
	@RequestMapping(value = "/productdetailoneqna")
	@ResponseBody
	public Map<String, Object> productdetailoneqna(@RequestParam("c_No") String c_No,@RequestParam("c_Seq") String c_Seq) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		ProductqnaDAO dao2 = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		ProductqnaBean onelist = dao2.productqnaone(c_Seq);
		
		map.put("onelist", onelist);  
		return map;

	}
	
	@RequestMapping(value = "/productdetailinsertqna")
	@ResponseBody
	public Map<String, Object> insertproductqna(@RequestParam("c_No") String c_No,
			@RequestParam("c_Content") String c_Content,@RequestParam("page") String page,
			 HttpServletRequest request) {
		int pagenumber = Integer.parseInt(page);
		Map<String, Object> map = new HashMap<String, Object>();
		ProductqnaDAO dao2 = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		PageBeen pagebeen = new PageBeen();	
	    int mainno = dao2.maxcmainno(c_No) + 1;
	    MemberBean memberBean = new MemberBean();
	    HttpSession session = request.getSession();
	    memberBean = (MemberBean)session.getAttribute("member");//session member 가져오기.
	    ProductqnaBean productqnabean = new ProductqnaBean();
	    productqnabean.setC_Id(memberBean.getM_Id());//아이디
	    productqnabean.setC_Mainno(mainno);//maino
	    productqnabean.setC_Subno(0);
	    productqnabean.setC_Content(c_Content);
	    productqnabean.setC_No(Integer.parseInt(c_No));
	    productqnabean.setC_Secret("N");
	    dao2.insert(productqnabean);
	    int qnacount = dao2.productqnalistcount(c_No);
	    pagebeen.setLimit(10);
	    pagebeen.setTableindex(qnacount);
	    pagebeen.setSelectpage(pagenumber);
	    pagebeen.setWherecolumn(c_No);
	    List<ProductqnaBean> qnalist = dao2.productqnalist(pagebeen);
	    map.put("pagebeen", pagebeen);
		map.put("qnalist", qnalist);  
		return map;

	}
	
	
	
	@RequestMapping(value = "/productdetailsubqnainsert")
	@ResponseBody
	public Map<String, Object> insertsubproductqna(@RequestParam("c_No") String c_No,
			@RequestParam("c_Content") String c_Content,@RequestParam("page") String page,@RequestParam("c_Seq") String c_Seq,
			 HttpServletRequest request) {
		int pagenumber = Integer.parseInt(page);
		Map<String, Object> map = new HashMap<String, Object>();
		ProductqnaDAO dao2 = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		PageBeen pagebeen = new PageBeen();	
	    int mainno = dao2.mainno(c_Seq);
	    int subno = dao2.maxcsubno(c_Seq)+1;
	    
	    //MemberBean memberBean = new MemberBean();
	    //HttpSession session = request.getSession();
	    //memberBean = (MemberBean)session.getAttribute("member");//session member 가져오기.
	    
	    ProductqnaBean productqnabean = new ProductqnaBean();
	    productqnabean.setC_Id("관리자");//아이디
	    productqnabean.setC_Mainno(mainno);//maino
	    productqnabean.setC_Subno(subno);
	    productqnabean.setC_Content(c_Content);
	    productqnabean.setC_No(Integer.parseInt(c_No));
	    productqnabean.setC_Secret("N");
	    dao2.insert(productqnabean);
	    int qnacount = dao2.productqnalistcount(c_No);
	    pagebeen.setLimit(10);
	    pagebeen.setTableindex(qnacount);
	    pagebeen.setSelectpage(pagenumber);
	    pagebeen.setWherecolumn(c_No);
	    List<ProductqnaBean> qnalist = dao2.productqnalist(pagebeen);
	    map.put("pagebeen", pagebeen);
		map.put("qnalist", qnalist);  
		return map;

	}
	
	@RequestMapping(value = "/productdetailqnaupdate")
	@ResponseBody
	public Map<String, Object> productdetailqnaupdate(@RequestParam("c_No") String c_No,
			@RequestParam("c_Content") String c_Content,@RequestParam("page") String page,@RequestParam("c_Seq") String c_Seq,
			 HttpServletRequest request) {
		int pagenumber = Integer.parseInt(page);
		Map<String, Object> map = new HashMap<String, Object>();
		ProductqnaDAO dao2 = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		PageBeen pagebeen = new PageBeen();	
	    ProductqnaBean productqnabean = new ProductqnaBean();
	    productqnabean.setC_Seq(Integer.parseInt(c_Seq));
	    productqnabean.setC_Content(c_Content);
	    productqnabean.setC_No(Integer.parseInt(c_No));
	    productqnabean.setC_Secret("N");
	    dao2.update(productqnabean);
	    int qnacount = dao2.productqnalistcount(c_No);
	    pagebeen.setLimit(10);
	    pagebeen.setTableindex(qnacount);
	    pagebeen.setSelectpage(pagenumber);
	    pagebeen.setWherecolumn(c_No);
	    List<ProductqnaBean> qnalist = dao2.productqnalist(pagebeen);
	    map.put("pagebeen", pagebeen);
		map.put("qnalist", qnalist);  
		return map;
	}
	
	@RequestMapping(value = "/productdetailqnadelete")
	@ResponseBody
	public Map<String, Object> productdetailqnadelete(@RequestParam("c_No") String c_No,
			@RequestParam("c_Content") String c_Content,@RequestParam("page") String page,@RequestParam("c_Seq") String c_Seq,
			@RequestParam("c_Id") String c_Id) {
		int pagenumber = Integer.parseInt(page);
		System.out.println("동작 되는겨???");
		Map<String, Object> map = new HashMap<String, Object>();
		ProductqnaDAO dao2 = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		PageBeen pagebeen = new PageBeen();	
	    ProductqnaBean productqnabean = new ProductqnaBean();
	    productqnabean.setC_Seq(Integer.parseInt(c_Seq));
	    productqnabean.setC_Content(c_Content);
	    productqnabean.setC_No(Integer.parseInt(c_No));
	    productqnabean.setC_Secret("N");
	    productqnabean.setC_Id(c_Id);
	    System.out.println(productqnabean.getC_Id() + "id값?");
	    System.out.println(productqnabean + "값 빈 뭐임???");
	    dao2.updatedelete(productqnabean);
	    int qnacount = dao2.productqnalistcount(c_No);
	    System.out.println("동작1");
	    pagebeen.setLimit(10);
	    pagebeen.setTableindex(qnacount);
	    pagebeen.setSelectpage(pagenumber);
	    pagebeen.setWherecolumn(c_No);
	    List<ProductqnaBean> qnalist = dao2.productqnalist(pagebeen);
	    System.out.println("동작2");
	    map.put("pagebeen", pagebeen);
		map.put("qnalist", qnalist);  
		System.out.println("동작3");
		return map;
	}
	
	
	
	
	
	@RequestMapping(value = "/productdetailpaging")
	@ResponseBody
	public Map<String, Object> getproductdetailpaging(@RequestParam("page") String page,@RequestParam("c_No") String c_No) {
		int pagenumber = Integer.parseInt(page);
		Map<String, Object> map = new HashMap<String, Object>();
		ProductqnaDAO dao2 = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		PageBeen pagebeen = new PageBeen();
		int qnacount = dao2.productqnalistcount(c_No);
		pagebeen.setLimit(10);
		pagebeen.setTableindex(qnacount);
	    pagebeen.setSelectpage(pagenumber);
	    pagebeen.setWherecolumn(c_No);
	    List<ProductqnaBean> qnalist = dao2.productqnalist(pagebeen);
	    map.put("pagebeen", pagebeen);
		map.put("qnalist", qnalist);  
		return map;
	}


	

	@RequestMapping(value = "/productaccept")
	@ResponseBody
	public String getproductaccept(ProductBean productbean) {

		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		String accept=productbean.getP_Accept();
	
		
		productbean.setP_Accept(accept);
		
		dao.updateaccept(productbean);
		String result = productbean.getP_Accept();

		return result;

	}

	// 테스트 해당 아래 사항 죽임.

	// 관리자 덧글 불러오기.
	@RequestMapping(value = "/productqnaadminlist")
	public String getadmintProductpnalist(Model model, @ModelAttribute("pagebeen") PageBeen pagebeen) {
		ProductqnaDAO dao = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		// where 조건 집어 넣기.
		if (!(pagebeen.getWhere().contains("c_"))) {
			pagebeen.setWhere("c_Id");
			pagebeen.setWhere2("c_Id");
			pagebeen.setOrderby("c_Seq");
			pagebeen.setLimit(10);
		}

		int count = dao.listserachcount();
		pagebeen.setTableindex(count);
		List<ProductqnaBean> productqnalist = dao.listserachpageing(pagebeen);

		

		model.addAttribute("productqnalist", productqnalist);
		model.addAttribute("pagebeen", pagebeen);

		return "product/productqnaadminlist";
	}

	/*
	 * 
	 * @RequestMapping(value="/productbasketchoice") public String
	 * getProductbasketchoice(Model model, @ModelAttribute ("basketbean") BasketBean
	 * basketbean) { String id = basketbean.getBasketbeanList().get(0).getB_Id();
	 * ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class); for(int i=0;
	 * i < basketbean.getBasketbeanList().size() ; i++) {
	 * if(basketbean.getBasketbeanList().get(i).getB_Land() != 0) {
	 * dao.insertbasket(basketbean.getBasketbeanList().get(i));
	 * System.out.println("동작?"); } } model.addAttribute("basketbean",basketbean);
	 * return "/product/test1"; }
	 */
	// 위 사용 중...박정빈

	@RequestMapping(value = "/adminproductlist")
	public String getAdminProductList333(Model model) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<ProductBean> list = dao.list();
		model.addAttribute("productlist", list);
		return "product/productadminlist";
	}
	// 아래 테스트 중....

	@RequestMapping(value = "/productupdateform")
	public String getProductupdateform(Model model, @RequestParam("no") String no,
			@ModelAttribute("productbean") ProductBean productbean) {
		int p_No = Integer.parseInt(no);
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		ProductBean productonelist = dao.onelist(p_No);
		model.addAttribute("productonelist", productonelist);
		model.addAttribute("productbean", productbean);
		
		return "product/productupdateform";
	}

	@RequestMapping(value = "/productupdate")
	public String getProductupdate(Model model, @ModelAttribute("productbean") ProductBean productbean) {

		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int a = dao.update(productbean);
		return "redirect:/productlist";
	}

	@RequestMapping(value = "/productinsertform")
	public String getinsertform(Model model, @ModelAttribute("productbean") ProductBean productbean) {

		model.addAttribute("productbean", productbean);

		return "product/productinsertform";
	}

	@RequestMapping(value = "/productinsert")
	public String getinsert(Model model, @ModelAttribute("productbean") ProductBean productbean) {
		String aaa = productbean.getP_Id();
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		int productinsert = dao.insert(productbean);
		
		return "redirect:/productlist";
	}

	@RequestMapping(value = "/productqnalist")
	public String getProductqna(Model model) {
		ProductqnaDAO dao = sqlSessionTemplate.getMapper(ProductqnaDAO.class);
		List<ProductqnaBean> productqnalist = dao.list();
		model.addAttribute("productqnalist", productqnalist);
		return "product/productqnaList";
	}

	@RequestMapping(value = "/productqnainsertform")
	public String getqnainsertform(Model model, @ModelAttribute("productqna") ProductqnaBean productqna) {

		model.addAttribute("productqna", productqna);

		return "product/productqnainsertform";
	}

	// 김주혁 ///////////////////

	@RequestMapping(value = "/proRegisterForm")
	public String getRegisterform(Model model, @ModelAttribute("product") ProductBean productbean) {
		model.addAttribute("product", productbean);
		return "product/proRegisterForm";
	}

	@RequestMapping(value = "/proLandListForm")
	public String getLandListform(Model model, @ModelAttribute("pagebeen") PageBeen pagebeen) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);

		List<ProductBean> list = dao.list();
		int selecttotalindex = list.size();

		model.addAttribute("productlist", list);
		return "product/proLandListForm";
	}

	@RequestMapping(value = "/ProductRegister", method = RequestMethod.POST) // 농장등록 여기서 동작함.
	public String getreginsert(Model model, @ModelAttribute("product") ProductBean productbean,
			HttpServletRequest request, @RequestParam(value = "p_Img1", required = false) MultipartFile mRequest,
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

		productbean.setP_Img(mRequest.getOriginalFilename());
		productbean.setP_Subimg1(mRequest2.getOriginalFilename());
		productbean.setP_Subimg2(mRequest3.getOriginalFilename());
		productbean.setP_Subimg3(mRequest4.getOriginalFilename());
		productbean.setP_Subimg4(mRequest5.getOriginalFilename());
		productbean.setP_Imgdetail1(mRequest6.getOriginalFilename());
		productbean.setP_Imgdetail2(mRequest7.getOriginalFilename());
		productbean.setP_Imgdetail3(mRequest8.getOriginalFilename());
		productbean.setP_Imgdetail4(mRequest9.getOriginalFilename());
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);// dao
		dao.insert(productbean);
		int pnomax = dao.listmaxpno();
		String path = "D:\\final\\.metadata\\.plugins\\org.eclipse.wst.server.core\\"
				+ "tmp0\\wtpwebapps\\everyfarm\\resources\\upload\\product\\" + pnomax + "\\";
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath = servletContext.getRealPath("/resource");
		System.out.println(realPath + "확인");
		realPath = "D:\\final\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\everyfarm\\resource";
		String mPath = "\\src\\main\\webapp\\resources\\upload\\product\\" + pnomax + "\\";
		int aa = realPath.indexOf("\\.");
		String pre = realPath.substring(0, aa);
		String savePath = pre + "\\everyfarm" + mPath;
		path = savePath;

		File Folder = new File(path);
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}

		String safeFile;
		String originFileName;
		long fileSize;

		for (int i = 0; i < ab.length; i++) {
			originFileName = ab[i].getOriginalFilename(); // 원본 파일 명
			fileSize = ab[i].getSize(); // 파일 사이즈
			safeFile = path + originFileName;
			try {
				// ab[i].transferTo(new File(safeFile));
				if (fileSize > 100) {
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

		return "redirect:/proLandListForm";
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

	// 상품 수정
	@RequestMapping("/proRegDetailForm")
	public String getRegDetail(Model model, @RequestParam int p_No) {
		System.out.println(p_No);
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		ProductBean productinfo = dao.info(p_No);
		System.out.println(productinfo.toString());
		model.addAttribute("productinfo", productinfo);
		return "product/proRegDetailForm";

	}

	@RequestMapping(value = "/ProYList")
	@ResponseBody
	public Map<String, Object> getProYList(Model model, @ModelAttribute("pagebeen") PageBeen pagebeen) {
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		Map<String, Object> map = new HashMap<String, Object>();
		int selecttotalindex = dao.listacceptcount();
		pagebeen.setTableindex(selecttotalindex);
		List<ProductBean> productdesclist = dao.listserachpageing(pagebeen);
		map.put("pagebeen", pagebeen);
		map.put("productlist", productdesclist);
		return map;
	}

	@RequestMapping(value = "/ProNList")
	@ResponseBody
	public Map<String, Object> getProNList(Model model, @ModelAttribute("pagebeen") PageBeen pagebeen) {
		Map<String, Object> map = new HashMap<String, Object>();

		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int selecttotalindex = dao.listacceptncount();
		pagebeen.setTableindex(selecttotalindex);

		List<ProductBean> productdesclist = dao.listserachpageing(pagebeen);

		map.put("pagebeen", pagebeen);
		map.put("productlist", productdesclist);
		return map;
	}

	@RequestMapping("/ProDelete")
	public String getFroDelete(@RequestParam int p_No) {
		System.out.println(p_No);
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int productdelete = dao.delete(p_No);

		return "redirect:/proAdminListForm";
	}

	@RequestMapping("/LandDelete")
	public String getLandDelete(@RequestParam int p_No) {
		System.out.println(p_No);
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int productdelete = dao.delete(p_No);

		return "redirect:/proLandListForm";
	}

	@RequestMapping("/proUpdate")
	public String getFroUpdate(Model model, ProductBean productbean) {
		System.out.println(productbean);
		ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
		int productupdate = dao.update(productbean);
		System.out.println("수정 확인");
		model.addAttribute("P_No", productbean.getP_No());
		return "redirect:/proAdminListForm";
	}

}