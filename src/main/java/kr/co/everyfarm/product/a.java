/*
 * package kr.co.everyfarm.product;
 * 
 * import java.io.File; import java.io.IOException; import
 * java.text.DecimalFormat; import java.util.HashMap; import java.util.List;
 * import java.util.Map;
 * 
 * import javax.servlet.ServletContext; import javax.servlet.http.Cookie; import
 * javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpSession;
 * 
 * import org.mybatis.spring.SqlSessionTemplate; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.ModelAttribute; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.multipart.MultipartFile;
 * 
 * import kr.co.everyfarm.basket.BasketBean; import
 * kr.co.everyfarm.farmer.FarmerBean; import kr.co.everyfarm.user.MemberBean;
 * 
 * @Controller public class ProductController {
 * 
 * @Autowired private SqlSessionTemplate sqlSessionTemplate;
 * 
 * @Autowired ServletContext servletContext; // 아래 박정빈
 * 
 * @RequestMapping(value="/productlist") public String getProductlist(Model
 * model, @ModelAttribute ("pagebeen") PageBeen pagebeen) { ProductDao dao =
 * sqlSessionTemplate.getMapper(ProductDao.class); DecimalFormat decFormat = new
 * DecimalFormat("###,###"); List<ProductBean> productlist =
 * dao.listserachpageingcount(pagebeen); int no = 0; int selecttotalindex =
 * dao.listacceptcount(); pagebeen.setTableindex(selecttotalindex); productlist
 * = dao.listserachacceptpageing(pagebeen);
 * 
 * float[] rateArray = new float[productlist.size()]; String[] pricecomma = new
 * String[productlist.size()]; for(int i=0; i< productlist.size(); i++) { no =
 * productlist.get(i).getP_No(); rateArray[i] = dao.productfrate(no);
 * pricecomma[i] =decFormat.format( productlist.get(i).getP_Landprice()); }
 * 
 * 
 * 
 * model.addAttribute("rateArray", rateArray); model.addAttribute("pricecomma",
 * pricecomma); model.addAttribute("pagebeen",pagebeen);
 * model.addAttribute("productlist",productlist); return "product/productList";
 * }
 * 
 * @RequestMapping(value="/productdetail") public String getProductlist(Model
 * model, @RequestParam("productno") String productno ,@ModelAttribute
 * ("basketbean") BasketBean basketbean,HttpServletRequest request, MemberBean
 * memberBean) { ProductDao dao =
 * sqlSessionTemplate.getMapper(ProductDao.class); int p_No =
 * Integer.parseInt(productno); ProductBean oneproduct = dao.onelist(p_No);
 * //product id 값 가져오고 그 다음 farmer 평점 가져오기.
 * 
 * HttpSession session = request.getSession(); memberBean =
 * (MemberBean)session.getAttribute("member");//Farmer,admin,member 처리. //rate
 * 가져오기. float f_rate = dao.productfrate(p_No); //view 카운터 올리기 int p_View =
 * dao.viewpno(p_No); p_View= p_View+1; ProductBean productbean = new
 * ProductBean(); productbean.setP_No(p_No); productbean.setP_View(p_View);
 * dao.updateview(productbean); //view 카운터 올리기
 * 
 * if(memberBean != null) {
 * 
 * model.addAttribute("mid",memberBean.getM_Id()); }else {
 * model.addAttribute("mid",""); } //아래 댓글 ProductqnaDAO dao2 =
 * sqlSessionTemplate.getMapper(ProductqnaDAO.class); PageBeen pagebeen = new
 * PageBeen(); int qnacount = dao2.productqnalistcount(productno);
 * pagebeen.setLimit(10); pagebeen.setTableindex(qnacount);
 * pagebeen.setWherecolumn(productno); List<ProductqnaBean> qnalist =
 * dao2.productqnalist(pagebeen);
 * 
 * model.addAttribute("p_No",p_No); model.addAttribute("pagebeen",pagebeen);
 * model.addAttribute("qnalist",qnalist); model.addAttribute("f_rate",f_rate);
 * model.addAttribute("oneproduct",oneproduct);
 * 
 * return "/product/productdetail";
 * 
 * }
 * 
 * 
 * 
 * @RequestMapping(value="/productbasketchoice") public String
 * getProductbasketchoice(Model model, @ModelAttribute ("basketbean") BasketBean
 * basketbean, HttpServletRequest request,MemberBean memberBean) {
 * 
 * List<BasketBean> list = basketbean.getBasketbeanList(); int j = list.size();
 * ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class); //int pno =
 * basketbean.getBasketbeanList().get(0).getB_Pno(); for(int i =0; i<j; i++) {
 * if(list.get(i).getB_Land()<=0) { list.remove(i); j--; i--; } } //장바구니로 간다.
 * 
 * 
 * for(int i=0; i < basketbean.getBasketbeanList().size() ; i++) {
 * if(basketbean.getBasketbeanList().get(i).getB_Land() != 0) {
 * dao.insertbasket(basketbean.getBasketbeanList().get(i)); } }
 * basketbean.setBasketbeanList(list);
 * model.addAttribute("basketbean",basketbean); //String url =
 * "redirect:/productdetail"+"?productno="+pno; return "redirect:/basket"; }
 * 
 * 
 * 
 * @RequestMapping(value="/productpayment") public String
 * getproductpayment(Model model, @ModelAttribute ("basketbean") BasketBean
 * basketbean) { List<BasketBean> list = basketbean.getBasketbeanList();
 * 
 * int j = list.size(); for(int i =0; i<j; i++) { if(list.get(i).getB_Land()<=0)
 * { list.remove(i); j--; i--; } } basketbean.setBasketbeanList(list);
 * 
 * model.addAttribute("memBasketModel",basketbean); return "/product/test1";
 * 
 * } // 테스트 해당 아래 사항 죽음
 * 
 * 
 * 
 * @RequestMapping(value = "/productlistpage")
 * 
 * @ResponseBody public Map<String, Object> getproductlistpage(Model model,
 * PageBeen pagebeen) {
 * 
 * Map<String, Object> map = new HashMap<String, Object>(); ProductDao dao =
 * sqlSessionTemplate.getMapper(ProductDao.class); DecimalFormat decFormat = new
 * DecimalFormat("###,###");
 * 
 * List<ProductBean> productlist = dao.listserachpageingcount(pagebeen); int no
 * = 0; int selecttotalindex = dao.listacceptcount();
 * 
 * pagebeen.setTableindex(selecttotalindex); productlist =
 * dao.listserachacceptpageing(pagebeen);
 * 
 * 
 * float[] rateArray = new float[productlist.size()]; String[] pricecomma = new
 * String[productlist.size()]; for(int i=0; i< productlist.size(); i++) { no =
 * productlist.get(i).getP_No(); rateArray[i] = dao.productfrate(no);
 * pricecomma[i] =decFormat.format( productlist.get(i).getP_Landprice()); }
 * 
 * map.put("pricecomma", pricecomma); map.put("rateArray", rateArray);
 * map.put("productlist", productlist); map.put("pagebeen", pagebeen);
 * 
 * return map;
 * 
 * }
 * 
 * 
 * @RequestMapping(value = "/productdetailoneqna")
 * 
 * @ResponseBody public Map<String, Object>
 * productdetailoneqna(@RequestParam("c_No") String c_No,@RequestParam("c_Seq")
 * String c_Seq) {
 * 
 * Map<String, Object> map = new HashMap<String, Object>(); ProductqnaDAO dao2 =
 * sqlSessionTemplate.getMapper(ProductqnaDAO.class); ProductqnaBean onelist =
 * dao2.productqnaone(c_Seq); map.put("onelist", onelist); return map; }
 * 
 * @RequestMapping(value = "/productdetailinsertqna")
 * 
 * @ResponseBody public Map<String, Object>
 * insertproductqna(@RequestParam("c_No") String c_No,
 * 
 * @RequestParam("c_Content") String c_Content,@RequestParam("page") String
 * page, HttpServletRequest request) { int pagenumber = Integer.parseInt(page);
 * Map<String, Object> map = new HashMap<String, Object>(); ProductqnaDAO dao2 =
 * sqlSessionTemplate.getMapper(ProductqnaDAO.class); PageBeen pagebeen = new
 * PageBeen(); int mainno = dao2.maxcmainno(c_No) + 1; MemberBean memberBean =
 * new MemberBean(); HttpSession session = request.getSession(); memberBean =
 * (MemberBean)session.getAttribute("member");//session member 가져오기.
 * ProductqnaBean productqnabean = new ProductqnaBean();
 * productqnabean.setC_Id(memberBean.getM_Id());//아이디
 * productqnabean.setC_Mainno(mainno);//maino productqnabean.setC_Subno(0);
 * productqnabean.setC_Content(c_Content);
 * productqnabean.setC_No(Integer.parseInt(c_No));
 * productqnabean.setC_Secret("N"); dao2.insert(productqnabean); int qnacount =
 * dao2.productqnalistcount(c_No); pagebeen.setLimit(10);
 * pagebeen.setTableindex(qnacount); pagebeen.setSelectpage(pagenumber);
 * pagebeen.setWherecolumn(c_No); List<ProductqnaBean> qnalist =
 * dao2.productqnalist(pagebeen); map.put("pagebeen", pagebeen);
 * map.put("qnalist", qnalist); return map;
 * 
 * }
 * 
 * 
 * 
 * @RequestMapping(value = "/productdetailsubqnainsert")
 * 
 * @ResponseBody public Map<String, Object>
 * insertsubproductqna(@RequestParam("c_No") String c_No,
 * 
 * @RequestParam("c_Content") String c_Content,@RequestParam("page") String
 * page,@RequestParam("c_Seq") String c_Seq, HttpServletRequest request) { int
 * pagenumber = Integer.parseInt(page); Map<String, Object> map = new
 * HashMap<String, Object>(); ProductqnaDAO dao2 =
 * sqlSessionTemplate.getMapper(ProductqnaDAO.class); PageBeen pagebeen = new
 * PageBeen(); int mainno = dao2.mainno(c_Seq); int subno =
 * dao2.maxcsubno(c_Seq)+1;
 * 
 * //MemberBean memberBean = new MemberBean(); //HttpSession session =
 * request.getSession(); //memberBean =
 * (MemberBean)session.getAttribute("member");//session member 가져오기.
 * 
 * ProductqnaBean productqnabean = new ProductqnaBean();
 * productqnabean.setC_Id("관리자");//아이디
 * productqnabean.setC_Mainno(mainno);//maino productqnabean.setC_Subno(subno);
 * productqnabean.setC_Content(c_Content);
 * productqnabean.setC_No(Integer.parseInt(c_No));
 * productqnabean.setC_Secret("N"); dao2.insert(productqnabean); int qnacount =
 * dao2.productqnalistcount(c_No); pagebeen.setLimit(10);
 * pagebeen.setTableindex(qnacount); pagebeen.setSelectpage(pagenumber);
 * pagebeen.setWherecolumn(c_No); List<ProductqnaBean> qnalist =
 * dao2.productqnalist(pagebeen); map.put("pagebeen", pagebeen);
 * map.put("qnalist", qnalist); return map;
 * 
 * }
 * 
 * @RequestMapping(value = "/productdetailqnaupdate")
 * 
 * @ResponseBody public Map<String, Object>
 * productdetailqnaupdate(@RequestParam("c_No") String c_No,
 * 
 * @RequestParam("c_Content") String c_Content,@RequestParam("page") String
 * page,@RequestParam("c_Seq") String c_Seq, HttpServletRequest request) { int
 * pagenumber = Integer.parseInt(page); Map<String, Object> map = new
 * HashMap<String, Object>(); ProductqnaDAO dao2 =
 * sqlSessionTemplate.getMapper(ProductqnaDAO.class); PageBeen pagebeen = new
 * PageBeen(); ProductqnaBean productqnabean = new ProductqnaBean();
 * productqnabean.setC_Seq(Integer.parseInt(c_Seq));
 * productqnabean.setC_Content(c_Content);
 * productqnabean.setC_No(Integer.parseInt(c_No));
 * productqnabean.setC_Secret("N"); dao2.update(productqnabean); int qnacount =
 * dao2.productqnalistcount(c_No); pagebeen.setLimit(10);
 * pagebeen.setTableindex(qnacount); pagebeen.setSelectpage(pagenumber);
 * pagebeen.setWherecolumn(c_No); List<ProductqnaBean> qnalist =
 * dao2.productqnalist(pagebeen); map.put("pagebeen", pagebeen);
 * map.put("qnalist", qnalist); return map; }
 * 
 * @RequestMapping(value = "/productdetailqnadelete")
 * 
 * @ResponseBody public Map<String, Object>
 * productdetailqnadelete(@RequestParam("c_No") String c_No,
 * 
 * @RequestParam("c_Content") String c_Content,@RequestParam("page") String
 * page,@RequestParam("c_Seq") String c_Seq,
 * 
 * @RequestParam("c_Id") String c_Id) { int pagenumber = Integer.parseInt(page);
 * Map<String, Object> map = new HashMap<String, Object>(); ProductqnaDAO dao2 =
 * sqlSessionTemplate.getMapper(ProductqnaDAO.class); PageBeen pagebeen = new
 * PageBeen(); ProductqnaBean productqnabean = new ProductqnaBean();
 * productqnabean.setC_Seq(Integer.parseInt(c_Seq));
 * productqnabean.setC_Content(c_Content);
 * productqnabean.setC_No(Integer.parseInt(c_No));
 * productqnabean.setC_Secret("N"); productqnabean.setC_Id(c_Id);
 * dao2.updatedelete(productqnabean); int qnacount =
 * dao2.productqnalistcount(c_No); pagebeen.setLimit(10);
 * pagebeen.setTableindex(qnacount); pagebeen.setSelectpage(pagenumber);
 * pagebeen.setWherecolumn(c_No); List<ProductqnaBean> qnalist =
 * dao2.productqnalist(pagebeen); map.put("pagebeen", pagebeen);
 * map.put("qnalist", qnalist); return map; }
 * 
 * 
 * 
 * 
 * 
 * @RequestMapping(value = "/productdetailpaging")
 * 
 * @ResponseBody public Map<String, Object>
 * getproductdetailpaging(@RequestParam("page") String
 * page,@RequestParam("c_No") String c_No) { int pagenumber =
 * Integer.parseInt(page); Map<String, Object> map = new HashMap<String,
 * Object>(); ProductqnaDAO dao2 =
 * sqlSessionTemplate.getMapper(ProductqnaDAO.class); PageBeen pagebeen = new
 * PageBeen(); int qnacount = dao2.productqnalistcount(c_No);
 * pagebeen.setLimit(10); pagebeen.setTableindex(qnacount);
 * pagebeen.setSelectpage(pagenumber); pagebeen.setWherecolumn(c_No);
 * List<ProductqnaBean> qnalist = dao2.productqnalist(pagebeen);
 * map.put("pagebeen", pagebeen); map.put("qnalist", qnalist); return map; }
 * 
 * 
 * 
 * 
 * @RequestMapping(value = "/productaccept")
 * 
 * @ResponseBody public String getproductaccept(ProductBean productbean) {
 * 
 * ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class);
 * 
 * String accept=productbean.getP_Accept();
 * 
 * 
 * productbean.setP_Accept(accept);
 * 
 * dao.updateaccept(productbean); String result = productbean.getP_Accept();
 * 
 * return result;
 * 
 * }
 * 
 * 
 * 
 * // 테스트 해당 아래 사항 죽임.
 * 
 * // 관리자 덧글 불러오기.
 * 
 * 
 * // 위 사용 중...박정빈
 * 
 * @RequestMapping(value = "/adminproductlist") public String
 * getAdminProductList333(Model model) { ProductDao dao =
 * sqlSessionTemplate.getMapper(ProductDao.class); List<ProductBean> list =
 * dao.list(); model.addAttribute("productlist", list); return
 * "product/productadminlist"; } // 아래 테스트 중....
 * 
 * 
 * 
 * 
 * 
 * // 김주혁 ///////////////////
 * 
 * @RequestMapping(value = "/proRegisterForm") public String
 * getRegisterform(Model model, @ModelAttribute("product") ProductBean
 * productbean) { model.addAttribute("product", productbean); return
 * "product/proRegisterForm"; }
 * 
 * @RequestMapping(value = "/proLandListForm") public String
 * getLandListform(Model model, HttpServletRequest request,
 * 
 * @ModelAttribute("pagebeen") PageBeen pagebeen) { FarmerBean farmer =
 * (FarmerBean) request.getSession().getAttribute("farmer"); String P_Id =
 * farmer.getF_Id(); ProductDao dao =
 * sqlSessionTemplate.getMapper(ProductDao.class); List<ProductBean> listland =
 * dao.listland(P_Id); int selecttotalindex = listland.size();
 * model.addAttribute("productlist", listland); return
 * "product/proLandListForm";
 * 
 * }
 * 
 * @RequestMapping(value = "/ProductRegister", method = RequestMethod.POST) //
 * 농장등록 여기서 동작함. public String getreginsert(Model
 * model, @ModelAttribute("product") ProductBean productbean, HttpServletRequest
 * request, @RequestParam(value = "p_Img1", required = false) MultipartFile
 * mRequest,
 * 
 * @RequestParam(value = "p_Subimg12", required = false) MultipartFile
 * mRequest2,
 * 
 * @RequestParam(value = "p_Subimg22", required = false) MultipartFile
 * mRequest3,
 * 
 * @RequestParam(value = "p_Subimg32", required = false) MultipartFile
 * mRequest4,
 * 
 * @RequestParam(value = "p_Subimg42", required = false) MultipartFile
 * mRequest5,
 * 
 * @RequestParam(value = "p_Imgdetail12", required = false) MultipartFile
 * mRequest6,
 * 
 * @RequestParam(value = "p_Imgdetail22", required = false) MultipartFile
 * mRequest7,
 * 
 * @RequestParam(value = "p_Imgdetail32", required = false) MultipartFile
 * mRequest8,
 * 
 * @RequestParam(value = "p_Imgdetail42", required = false) MultipartFile
 * mRequest9) { MultipartFile[] ab = { mRequest, mRequest2, mRequest3,
 * mRequest4, mRequest5, mRequest6, mRequest7, mRequest8, mRequest9 };
 * 
 * HttpSession session = request.getSession(); String root_path =
 * session.getServletContext().getRealPath("/"); productbean.setP_Accept("N");
 * productbean.setP_Img(mRequest.getOriginalFilename());
 * productbean.setP_Subimg1(mRequest2.getOriginalFilename());
 * productbean.setP_Subimg2(mRequest3.getOriginalFilename());
 * productbean.setP_Subimg3(mRequest4.getOriginalFilename());
 * productbean.setP_Subimg4(mRequest5.getOriginalFilename());
 * productbean.setP_Imgdetail1(mRequest6.getOriginalFilename());
 * productbean.setP_Imgdetail2(mRequest7.getOriginalFilename());
 * productbean.setP_Imgdetail3(mRequest8.getOriginalFilename());
 * productbean.setP_Imgdetail4(mRequest9.getOriginalFilename()); ProductDao dao
 * = sqlSessionTemplate.getMapper(ProductDao.class);// dao
 * dao.insert(productbean); int pnomax = dao.listmaxpno(); String path =
 * root_path + "resources/upload/product/" + pnomax + "/"; ServletContext
 * servletContext = request.getSession().getServletContext(); String realPath =
 * servletContext.getRealPath("/resources"); String savePath = realPath +
 * "/upload/product/" + pnomax + "/"; path = savePath;
 * 
 * File Folder = new File(path); if (!Folder.exists()) { try { Folder.mkdir();
 * // 폴더 생성합니다. } catch (Exception e) { e.getStackTrace(); } } else { }
 * 
 * String safeFile; String originFileName; long fileSize;
 * 
 * for (int i = 0; i < ab.length; i++) { originFileName =
 * ab[i].getOriginalFilename(); // 원본 파일 명 fileSize = ab[i].getSize(); // 파일 사이즈
 * safeFile = path + originFileName; try { // ab[i].transferTo(new
 * File(safeFile)); if (fileSize > 100) { ab[i].transferTo(new File(safeFile));
 * }
 * 
 * } catch (IllegalStateException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
 * block e.printStackTrace(); } }
 * 
 * return "redirect:/proLandListForm"; }
 * 
 * @RequestMapping(value = "/proAdminListForm") public String
 * getAdminProductList(Model model, @ModelAttribute("pagebeen") PageBeen
 * pagebeen, HttpServletRequest request) { ProductDao dao =
 * sqlSessionTemplate.getMapper(ProductDao.class);
 * 
 * /// List<ProductBean> list = dao.list(); int limit = 10;
 * pagebeen.setLimit(limit); List<ProductBean> list =
 * dao.listserachpageingcount(pagebeen); int selecttotalindex = list.size();
 * pagebeen.setTableindex(selecttotalindex); list =
 * dao.listserachpageing(pagebeen);
 * 
 * model.addAttribute("productlist", list);
 * 
 * // 수정
 * 
 * HttpSession session = request.getSession(); String root_path =
 * session.getServletContext().getRealPath("/"); String path = root_path +
 * "resources/upload/product/";
 * 
 * model.addAttribute("rootpath", path);
 * 
 * return "product/proAdminListForm"; }
 * 
 * // 상품 수정
 * 
 * @RequestMapping("/proRegDetailForm") public String getRegDetail(Model
 * model, @RequestParam int p_No) { ProductDao dao =
 * sqlSessionTemplate.getMapper(ProductDao.class); ProductBean productinfo =
 * dao.info(p_No); model.addAttribute("productinfo", productinfo); return
 * "product/proRegDetailForm";
 * 
 * }
 * 
 * @RequestMapping(value = "/ProYList") public String getProYList(Model model) {
 * PageBeen pagebeen = new PageBeen(); ProductDao dao =
 * sqlSessionTemplate.getMapper(ProductDao.class); int limit = 10;
 * pagebeen.setLimit(limit); pagebeen.setOffset(0);
 * pagebeen.setWhere("p_Accept"); pagebeen.setWherecolumn("Y");
 * List<ProductBean> productasclist = dao.desclist(pagebeen); int
 * selecttotalindex = dao.listacceptcount();
 * pagebeen.setTableindex(selecttotalindex); productasclist =
 * dao.desclist(pagebeen); model.addAttribute("productp_Accept", "AcceptY");
 * model.addAttribute("productlist", productasclist);
 * model.addAttribute("pagebeen", pagebeen);
 * 
 * 
 * return "product/proAdminListForm"; }
 * 
 * @RequestMapping(value = "/ProNList") public String getProNList(Model model) {
 * PageBeen pagebeen = new PageBeen(); ProductDao dao =
 * sqlSessionTemplate.getMapper(ProductDao.class); int limit = 10;
 * pagebeen.setLimit(limit); pagebeen.setOffset(0);
 * pagebeen.setWhere("p_Accept"); pagebeen.setWherecolumn("N");
 * List<ProductBean> productdesclist = dao.asclist(pagebeen); int
 * selecttotalindex = dao.listacceptncount();
 * pagebeen.setTableindex(selecttotalindex); productdesclist =
 * dao.asclist(pagebeen); model.addAttribute("productp_Accept", "AcceptN");
 * model.addAttribute("productlist", productdesclist);
 * model.addAttribute("pagebeen", pagebeen);
 * 
 * return "product/proAdminListForm"; }
 * 
 * @RequestMapping("/ProDelete") public String getFroDelete(@RequestParam int
 * p_No) { ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class); int
 * productdelete = dao.delete(p_No);
 * 
 * return "redirect:/proAdminListForm"; }
 * 
 * @RequestMapping("/LandDelete") public String getLandDelete(@RequestParam int
 * p_No) { ProductDao dao = sqlSessionTemplate.getMapper(ProductDao.class); int
 * productdelete = dao.delete(p_No);
 * 
 * return "redirect:/proLandListForm"; }
 * 
 * @RequestMapping("/proUpdate") public String getFroUpdate(Model
 * model, @ModelAttribute("product") ProductBean productbean, HttpServletRequest
 * request, @RequestParam(value = "p_Img1", required = false) MultipartFile
 * mRequest,
 * 
 * @RequestParam(value = "p_Subimg12", required = false) MultipartFile
 * mRequest2,
 * 
 * @RequestParam(value = "p_Subimg22", required = false) MultipartFile
 * mRequest3,
 * 
 * @RequestParam(value = "p_Subimg32", required = false) MultipartFile
 * mRequest4,
 * 
 * @RequestParam(value = "p_Subimg42", required = false) MultipartFile
 * mRequest5,
 * 
 * @RequestParam(value = "p_Imgdetail12", required = false) MultipartFile
 * mRequest6,
 * 
 * @RequestParam(value = "p_Imgdetail22", required = false) MultipartFile
 * mRequest7,
 * 
 * @RequestParam(value = "p_Imgdetail32", required = false) MultipartFile
 * mRequest8,
 * 
 * @RequestParam(value = "p_Imgdetail42", required = false) MultipartFile
 * mRequest9) { MultipartFile[] ab = { mRequest, mRequest2, mRequest3,
 * mRequest4, mRequest5, mRequest6, mRequest7, mRequest8, mRequest9 };
 * HttpSession session = request.getSession(); String root_path =
 * session.getServletContext().getRealPath("/");
 * productbean.setP_Img(mRequest.getOriginalFilename());
 * productbean.setP_Subimg1(mRequest2.getOriginalFilename());
 * productbean.setP_Subimg2(mRequest3.getOriginalFilename());
 * productbean.setP_Subimg3(mRequest4.getOriginalFilename());
 * productbean.setP_Subimg4(mRequest5.getOriginalFilename());
 * productbean.setP_Imgdetail1(mRequest6.getOriginalFilename());
 * productbean.setP_Imgdetail2(mRequest7.getOriginalFilename());
 * productbean.setP_Imgdetail3(mRequest8.getOriginalFilename());
 * productbean.setP_Imgdetail4(mRequest9.getOriginalFilename()); ProductDao dao
 * = sqlSessionTemplate.getMapper(ProductDao.class);// dao
 * 
 * 
 * int pnomax = productbean.getP_No(); String path = root_path +
 * "resources/upload/product/" + pnomax + "/"; ServletContext servletContext =
 * request.getSession().getServletContext(); String realPath =
 * servletContext.getRealPath("/resources"); String savePath = realPath +
 * "/upload/product/" + pnomax + "/"; path = savePath;
 * 
 * Cookie[] cookie = request.getCookies(); for (int i = 0; i < cookie.length;
 * i++) { cookie[i].setMaxAge(0); }
 * 
 * File Folder = new File(path); if (!Folder.exists()) { try { Folder.mkdir();
 * // 폴더 생성합니다. } catch (Exception e) { e.getStackTrace(); } } else { }
 * 
 * String safeFile; String originFileName; long fileSize;
 * 
 * for (int i = 0; i < ab.length; i++) { originFileName =
 * ab[i].getOriginalFilename(); // 원본 파일 명 fileSize = ab[i].getSize(); // 파일 사이즈
 * safeFile = path + originFileName; File oldfile = new File(safeFile);
 * 
 * try { // ab[i].transferTo(new File(safeFile)); if (fileSize > 100) { if
 * (oldfile.exists()) { oldfile.delete(); } ab[i].transferTo(new
 * File(safeFile)); model.addAttribute("safeFile", safeFile); }
 * 
 * } catch (IllegalStateException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
 * block e.printStackTrace(); } } dao.update(productbean);
 * model.addAttribute("P_No", productbean.getP_No());
 * 
 * return "redirect:/proAdminListForm"; }
 * 
 * }
 * 
 */