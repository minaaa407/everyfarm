package kr.co.everyfarm.product;

import java.util.HashMap;
import java.util.List;

import kr.co.everyfarm.basket.BasketBean;

public interface ProductDao {
	
	public List<ProductBean> list();
	public List<ProductBean> listpageing(PageBeen pagebeen);
	public List<ProductBean> listserachpageing(PageBeen pagebeen);
	public List<ProductBean> listserachpageingcount(PageBeen pagebeen);
	public List<ProductBean> listserachacceptpageing(PageBeen pagebeen);
	public List<ProductBean> desclist(PageBeen pagebeen);
	public List<ProductBean> asclist(PageBeen pagebeen);
	public List<ProductBean> farmerproductlist(PageBeen pagebeen);
	public List<ProductBean> farmerproductlistY(PageBeen pagebeen);
	public List<ProductBean> farmerproductlistN(PageBeen pagebeen);
	

	public List<ProductBean> listacceptpageing(PageBeen pagebeen);
	public int productpaymentchart(HashMap<String, Object> map);
	public int adminproductpaymentchart(HashMap<String, Object> map);
	
	
	
	public int listcount();
	public int listacceptcount();
	public int listacceptncount();
	public int farmerlistacceptcount(PageBeen pagebeen);
	public int farmerlistacceptncount(PageBeen pagebeen);
	
	
	public int farmerlistcount(PageBeen pagebeen);
	public ProductBean info(int productno);
	public ProductBean onelist(int p_No);
	public int insert(ProductBean product);
	public int update(ProductBean product);
	
	public int delete(int productno);
	public int insertbasket(BasketBean basket);
	public int listmaxpno();
	public int updateaccept(ProductBean product);
	public int viewpno(int p_No);
	public int updateview(ProductBean product);
	public float productfrate(int p_No);
	

	List<ProductBean> viewList();
	
	public ProductBean productinfo(String p_No);
	public List<ProductBean> listland(PageBeen pagebeen);
}
